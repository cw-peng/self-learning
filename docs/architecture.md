# Architecture

This document describes the design of the AI Learning Workspace Template. It is written for maintainers and contributors — if you're just using the template, see [Workspace Guide](workspace-guide.md).

## Design Principles

The template follows seven principles:

1. **High Cohesion** — Files within a directory share a strong thematic relationship.
2. **Low Coupling** — Changes in one directory rarely require changes in another.
3. **Configuration-Driven** — `config.json` is the single source of truth. Zero hardcoding.
4. **Maintainable** — Each file has one clear purpose. No monolithic documents.
5. **Extensible** — New prompts, directories, or config fields can be added without breaking existing structure.
6. **Portable** — Windows/Mac/Linux. Core tooling is Git, VS Code, and PowerShell 5.1+.
7. **Keep It Simple** — One automation script. Six prompts. Seven docs. No frameworks, no build steps.

## Component Diagram

```
config.json (single source of truth)
    │
    ├── init.ps1 (bridge: reads config → renames dirs → replaces placeholders)
    │       └── All template files
    │
    ├── .claude/ (Claude Code configuration)
    │   ├── CLAUDE.md        (long-term rules only)
    │   ├── commands/        (6 executable slash commands)
    │   └── templates/       (content templates: journal, review, note)
    │
    ├── .vscode/ (VS Code multi-root workspace)
    │   └── Learning.code-workspace
    │
    └── docs/ (7 documents, single-owner per topic, cross-referenced)
```

## config.json

The central configuration file. Its schema is validated by `config-schema.json`.

### Sections

| Section | Purpose | Consumer |
|---------|---------|----------|
| `workspace` | Identity: name, author, language, goal, timeline | All files via `{{PLACEHOLDER}}` |
| `directories` | Custom directory names | `init.ps1` (rename + replace `{{DIR_*}}`) |
| `learning` | Learning parameters: hours, review cadence | Journal templates, Planner prompt |
| `claude` | AI behavior: language, expertise | CLAUDE.md, all prompts |

### Extension Points

To add a new config field:
1. Add the field to `config.json` with a sensible default.
2. Add the field definition to `config-schema.json`.
3. Add a new placeholder mapping in `init.ps1`.
4. Use the placeholder in relevant template files.

## Placeholder System

### Category A — Instantiation (replaced once by init.ps1)
Workpace metadata: `{{WORKSPACE_NAME}}`, `{{AUTHOR}}`, `{{LANGUAGE}}`, `{{GOAL}}`, etc.

### Category B — Directory Paths (replaced once by init.ps1)
Directory references: `{{DIR_NOTES}}`, `{{DIR_JOURNAL}}`, `{{DIR_PROJECTS}}`, etc.

### Category C — Contextual (NOT replaced by script, filled during daily use)
`{{DATE}}`, `{{CURRENT_TOPIC}}`, `{{TODAY_SUMMARY}}`, `{{PROJECT_NAME}}`, etc.

**Why two categories:** init.ps1 is a one-time initializer. Contextual placeholders are filled in every session by the user or AI. Keeping them separate prevents the script from needing to be re-run daily.

## Prompt Architecture

### Why Two Locations

| Location | Purpose | Consumed By |
|----------|---------|-------------|
| `.claude/commands/` | Executable slash commands | Claude Code (`/planner`, `/teacher`, etc.) |
| `{{DIR_PROMPTS}}/README.md` | Human-readable catalog | User (browse, learn usage) |

Claude Code requires custom commands in `.claude/commands/` as `.md` files. The catalog in `{{DIR_PROMPTS}}/` provides a user-facing index without duplicating the full prompt text.

### Prompt Design Pattern

Each prompt file follows this structure:
1. **YAML frontmatter** with `description` (used by Claude Code for command palette)
2. **Role definition** — who the AI is
3. **Principles/Rules** — how the AI should behave
4. **Output format** — expected structure
5. **Placeholders** — `{{LANGUAGE}}`, etc., replaced by init.ps1

## Directory Responsibilities

| Directory | Single Responsibility |
|-----------|----------------------|
| `{{DIR_NOTES}}/` | Knowledge notes — one concept per file |
| `{{DIR_JOURNAL}}/` | Daily learning journal — one entry per day |
| `{{DIR_EXERCISES}}/` | Practice exercises and solutions |
| `{{DIR_PROJECTS}}/` | Larger applied projects |
| `{{DIR_REVIEW}}/` | Weekly and milestone review records |
| `{{DIR_SNIPPETS}}/` | Reusable code snippets and patterns |
| `{{DIR_RESOURCES}}/` | Curated references, links, bookmarks |
| `{{DIR_PROMPTS}}/` | Prompt catalog (human reference) |
| `{{DIR_DOCS}}/` | Workspace documentation |
| `{{DIR_SCRIPTS}}/` | Automation scripts |

Each directory has its own README.md explaining usage.

## Template Instantiation Flow

```
1. User clones/copies template
2. User edits config.json (personalizes values)
3. User runs scripts\init.ps1
   → Validates config.json
   → Builds placeholder replacement map
   → Renames directories (if customized)
   → Scans all text files, replaces A/B placeholders
   → Prints summary (including remaining C-category placeholders)
4. User renames root directory to match workspace.name
5. User opens Learning.code-workspace in VS Code
6. User starts learning with slash commands
```

## Adding a New Prompt Type

1. Create `.claude/commands/your-command.md` following the existing format.
2. Add an entry to `{{DIR_PROMPTS}}/README.md`.
3. If the prompt uses new placeholders, add them to `config.json` → `init.ps1` → relevant templates.
4. Update this architecture document.

## Adding a New Directory

1. Add the directory name to `config.directories`.
2. Create the directory with a `README.md` and `.gitkeep`.
3. Add a `{{DIR_YOURNEW}}` placeholder mapping in `init.ps1`.
4. Reference the new directory from CLAUDE.md or relevant prompts.

## Design Decisions Log

| Decision | Rationale |
|----------|-----------|
| Single JSON config vs. multiple files | One file to edit. JSON is universal, human-readable, schema-validatable. |
| `{{UPPER_SNAKE_CASE}}` syntax | Unambiguous, won't collide with code syntax. Easy to regex. |
| Single PS script vs. module system | Simplicity. ~150 lines is auditable and self-contained. No dependency hell. |
| Prompts in `.claude/commands/` vs `prompts/` | Claude Code requires this path for slash commands. Technical necessity. |
| CLAUDE.md limited to long-term rules | Stability. If it changes daily, agent behavior becomes unpredictable. |
| 7 docs, not one monolithic guide | Each doc owns one topic. Cross-references prevent duplication. |

---

*See also: [config-schema.json](config-schema.json) for machine-readable validation*
