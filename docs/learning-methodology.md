# Learning Methodology

## The Learning Loop

This workspace is built around a structured learning cycle:

```
Plan  →  Learn  →  Practice  →  Review  →  Record  →  Assess
  ↑                                                          │
  └──────────────────────────────────────────────────────────┘
```

| Phase | Tool | Output |
|-------|------|--------|
| **Plan** | `/planner` | Updated `roadmap.md`, weekly goals |
| **Learn** | `/teacher` | Understanding of a new concept |
| **Practice** | `/coach` | Code written, exercises completed |
| **Review** | `/reviewer` | Code quality feedback, improvement areas |
| **Record** | `/journal` | `{{DIR_JOURNAL}}/YYYY-MM-DD.md` |
| **Assess** | `/quiz` | Knowledge check, gap identification |

Each cycle covers one concept or skill. A cycle may last one session or span multiple days — the key is completing all phases before moving on.

## Daily Workflow

A typical learning day follows this rhythm:

### Morning (5 min)
```
/planner "What should I work on today?"
```
Review your roadmap, decide on today's focus.

### Learning Session (60-90 min)
```
/teacher "Move semantics in {{LANGUAGE}}"
```
Learn one concept. Work through the example. Complete the practice exercise.

### Practice Session (30-60 min)
```
/coach "I'm stuck on implementing X. Here's my code..."
```
Apply what you learned. Write code. Get unstuck with hints, not answers.

### Review (15 min)
```
/reviewer "Review my code from today"
```
Get feedback on what you wrote. Understand what to improve.

### End of Day (10 min)
```
/journal
```
Reflect on what you learned. Record insights, questions, and plan for tomorrow.

## Weekly Rhythm

| Day | Activity |
|-----|----------|
| Daily | Learn → Practice → Journal |
| `{{REVIEW_DAY}}` | Weekly review: `/planner "Weekly review"` — compare progress vs roadmap, adjust |
| End of cycle | `/quiz "Recent topics"` — assess retention |

## How to Use the Journal Effectively

The journal at `{{DIR_JOURNAL}}/` is not a log — it's a **learning tool**:

1. **Write immediately after learning.** Memory decays fast. Capture insights while fresh.
2. **Be specific about confusion.** "I don't get pointers" is useless. "I'm confused about when `delete` is needed after `new`" is actionable.
3. **Connect to past entries.** Patterns emerge over time. The `/planner` reads your journal to understand your pace and pain points.
4. **Review weekly.** Sunday's review should skim the week's journal entries for themes.

## How to Use Notes

Notes at `{{DIR_NOTES}}/` are your **personal knowledge base**:

- **One concept per file.** Avoid monolithic notes documents. Each `.md` file covers exactly one concept.
- **Write in your own words.** Copying a textbook into notes is worthless. Explain it as if teaching a colleague.
- **Include "when NOT to use."** Understanding a concept's limitations is as important as understanding what it does.
- **Revisit and revise.** Knowledge deepens over time. Update old notes with new insights.

## How to Use Projects

Projects at `{{DIR_PROJECTS}}/` are where you **apply knowledge in context**:

- Start small. A project that takes 3 days is better than one that takes 3 months (and never finishes).
- Each project should target 2-3 concepts from your roadmap.
- After completing a project, run `/reviewer` on the whole thing, then `/journal` to capture lessons learned.

## Adapting This Methodology

This is a template, not a straitjacket. Adapt it:

- **Too busy?** Skip Practice on some days. But never skip Journal — reflection is the highest-leverage activity.
- **Deep in flow?** Skip the morning Planner check-in. Don't break momentum.
- **Project-heavy phase?** Teacher and Quiz may take a back seat. Coding is learning.
- **Theory-heavy phase?** Coach and Reviewer may be less relevant. Adjust accordingly.

The methodology serves the learning — not the other way around.

---

*See also: [Prompt Guide](prompt-guide.md), [Review Checklist](review-checklist.md)*
