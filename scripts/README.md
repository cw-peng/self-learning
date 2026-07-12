# Scripts — Automation Tools

This directory contains automation scripts for managing the workspace.

## Scripts

| Script | Purpose | When to Run |
|--------|---------|-------------|
| `init.ps1` | Initialize workspace from template | Once, after editing `config.json` |

## Usage

```powershell
# Preview changes (recommended before first run)
.\init.ps1 -DryRun

# Apply initialization
.\init.ps1

# Use a different config file
.\init.ps1 -ConfigPath ".\my-config.json"
```

## Requirements

- PowerShell 5.1 or later
- Run from the workspace root directory

## Adding New Scripts

Keep scripts simple — single-file, self-contained, no dependencies beyond PowerShell built-ins.

If you add scripts, document them in this README.

## Related

- [`config.json`](../config.json) — script input
- [{{DIR_DOCS}}/workspace-guide.md](../{{DIR_DOCS}}/workspace-guide.md) — setup instructions
