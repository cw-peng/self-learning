# Prompt Guide

## Overview

This workspace includes six AI prompts, each designed for a specific phase of the learning cycle. They are available as slash commands in Claude Code.

| Command | Role | Best Used For |
|---------|------|---------------|
| `/planner` | Strategic planner | Starting a new topic, weekly review, adjusting goals |
| `/teacher` | Concept instructor | Learning a new concept, understanding theory |
| `/coach` | Coding guide | Stuck on implementation, debugging, design decisions |
| `/reviewer` | Code reviewer | After writing code, before considering something "done" |
| `/journal` | Reflection assistant | End of learning session, capturing insights |
| `/quiz` | Knowledge assessor | After completing a topic, checking retention |

## The Learning Loop

The six prompts form a complete learning cycle. For the full methodology — including daily workflow, weekly rhythm, and how each phase connects — see [Learning Methodology](learning-methodology.md).

---

## /planner — Strategic Planner

**Invoke:** `/planner "I want to learn [topic]"` or `/planner "Weekly review"`

**What it does:**
- Reads your `roadmap.md` and `{{DIR_JOURNAL}}/` to understand current progress.
- Breaks down goals into phases, weeks, and daily tasks.
- Identifies risks, prerequisite gaps, and realistic timelines.
- During review: compares actual progress vs. plan, suggests adjustments.

**When NOT to use:**
- For learning a specific concept → use `/teacher`
- For help with code → use `/coach`
- For daily journaling → use `/journal`

**Example invocations:**
```
/planner "I want to learn Rust from scratch in 60 days, 2 hours per day"
/planner "I finished Phase 2 of my roadmap. What should Phase 3 look like?"
/planner "Weekly review — here's what I actually did this week..."
```

---

## /teacher — Concept Instructor

**Invoke:** `/teacher "Explain [concept]"`

**What it does:**
- Explains one concept at a time, starting from first principles.
- Provides minimal, runnable code examples.
- Designs a focused practice exercise.
- Ends with a concise summary.

**When NOT to use:**
- For debugging your code → use `/coach`
- For project-level architecture advice → use `/reviewer`
- When you already understand the concept and just need syntax → ask directly

**Example invocations:**
```
/teacher "Explain move semantics in C++"
/teacher "How does Kubernetes service discovery work?"
/teacher "What is a B-tree and when is it used?"
```

---

## /coach — Coding Guide

**Invoke:** `/coach "I'm working on [problem]. Here's my approach..."`

**What it does:**
- Guides you toward the solution with hints, not answers.
- Uses a 4-level escalation: questions → direction → partial code → full solution.
- Only gives the full answer when you explicitly say "show me the full solution."
- Teaches debugging process, not just fixes.

**When NOT to use:**
- For learning a concept from scratch → use `/teacher`
- For reviewing completed code → use `/reviewer`
- When you have no code or approach yet → use `/planner` or `/teacher` first

**Example invocations:**
```
/coach "I'm trying to implement a thread pool but my workers are deadlocking. Here's the code..."
/coach "How should I structure this API? I have users, posts, and comments."
/coach "My binary search is returning wrong results for edge cases."
```

---

## /reviewer — Code Reviewer

**Invoke:** `/reviewer "Review this code"` (paste or reference the code)

**What it does:**
- Reviews code across five dimensions: correctness > readability > performance > maintainability > style.
- Classifies issues by severity: 🔴 Critical, 🟡 Important, 🟢 Nice-to-have.
- Explains problems before suggesting fixes.
- Also points out what works well.

**When NOT to use:**
- For help while writing code → use `/coach`
- For learning about code quality principles → use `/teacher`
- For one-line syntax questions → ask directly

**Example invocations:**
```
/reviewer "Review this linked list implementation in exercises/linked-list.cpp"
/reviewer "I just finished my first Rust project. Can you review projects/todo-app/?"
```

---

## /journal — Reflection Assistant

**Invoke:** `/journal`

**What it does:**
- Asks reflective questions one at a time about today's learning.
- Generates a structured Markdown journal entry at `{{DIR_JOURNAL}}/YYYY-MM-DD.md`.
- Identifies patterns across sessions and suggests next steps.

**When NOT to use:**
- For planning future work → use `/planner`
- Mid-session note-taking → write notes in `{{DIR_NOTES}}/`
- Logging what you did hour-by-hour → this is about reflection, not time tracking

**Example invocations:**
```
/journal
/journal "I spent today reading about TCP congestion control"
```

---

## /quiz — Knowledge Assessor

**Invoke:** `/quiz "Topic: [what you've been learning]"`

**What it does:**
- Generates 3-5 questions across four types: concept, code reading, debugging, coding.
- Does NOT provide answers until you submit your attempts.
- Grades each answer with explanation.
- Suggests areas to review based on weak spots.

**When NOT to use:**
- For learning a new concept → use `/teacher`
- For exam prep only — quiz questions are about understanding, not memorization
- When you're too tired — quiz results won't be meaningful

**Example invocations:**
```
/quiz "C++ smart pointers — unique_ptr, shared_ptr, weak_ptr"
/quiz "Linux file permissions and process management"
/quiz "Docker networking and volumes"
```

---

## Composing Prompts

The six prompts are modular — combine them as needed:

| Scenario | Prompt Sequence |
|----------|----------------|
| Starting a new topic | `/planner` → `/teacher` → `/coach` → `/journal` |
| Debugging session | `/coach` → (code!) → `/reviewer` → `/journal` |
| Project completion | `/reviewer` → `/journal` → `/quiz` |
| Weekly review | `/journal` (read week's entries) → `/planner` "Weekly review" |
| Cramming for an interview | `/quiz` (diagnose) → `/teacher` (weak areas) → `/quiz` (retest) |

---

## Customizing Prompts

All prompt files live in `.claude/commands/`. To customize:

1. Open the relevant `.md` file in `.claude/commands/`.
2. Edit the instructions. Add or remove rules. Change the output format.
3. Restart Claude Code or reload the window.

The prompts are prompt text, not code — modify them freely to match your learning style.

---

*See also: [Learning Methodology](learning-methodology.md) for the full learning loop, [`.claude/commands/`](../.claude/commands/) for prompt source files*
