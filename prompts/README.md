# Prompt Library

Quick reference to the six AI prompts available in this workspace. For detailed usage, examples, and composition patterns, see [{{DIR_DOCS}}/prompt-guide.md](../{{DIR_DOCS}}/prompt-guide.md).

---

## Commands at a Glance

| Command | Role | One-Liner |
|---------|------|-----------|
| `/planner` | Strategic Planner | Roadmap, milestones, progress review |
| `/teacher` | Concept Instructor | Learn one concept: explain → example → practice → summary |
| `/coach` | Coding Guide | Get unstuck with hints — not answers |
| `/reviewer` | Code Reviewer | Quality feedback: correctness > readability > performance |
| `/journal` | Reflection Assistant | End-of-session reflection → structured `{{DIR_JOURNAL}}/YYYY-MM-DD.md` |
| `/quiz` | Knowledge Assessor | 3-5 questions; answers only after you attempt |

---

## How Prompts Work

Each command is a markdown file in `.claude/commands/` that Claude Code reads as a slash command:

```
.claude/commands/
├── planner.md     →  /planner
├── teacher.md     →  /teacher
├── coach.md       →  /coach
├── reviewer.md    →  /reviewer
├── journal.md     →  /journal
└── quiz.md        →  /quiz
```

To customize a prompt, edit the corresponding `.md` file, then reload VS Code.

---

## Quick Start

```
/planner "Create a learning roadmap"
/teacher "Explain [concept]"
/coach "I'm stuck on..."
/reviewer "Review this code"
/journal
/quiz "Topic: [what I learned]"
```

---

*See also: [{{DIR_DOCS}}/prompt-guide.md](../{{DIR_DOCS}}/prompt-guide.md) for in-depth usage, [{{DIR_DOCS}}/learning-methodology.md](../{{DIR_DOCS}}/learning-methodology.md) for the learning loop methodology*
