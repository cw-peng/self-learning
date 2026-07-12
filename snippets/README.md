# Snippets — Reusable Code Patterns

Save patterns, idioms, and boilerplate that you use repeatedly.

## What to Save

- **Language idioms** — the "right way" to do common things in {{LANGUAGE}}
- **Boilerplate** — project setup, error handling patterns, build configurations
- **Useful utilities** — small functions you keep rewriting
- **"Today I Learned"** — neat tricks discovered during learning

## What NOT to Save

- Full projects → those go in `{{DIR_PROJECTS}}/`
- Learning notes → those go in `{{DIR_NOTES}}/`
- Exercises → those go in `{{DIR_EXERCISES}}/`

## Organization

Organize by language/domain:

```
snippets/
├── {{LANGUAGE}}/
│   ├── error-handling.md
│   ├── string-manipulation.md
│   └── file-io.md
├── git/
│   └── useful-commands.md
└── shell/
    └── scripting-patterns.md
```

## Snippet Format

```markdown
# Pattern Name

## Use Case
[When would you use this?]

## Code
```{{LANGUAGE}}
[The pattern]
```

## Notes
[Gotchas, alternatives, when NOT to use]
```

## Related

- [{{DIR_NOTES}}/](../{{DIR_NOTES}}/) — conceptual knowledge (why, not just how)
