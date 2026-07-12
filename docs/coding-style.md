# Coding Style

## Language-Agnostic Principles

These principles apply regardless of programming language.

### Naming
- **Descriptive over short.** `user_count` not `n`. `parse_config_file` not `pcf`.
- **Consistent within a project.** Don't mix `snake_case` and `camelCase` in the same file.
- **Boolean names read as questions.** `is_empty`, `has_permission`, `can_connect`.
- **Avoid abbreviations unless universally understood.** `idx` is fine. `usr_cnt` is not.

### Functions
- **One function, one purpose.** If you need "and" to describe what a function does, split it.
- **Small is better.** A function over 30 lines is a warning sign. Over 50 is a problem.
- **Prefer pure functions.** Given the same inputs, always return the same output. Avoid hidden side effects.
- **Early return over deep nesting.**
  ```python
  # Good
  def process(data):
      if not data:
          return None
      if not data.is_valid():
          return None
      return data.transform()

  # Avoid
  def process(data):
      if data:
          if data.is_valid():
              return data.transform()
  ```

### Comments
- **Comment why, not what.** The code says what. The comment should say why you chose this approach.
- **Update comments when you change code.** An outdated comment is worse than no comment.
- **Delete commented-out code.** Git remembers it. Dead code is noise.
- **Use doc-comments for public APIs.** Follow your language's convention (`///`, `/** */`, `""" """`).

### Structure
- **Don't Repeat Yourself (DRY).** If you copy-paste code, you copy-paste bugs.
- **But don't over-abstract.** Three lines duplicated twice is fine. Abstract when the pattern is clear, not when you're guessing.
- **Group related code.** Imports together. Constants together. Public functions before private.
- **One class/module, one responsibility.** If a class does two unrelated things, split it.

### Error Handling
- **Fail fast.** Catch errors as close to the source as possible. Don't let bad data propagate.
- **Don't swallow exceptions silently.** At minimum, log them.
- **Provide context in error messages.** `"File not found"` is useless. `"Config file 'settings.json' not found in /etc/app/"` is useful.

---

## Language-Specific Conventions

*This section is a template. Fill it in for {{LANGUAGE}} after you establish your preferences.*

### {{LANGUAGE}} Conventions

- **Formatting:** [Standard formatter for your language, e.g., `clang-format`, `rustfmt`, `black`]
- **Naming convention:** [e.g., `snake_case` for variables, `PascalCase` for types]
- **File organization:** [e.g., one class per file, header/source separation]
- **Testing framework:** [e.g., pytest, Google Test, cargo test]
- **Build system:** [e.g., CMake, Cargo, Make]

### Resources for {{LANGUAGE}} Style
- Official style guide: [link]
- Community conventions: [link]
- Linter configuration: [tool + config file location]

---

## Code That Teaches vs. Code That Works

Since this is a learning workspace, some code exists to demonstrate a concept, not to be production-ready. Distinguish between them:

| Learning Code | Production Code |
|---------------|-----------------|
| Verbose for clarity | Concise for efficiency |
| Comments everywhere | Comments where surprising |
| Error handling may be simplified | Error handling is comprehensive |
| May reimplement for practice | Uses libraries where sensible |
| Single-file for simplicity | Proper module structure |

When writing learning code, add a note at the top:
```
// Educational implementation of [concept].
// Production code would use [standard library / pattern].
```

---

*See also: [Review Checklist](review-checklist.md) for applying these principles during code review*
