<#
.SYNOPSIS
    Initialize the AI Learning Workspace from template to personalized workspace.

.DESCRIPTION
    Reads config.json, renames directories to user-defined names,
    replaces all instantiation placeholders in all template files.

    Contextual placeholders (Category C) are intentionally left untouched —
    those are filled in during daily use by the user or AI.

.PARAMETER ConfigPath
    Path to config.json. Defaults to ".\config.json" in the current directory.

.PARAMETER DryRun
    Preview all changes without modifying anything. Recommended before first run.

.EXAMPLE
    .\init.ps1 -DryRun

.EXAMPLE
    .\init.ps1

.EXAMPLE
    .\init.ps1 -ConfigPath ".\my-config.json"
#>

param(
    [string]$ConfigPath = ".\config.json",
    [switch]$DryRun
)

# ============================================================
# Step 1: Validate and Load Configuration
# ============================================================

$ErrorActionPreference = "Stop"

if (-not (Test-Path $ConfigPath)) {
    Write-Error "config.json not found at '$ConfigPath'. Run this script from the workspace root directory."
    exit 1
}

try {
    $config = Get-Content $ConfigPath -Raw -Encoding UTF8 | ConvertFrom-Json
} catch {
    Write-Error "Failed to parse config.json. Ensure it is valid JSON."
    Write-Error $_.Exception.Message
    exit 1
}

# Validate required top-level sections
$requiredSections = @("workspace", "directories", "learning", "claude")
foreach ($section in $requiredSections) {
    if (-not $config.$section) {
        Write-Error "config.json is missing required section: '$section'"
        exit 1
    }
}

# Validate workspace fields
$requiredWorkspace = @("name", "title", "author", "language", "goal", "startDate", "estimatedDuration")
foreach ($field in $requiredWorkspace) {
    if (-not $config.workspace.$field) {
        Write-Error "config.json 'workspace' section is missing required field: '$field'"
        exit 1
    }
}

# Validate required directory fields
$requiredDirs = @("notes", "journal", "exercises", "projects", "review",
                   "snippets", "resources", "prompts", "docs", "scripts")
foreach ($field in $requiredDirs) {
    if (-not $config.directories.$field) {
        Write-Error "config.json 'directories' section is missing required field: '$field'"
        exit 1
    }
}

Write-Host "Configuration loaded and validated." -ForegroundColor Green
if ($DryRun) {
    Write-Host "--- DRY RUN MODE --- No files will be modified. ---" -ForegroundColor Yellow
}
Write-Host ""

# ============================================================
# Step 2: Build Placeholder Replacement Map
# ============================================================

$placeholderMap = @{}

# Category A: Workspace metadata
$placeholderMap['{{WORKSPACE_NAME}}']  = $config.workspace.name
$placeholderMap['{{WORKSPACE_TITLE}}'] = $config.workspace.title
$placeholderMap['{{AUTHOR}}']          = $config.workspace.author
$placeholderMap['{{LANGUAGE}}']        = $config.workspace.language
$placeholderMap['{{GOAL}}']            = $config.workspace.goal
$placeholderMap['{{START_DATE}}']      = $config.workspace.startDate
$placeholderMap['{{DURATION}}']        = $config.workspace.estimatedDuration
$placeholderMap['{{DAILY_HOURS}}']     = $config.learning.dailyHours.ToString()
$placeholderMap['{{REVIEW_DAY}}']      = $config.learning.weeklyReviewDay
$placeholderMap['{{REVIEW_CYCLE}}']    = $config.learning.reviewCycleDays.ToString()
$placeholderMap['{{CLAUDE_LANG}}']     = $config.claude.communicationLanguage
$placeholderMap['{{EXPERTISE}}']       = $config.claude.expertiseArea

# Category B: Directory paths
$dirMap = @{
    '{{DIR_NOTES}}'     = $config.directories.notes
    '{{DIR_JOURNAL}}'   = $config.directories.journal
    '{{DIR_EXERCISES}}' = $config.directories.exercises
    '{{DIR_PROJECTS}}'  = $config.directories.projects
    '{{DIR_REVIEW}}'    = $config.directories.review
    '{{DIR_SNIPPETS}}'  = $config.directories.snippets
    '{{DIR_RESOURCES}}' = $config.directories.resources
    '{{DIR_PROMPTS}}'   = $config.directories.prompts
    '{{DIR_DOCS}}'      = $config.directories.docs
    '{{DIR_SCRIPTS}}'   = $config.directories.scripts
}
foreach ($key in $dirMap.Keys) {
    $placeholderMap[$key] = $dirMap[$key]
}

Write-Host "Placeholder map built: $($placeholderMap.Count) replacements configured."
Write-Host ""

# ============================================================
# Step 3: Rename Directories (if customized)
# ============================================================

Write-Host "--- Directory Rename ---" -ForegroundColor Cyan

# Map placeholder keys to default directory names
$defaultNames = @{
    '{{DIR_NOTES}}'     = 'notes'
    '{{DIR_JOURNAL}}'   = 'journal'
    '{{DIR_EXERCISES}}' = 'exercises'
    '{{DIR_PROJECTS}}'  = 'projects'
    '{{DIR_REVIEW}}'    = 'review'
    '{{DIR_SNIPPETS}}'  = 'snippets'
    '{{DIR_RESOURCES}}' = 'resources'
    '{{DIR_PROMPTS}}'   = 'prompts'
    '{{DIR_DOCS}}'      = 'docs'
    '{{DIR_SCRIPTS}}'   = 'scripts'
}

$renamedCount = 0

foreach ($key in $dirMap.Keys) {
    $customName = $dirMap[$key]
    $defaultName = $defaultNames[$key]

    if ($defaultName -ne $customName) {
        if (Test-Path $defaultName) {
            Write-Host "  Rename: '$defaultName' -> '$customName'"
            if (-not $DryRun) {
                Rename-Item -Path $defaultName -NewName $customName
            }
            $renamedCount++
        } elseif (Test-Path $customName) {
            Write-Host "  Skip: '$customName' already exists (no rename needed)"
        } else {
            Write-Warning "  Directory '$defaultName' not found, skipping rename."
        }
    }
}

if ($renamedCount -eq 0) {
    Write-Host "  No directories need renaming."
}
Write-Host ""

# ============================================================
# Step 4: Replace Placeholders in All Files
# ============================================================

Write-Host "--- Placeholder Replacement ---" -ForegroundColor Cyan

# File extensions to process (text-based files only)
$textExtensions = @(
    '.md', '.json', '.yaml', '.yml', '.txt', '.gitignore',
    '.ps1', '.sh', '.py', '.js', '.ts', '.html', '.css',
    '.cpp', '.hpp', '.c', '.h', '.rs', '.go', '.java',
    '.toml', '.cfg', '.ini', '.xml', '.csv',
    '.code-workspace'
)

# Directories to exclude from processing
$excludeDirs = @('.git', 'node_modules', '__pycache__', '.venv', 'venv', 'target', 'build')

# Get all text files, excluding excluded directories
$allFiles = Get-ChildItem -Recurse -File
$files = @()
foreach ($file in $allFiles) {
    # Skip excluded directories
    $inExcludedDir = $false
    foreach ($exDir in $excludeDirs) {
        # Check if any path component matches an excluded directory
        $pathParts = $file.FullName -split '[\\/]'
        if ($pathParts -contains $exDir) {
            $inExcludedDir = $true
            break
        }
    }
    if ($inExcludedDir) { continue }

    # Check file extension
    $ext = $file.Extension.ToLower()
    # Handle special case: .gitignore has no extension
    $fileName = $file.Name.ToLower()
    if ($textExtensions -contains $ext -or $fileName -eq '.gitignore') {
        $files += $file
    }
}

$filesProcessed = 0
$replacementsTotal = 0

foreach ($file in $files) {
    # Skip this script itself — it contains placeholder strings as hash keys
    if ($file.Name -eq 'init.ps1') { continue }
    # Skip the design brief — it's the source document, not a template deliverable
    if ($file.Name -eq 'prompt.md') { continue }

    try {
        $content = Get-Content $file.FullName -Raw -Encoding UTF8 -ErrorAction Stop
    } catch {
        Write-Warning "  Skipping binary/unreadable file: $($file.Name)"
        continue
    }

    $fileChanged = $false
    $fileReplacements = 0

    foreach ($placeholder in $placeholderMap.Keys) {
        $replacement = $placeholderMap[$placeholder]
        if ($content.Contains($placeholder)) {
            $content = $content.Replace($placeholder, $replacement)
            $fileChanged = $true
            $fileReplacements++
        }
    }

    if ($fileChanged) {
        $relativePath = $file.FullName.Substring((Get-Location).Path.Length + 1)
        Write-Host "  Replaced $fileReplacements placeholder(s) in: $relativePath"
        if (-not $DryRun) {
            Set-Content $file.FullName -Value $content -Encoding UTF8 -NoNewline
        }
        $filesProcessed++
        $replacementsTotal += $fileReplacements
    }
}

Write-Host ""
Write-Host "Files processed: $filesProcessed"
Write-Host "Total replacements: $replacementsTotal"
Write-Host ""

# ============================================================
# Step 5: Summary
# ============================================================

Write-Host "=== Initialization Complete ===" -ForegroundColor Green
Write-Host ""

if ($DryRun) {
    Write-Host "This was a DRY RUN. No files were modified." -ForegroundColor Yellow
    Write-Host "Remove the -DryRun flag to apply changes."
    Write-Host ""
}

# Category C: Contextual placeholders (NOT replaced)
$contextualPlaceholders = @(
    '{{DATE}}',
    '{{WEEK_NUMBER}}',
    '{{CURRENT_TOPIC}}',
    '{{TODAY_SUMMARY}}',
    '{{TODAY_HOURS}}',
    '{{TODAY_QUESTIONS}}',
    '{{TODAY_RESOURCES}}',
    '{{NEXT_STEPS}}',
    '{{PROJECT_NAME}}',
    '{{CONCEPT_NAME}}',
    '{{WEEK_REVIEW_SUMMARY}}',
    '{{IMPROVEMENT_AREAS}}'
)

Write-Host "Contextual placeholders (NOT replaced by this script):" -ForegroundColor Cyan
Write-Host "  These remain in template files for you to fill in during daily use:"
foreach ($ph in $contextualPlaceholders) {
    Write-Host "    $ph"
}
Write-Host ""

Write-Host "Next steps:" -ForegroundColor Green
Write-Host "  1. Rename the root directory to '$($config.workspace.name)' (if not already)"
Write-Host "  2. Open Learning.code-workspace in VS Code:  code Learning.code-workspace"
Write-Host "  3. Start learning: /planner 'Create a learning roadmap'"
Write-Host ""
