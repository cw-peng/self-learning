<!--
  ╔══════════════════════════════════════════════════════════╗
  ║  This is a TEMPLATE file. All {{PLACEHOLDER}} tokens    ║
  ║  are replaced by scripts/init.ps1 after you edit        ║
  ║  config.json. See Quick Start below.                     ║
  ╚══════════════════════════════════════════════════════════╝
-->

# AI Learning Workspace Template

<p align="center">
  <b>A configurable, AI-powered workspace for self-directed technical learning.</b><br>
  Clone → Configure → Learn. Works with any language, framework, or domain.
</p>

<p align="center">
  <a href="#license"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="#prerequisites"><img src="https://img.shields.io/badge/powershell-5.1%2B-blue.svg" alt="PowerShell 5.1+"></a>
  <a href="#prerequisites"><img src="https://img.shields.io/badge/vscode-1.80%2B-blue.svg" alt="VS Code 1.80+"></a>
</p>

> After running `init.ps1`, this page becomes your project's README with the title, goal, and structure below.

---

## Your Project

*After running `init.ps1`, the placeholders below become your project's identity. On GitHub this section shows the template defaults — clone, configure, and it's yours.*

**{{WORKSPACE_TITLE}}** — {{GOAL}}

**Author:** {{AUTHOR}} | **Started:** {{START_DATE}} | **Duration:** {{DURATION}} | **Daily:** ~{{DAILY_HOURS}}h

---

## Why This Template?

Self-directed learning is hard. Without structure, you drift between tutorials. Without reflection, you forget what you learned. Without planning, you don't know what to learn next.

This template gives you a **complete learning workspace** — directory structure, AI prompts, journaling system, and automation — so you can focus on learning instead of organizing. It's built for [Claude Code](https://code.visualstudio.com/), turning Claude into your personal planner, teacher, coach, reviewer, journal assistant, and quiz master.

**Works for any technical domain:** C++, Python, Rust, Go, Linux, Docker, Kubernetes, OpenGL, Vulkan, Unreal Engine, OS, networking, algorithms, AI — you name it.

---

## Features

- **Six AI-powered slash commands** — `/planner`, `/teacher`, `/coach`, `/reviewer`, `/journal`, `/quiz` — each designed for one phase of the learning cycle
- **Configuration-driven** — edit one `config.json` file, run one script, and every file personalizes automatically
- **Customizable directory names** — rename `notes` → `knowledge`, `projects` → `labs`, or anything else. All references update automatically
- **Built-in journaling** — daily reflection with structured markdown templates. Claude asks reflective questions, then generates the entry
- **Roadmap tracking** — learning milestones, weekly reviews, progress logs — all in one file
- **Zero hardcoding** — every directory reference, workspace name, and personal setting uses `{{PLACEHOLDER}}` tokens that a single PowerShell script replaces
- **Language-agnostic** — works for programming languages, DevOps, game engines, CS theory — anything you want to learn
- **Bilingual** — English and Chinese documentation included

---

## Quick Start

### 1. Copy the template

```bash
git clone https://github.com/cw-peng/self-learning.git my-learning
cd my-learning
```

### 2. Edit config.json

Open `config.json` and personalize at minimum:

```jsonc
{
  "workspace": {
    "name": "cpp-learning",
    "title": "C++ Deep Learning Journey",
    "author": "Your Name",
    "language": "C++",
    "goal": "Master C++20 and build a game engine from scratch",
    "startDate": "2026-07-12",
    "estimatedDuration": "90 days"
  }
}
```

### 3. Run the initialization script

```powershell
# Preview changes first (recommended)
.\scripts\init.ps1 -DryRun

# Apply personalization
.\scripts\init.ps1
```

### 4. Open and start learning

```bash
code Learning.code-workspace
```

Then invoke your first prompt:

```
/planner "Create a learning roadmap for my goal"
```

---

## How It Works

```
                   ┌─────────────────┐
                   │   config.json   │  ← You edit this
                   └───────┬─────────┘
                           │
                           ▼
                   ┌─────────────────┐
                   │   init.ps1      │  ← One script, one run
                   │                 │
                   │ 1. Reads config │
                   │ 2. Renames dirs │
                   │ 3. Replaces all │
                   │    {{X}} tokens │
                   └───────┬─────────┘
                           │
                           ▼
              ┌─────────────────────────┐
              │  Personalized Workspace │  ← Ready to use
              │  - README with your name│
              │  - CLAUDE.md with your  │
              │    language & expertise │
              │  - All prompts injected │
              │    with your context    │
              │  - Custom dir names     │
              └─────────────────────────┘
```

Every file containing `{{PLACEHOLDER}}` tokens — README, CLAUDE.md, all six prompts, journal templates, docs — gets its placeholders replaced with your values from `config.json` in a single run. Contextual placeholders like `{{DATE}}` and `{{TODAY_SUMMARY}}` are left for you to fill in during daily use.

---

## Workspace Structure

```
{{WORKSPACE_NAME}}/
├── README.md                  ← You are here (after init: personalized)
├── README_zh.md               ← Chinese version
├── roadmap.md                 ← Your learning plan — edit with /planner
├── Learning.code-workspace    ← VS Code multi-root workspace
├── config.json                ← Single source of truth — edit this first
├── .gitignore
│
├── .claude/
│   ├── CLAUDE.md              ← Long-term AI rules (stable, no daily plans)
│   ├── commands/              ← Six slash commands — invoke as /planner etc.
│   │   ├── planner.md
│   │   ├── teacher.md
│   │   ├── coach.md
│   │   ├── reviewer.md
│   │   ├── journal.md
│   │   └── quiz.md
│   └── templates/             ← Content templates for journal, review, notes
│
├── .vscode/                   ← Shared editor settings & extensions
│
├── {{DIR_DOCS}}/              ← 7 documentation files
├── {{DIR_NOTES}}/             ← Your knowledge base (one concept per file)
├── {{DIR_JOURNAL}}/           ← Daily learning entries
├── {{DIR_EXERCISES}}/         ← Practice problems
├── {{DIR_PROJECTS}}/          ← Applied projects
├── {{DIR_REVIEW}}/            ← Weekly & milestone reviews
├── {{DIR_SNIPPETS}}/          ← Reusable code patterns
├── {{DIR_RESOURCES}}/         ← Curated references & links
├── {{DIR_PROMPTS}}/           ← Human-readable prompt catalog
└── {{DIR_SCRIPTS}}/           ← init.ps1 automation
```

All directory names are customizable in `config.json`. Change `notes` to `knowledge` and every file reference updates.

---

## The Six AI Prompts

Each prompt is a Claude Code slash command. Together they form a complete learning cycle:

```
Plan  →  Learn  →  Practice  →  Review  →  Record  →  Assess
  ↑                                                          │
  └──────────────────────────────────────────────────────────┘
```

| Command | Role | What It Does |
|---------|------|--------------|
| `/planner` | Strategic Planner | Roadmap, milestones, progress review, weekly planning |
| `/teacher` | Concept Instructor | Explains one concept at a time: concept → example → practice → summary |
| `/coach` | Coding Guide | Guides with hints (4 escalation levels), not full answers |
| `/reviewer` | Code Reviewer | Reviews: correctness > readability > performance > maintainability |
| `/journal` | Reflection Assistant | Asks reflective questions, generates `YYYY-MM-DD.md` entry |
| `/quiz` | Knowledge Assessor | 3-5 questions across concept, code reading, debugging, and coding |

**Composing prompts for common scenarios:**

| Scenario | Sequence |
|----------|----------|
| Starting a new topic | `/planner` → `/teacher` → `/coach` → `/journal` |
| Stuck on code | `/coach` → `/reviewer` → `/journal` |
| Project complete | `/reviewer` → `/journal` → `/quiz` |
| Weekly review | `/journal` (read entries) → `/planner "Weekly review"` |

Full prompt guide: [{{DIR_DOCS}}/prompt-guide.md]({{DIR_DOCS}}/prompt-guide.md)

---

## Prerequisites

| Tool | Version | Check |
|------|---------|-------|
| [Git](https://git-scm.com/) | 2.30+ | `git --version` |
| [VS Code](https://code.visualstudio.com/) | 1.80+ | `code --version` |
| [Claude Code](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code) | Latest | VS Code extension |
| [PowerShell](https://learn.microsoft.com/powershell/) | 5.1+ | `$PSVersionTable.PSVersion` |

---

## Documentation

| Document | Topic |
|----------|-------|
| [Workspace Guide]({{DIR_DOCS}}/workspace-guide.md) | Setup, config.json reference, troubleshooting |
| [Learning Methodology]({{DIR_DOCS}}/learning-methodology.md) | The learning loop, daily workflow, journal usage |
| [Prompt Guide]({{DIR_DOCS}}/prompt-guide.md) | In-depth usage of all six prompts |
| [Review Checklist]({{DIR_DOCS}}/review-checklist.md) | Code review and weekly learning review criteria |
| [Coding Style]({{DIR_DOCS}}/coding-style.md) | Language-agnostic conventions + language-specific template |
| [Architecture]({{DIR_DOCS}}/architecture.md) | Design rationale, extension guide for maintainers |

---

## Contributing

This template is designed to evolve. If you have ideas:

1. Open an issue to discuss the change
2. Keep it simple — the template's strength is minimalism
3. Follow the [Architecture]({{DIR_DOCS}}/architecture.md) guide for structural changes

---

## License

[MIT](LICENSE) — use freely for personal or commercial learning projects.

---

<p align="center">
  <sub>Built for curious learners. Powered by Claude Code.</sub>
</p>
