# Agent Skill Install Paths

This repository only supports these agents:

- Codex
- Claude Code
- GitHub Copilot

## Codex

Confirmed target path:

```text
~/.codex/skills
```

The installer links repo-managed skills into this directory automatically.

## Claude Code

A stable local "skills" directory has not been confirmed yet.

To enable installation for Claude Code, set:

```sh
CLAUDE_CODE_SKILLS_DIR=/absolute/path/to/claude/skills ./install.sh
```

The installer will then link:

- `skills/shared/*`
- `skills/claude-code/overrides/*`

into that directory.

## GitHub Copilot

A stable local "skills" directory has not been confirmed yet.

To enable installation for GitHub Copilot, set:

```sh
GITHUB_COPILOT_SKILLS_DIR=/absolute/path/to/copilot/skills ./install.sh
```

The installer will then link:

- `skills/shared/*`
- `skills/github-copilot/overrides/*`

into that directory.
