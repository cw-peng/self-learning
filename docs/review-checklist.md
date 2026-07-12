# Review Checklist

Review is not optional — it's how learning solidifies. Use these checklists for self-review, code review, and weekly review.

---

## Code Review Checklist

Before considering any code "done," run through these:

### Correctness
- [ ] Does it handle edge cases? (empty input, large input, null/None, boundary values)
- [ ] Are errors handled gracefully? (not just "it works on happy path")
- [ ] Are there any off-by-one errors?
- [ ] Is resource cleanup guaranteed? (memory, file handles, connections)
- [ ] Does it work with concurrent access? (if applicable)

### Readability
- [ ] Can I understand this code in 5 minutes after not looking at it for a week?
- [ ] Are variable names descriptive? (no `x`, `tmp`, `data` unless truly generic)
- [ ] Are functions small and single-purpose? (if a function needs a comment to explain what it does, split it)
- [ ] Is the flow linear? (minimize deep nesting, early returns preferred)

### Performance
- [ ] Any unnecessary allocations or copies?
- [ ] Any O(n²) where O(n log n) is possible?
- [ ] Any repeated computations that could be cached?
- [ ] Is it "fast enough"? (don't optimize prematurely)

### Maintainability
- [ ] Will this be easy to change in 6 months?
- [ ] Are magic numbers extracted as named constants?
- [ ] Is the interface clean? (minimal surface area, clear contracts)
- [ ] Are tests covering the important paths?

### Style
- [ ] Consistent naming convention? (snake_case, camelCase — match the language)
- [ ] Consistent indentation and formatting?
- [ ] No commented-out code? (delete it — git remembers)

---

## Weekly Learning Review Checklist

Every `{{REVIEW_DAY}}`, spend 15-20 minutes answering these:

### Progress Assessment
- [ ] What did I plan to achieve this week? (check `roadmap.md`)
- [ ] What did I actually achieve? (check `{{DIR_JOURNAL}}/` entries)
- [ ] Am I ahead, on track, or behind schedule?
- [ ] If behind: what's the bottleneck? (time, difficulty, motivation, unclear goals)

### Knowledge Check
- [ ] What are the 3 most important things I learned this week?
- [ ] Can I explain each of them to someone else without notes?
- [ ] What concepts do I feel shaky about?
- [ ] What questions did I encounter but never resolve?

### Quality Check
- [ ] Did I complete the practice exercises? If not, why?
- [ ] Did I write in my journal every learning day?
- [ ] Did I get code review on my work?
- [ ] Is my `{{DIR_NOTES}}/` organized and up to date?

### Adjustment
- [ ] Does the roadmap still make sense? Or should I adjust based on what I've learned?
- [ ] Is my daily time estimate realistic?
- [ ] What's one thing I should do differently next week?

### Planning
- [ ] What's the single most important thing to accomplish next week?
- [ ] What could block me? (prerequisite knowledge, tools, schedule)
- [ ] What resources do I need? (books, tutorials, project ideas)

---

## Self-Assessment Prompts

Use these with `/journal` for deeper reflection:

- "What was the hardest concept this week, and why was it hard?"
- "If I were teaching this topic to a friend, what would I emphasize?"
- "What did I believe about this topic that turned out to be wrong?"
- "What's the connection between what I learned this week and what I knew before?"
- "Am I enjoying this? If not, what would make it more engaging?"

---

## Review Rhythm

| Frequency | Focus | Duration |
|-----------|-------|----------|
| **Daily** | Code review + journal | 15 min |
| **Weekly** | Progress vs roadmap | 20 min |
| **Per-topic** | Quiz assessment | 15-30 min |
| **Monthly** | Big-picture direction | 30 min |

---

*See also: [Coding Style](coding-style.md) for code conventions, [Learning Methodology](learning-methodology.md) for the review-learning connection*
