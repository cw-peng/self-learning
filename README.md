# {{WORKSPACE_TITLE}}

> **{{GOAL}}**
>
> **Author:** {{AUTHOR}} | **Started:** {{START_DATE}} | **Duration:** {{DURATION}} | **Daily:** ~{{DAILY_HOURS}}h

---

## Quick Start

```bash
# 1. Clone or copy this template
git clone <repo-url> {{WORKSPACE_NAME}}
cd {{WORKSPACE_NAME}}

# 2. Edit config.json (your name, language, goal)
# 3. Run the initialization script
.\{{DIR_SCRIPTS}}\init.ps1

# 4. Open in VS Code
code Learning.code-workspace
```

See [{{DIR_DOCS}}/workspace-guide.md]({{DIR_DOCS}}/workspace-guide.md) for detailed setup instructions.

---

## Workspace Map

| Directory | Purpose | When to Use |
|-----------|---------|-------------|
| [{{DIR_NOTES}}/]({{DIR_NOTES}}/) | Knowledge notes | After learning a concept — write it in your own words |
| [{{DIR_JOURNAL}}/]({{DIR_JOURNAL}}/) | Learning journal | End of every learning session — reflect and plan |
| [{{DIR_EXERCISES}}/]({{DIR_EXERCISES}}/) | Practice exercises | During learning — apply concepts immediately |
| [{{DIR_PROJECTS}}/]({{DIR_PROJECTS}}/) | Applied projects | After mastering fundamentals — build something real |
| [{{DIR_REVIEW}}/]({{DIR_REVIEW}}/) | Review records | Weekly — assess progress, adjust plan |
| [{{DIR_SNIPPETS}}/]({{DIR_SNIPPETS}}/) | Code snippets | Anytime — save reusable patterns |
| [{{DIR_RESOURCES}}/]({{DIR_RESOURCES}}/) | Curated references | Anytime — save useful links, papers, tutorials |
| [{{DIR_PROMPTS}}/]({{DIR_PROMPTS}}/) | Prompt catalog | Reference — browse AI prompts and usage |
| [{{DIR_DOCS}}/]({{DIR_DOCS}}/) | Documentation | Setup and reference — understand the workspace |
| [{{DIR_SCRIPTS}}/]({{DIR_SCRIPTS}}/) | Automation scripts | Setup only — initialize the workspace |

---

## Learning Loop

```
Plan  →  Learn  →  Practice  →  Review  →  Record  →  Assess
  ↑                                                          │
  └──────────────────────────────────────────────────────────┘
```

| Phase | Tool | Command |
|-------|------|---------|
| Plan | Planner | `/planner "What should I learn next?"` |
| Learn | Teacher | `/teacher "Explain [concept]"` |
| Practice | Coach | `/coach "I'm stuck on..."` |
| Review | Reviewer | `/reviewer "Review this code"` |
| Record | Journal | `/journal` |
| Assess | Quiz | `/quiz "Topic: [what I learned]"` |

---

## Getting Started

1. **Set your direction:** `/planner "Create a learning roadmap for {{GOAL}}"`
2. **Learn your first concept:** `/teacher "Explain [fundamental concept in {{LANGUAGE}}]"`
3. **Write some code:** Practice what you learned in `{{DIR_EXERCISES}}/`
4. **Reflect:** `/journal` to record your first learning entry

---

## Prerequisites

- [Git](https://git-scm.com/) 2.30+
- [VS Code](https://code.visualstudio.com/) 1.80+
- [Claude Code](https://code.visualstudio.com/) (VS Code extension)
- [PowerShell](https://learn.microsoft.com/powershell/) 5.1+

---

*Built with the [AI Learning Workspace Template](https://github.com/). See [{{DIR_DOCS}}/architecture.md]({{DIR_DOCS}}/architecture.md) for design rationale.*
