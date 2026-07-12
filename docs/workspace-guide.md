# Workspace Guide

## Prerequisites

Before starting, ensure you have:

| Tool | Version | Check |
|------|---------|-------|
| **Git** | 2.30+ | `git --version` |
| **VS Code** | 1.80+ | `code --version` |
| **Claude Code** | Latest | Install via VS Code extension `anthropic.claude-code` |
| **PowerShell** | 5.1+ | `$PSVersionTable.PSVersion` |

## Quick Start (4 Steps)

### Step 1: Copy the Template

```bash
# Option A: Clone
git clone <repo-url> {{WORKSPACE_NAME}}
cd {{WORKSPACE_NAME}}

# Option B: Copy
cp -r ai-learning-template/ {{WORKSPACE_NAME}}/
cd {{WORKSPACE_NAME}}
```

### Step 2: Edit config.json

Open `config.json` and customize at minimum:

```jsonc
{
  "workspace": {
    "name": "your-project-name",     // Required: filesystem-safe name
    "title": "Your Learning Title",  // Required: human-readable title
    "author": "Your Name",           // Required
    "language": "Python",            // Required: your target language/domain
    "goal": "What you want to achieve",
    "startDate": "YYYY-MM-DD",
    "estimatedDuration": "N days"
  }
  // directories, learning, claude sections have sensible defaults
}
```

### Step 3: Run the Initialization Script

```powershell
# Preview changes first (recommended)
.\scripts\init.ps1 -DryRun

# Apply changes
.\scripts\init.ps1
```

The script will:
- Rename directories if you customized names in `config.directories`
- Replace all `{{PLACEHOLDER}}` tokens in every file
- Print a summary of changes and remaining contextual placeholders

### Step 4: Open in VS Code

```bash
code Learning.code-workspace
```

Accept any prompts to install recommended extensions. You're ready to start learning.

## config.json Reference

### `workspace` — Identity

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `name` | string | Filesystem-safe project name | `"cpp-learning"` |
| `title` | string | Human-readable display name | `"C++ Deep Learning Journey"` |
| `author` | string | Your name | `"Zhang Wei"` |
| `language` | string | Target language or domain | `"C++"`, `"Rust"`, `"Linux"` |
| `goal` | string | High-level learning objective | `"Master C++20 and build a game engine"` |
| `startDate` | string | Learning start date (YYYY-MM-DD) | `"2026-07-12"` |
| `estimatedDuration` | string | Expected duration | `"90 days"`, `"6 months"` |

### `directories` — Custom Directory Names

Customize any directory name. All references throughout the workspace update automatically.

| Field | Default | Custom Example |
|-------|---------|---------------|
| `notes` | `"notes"` | `"knowledge"` |
| `journal` | `"journal"` | `"learning-log"` |
| `exercises` | `"exercises"` | `"practice"` |
| `projects` | `"projects"` | `"labs"` |
| `review` | `"review"` | `"retrospectives"` |
| `snippets` | `"snippets"` | `"code-snippets"` |
| `resources` | `"resources"` | `"references"` |
| `prompts` | `"prompts"` | `"ai-prompts"` |
| `docs` | `"docs"` | `"documentation"` |
| `scripts` | `"scripts"` | `"tools"` |

### `learning` — Learning Parameters

| Field | Type | Default | Description |
|-------|------|---------|-------------|
| `dailyHours` | number | `2` | Expected daily study hours |
| `weeklyReviewDay` | string | `"Sunday"` | Day for weekly review |
| `reviewCycleDays` | number | `7` | Days between reviews |

### `claude` — AI Behavior

| Field | Type | Default | Description |
|-------|------|---------|-------------|
| `communicationLanguage` | string | `"Chinese"` | Language for explanations and journal |
| `expertiseArea` | string | `""` | AI's assumed expertise focus |

## Rerunning init.ps1

`init.ps1` is designed to be safe on re-run:

- **Already-replaced files:** No `{{PLACEHOLDER}}` tokens remain, so re-running is a no-op.
- **After editing config.json:** If you change config values after running `init.ps1`, re-running will NOT update already-replaced text. You would need to either manually update or start fresh.

**Best practice:** Get config.json right before the first run. Use `-DryRun` to verify.

## Troubleshooting

| Problem | Solution |
|---------|----------|
| PowerShell script blocked | Run `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` |
| "config.json not found" | Run the script from the workspace root directory |
| Placeholders still visible after init | Check that the placeholder name matches exactly (case-sensitive). C-category placeholders are intentionally left. |
| Claude Code can't find commands | Ensure `.claude/commands/` exists and files have `.md` extension. Restart VS Code. |
| Workspace opens wrong folders | Edit `Learning.code-workspace` and verify `path` values point to existing directories. |

---

*See also: [Architecture](architecture.md) for design rationale, [Learning Methodology](learning-methodology.md) for how to learn with this workspace*
