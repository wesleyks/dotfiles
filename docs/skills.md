# Managed Skills

This repository is the source of truth for personal skills and local overrides.

## Repo-Owned Skills

Shared skills:

- `skills/shared/software-development/codebase-prd-extractor`

Agent-specific override locations:

- `skills/codex/overrides/`
- `skills/claude-code/overrides/`
- `skills/github-copilot/overrides/`

Add a skill to `skills/shared/` when the same content should be available to every supported agent.

Add a skill to an agent `overrides/` directory only when that agent needs different content or metadata.

## External Skills

The current Codex `.system/` skills are not mirrored into this repository by default.

Examples observed outside this repo:

- `.system/openai-docs`
- `.system/plugin-creator`
- `.system/skill-creator`
- `.system/skill-installer`

These are treated as external or vendor-provided unless you explicitly choose to fork one into this repository.
