---
name: execute-plan
description: Execute an existing approved implementation plan against a codebase in small, validated increments. Use when the user wants an approved plan implemented, carried through, or worked step by step. This skill treats the spec as authoritative for behavior questions, updates `plan-status.md` as the live execution record, and surfaces blockers or deviations instead of silently changing direction. It executes an existing plan; it does not write the spec or the plan.
---

# Execute Plan

Implement an already-approved plan against the codebase. Each invocation executes exactly one plan step, validates that step, and updates `plan-status.md` so another engineer can resume execution without re-discovery.

## Trigger

Use this skill when the user wants to:

- execute an approved plan
- implement work step by step from an existing `plan.md`
- continue execution from an existing `plan-status.md`
- carry an existing plan through while keeping status current

Typical invocation form:

- `/execute-plan <folder>`

Do not use this skill to create or rewrite the spec or plan.

## Preconditions

Before changing code, get the target feature folder from the user and look for the governing artifacts there.

If the user invokes the skill as `/execute-plan <folder>`, treat `<folder>` as the feature folder name automatically.

Resolve the execution artifact set as:

- `docs/features/in-progress/<folder>/spec.md`
- `docs/features/in-progress/<folder>/plan.md`
- `docs/features/in-progress/<folder>/plan-status.md`

Completion moves the full feature folder to:

- `docs/features/completed/<folder>/`

If the user does not provide a folder, execution is blocked until one is provided.

If the governing spec or `plan.md` cannot be found in the requested folder, execution is blocked. Do not reconstruct them inside this skill.

If `plan-status.md` is missing but `plan.md` exists, initialize it in the requested folder from [execution-status-template.md](references/execution-status-template.md) before implementation starts.

If the spec and plan disagree in a way that changes behavior or scope:

- pause execution
- call out the mismatch explicitly
- ask for confirmation or a plan update instead of choosing silently

## Core Loop

1. Re-anchor on source documents.
   Use the user-provided folder to locate `spec.md`, `plan.md`, and `plan-status.md`. Read the current plan step, the relevant spec section, and the latest `plan-status.md` notes before editing code.
2. Pick one bounded increment.
   Select exactly one plan step for this invocation. Do not continue into the next step in the same run, even if time remains.
3. Update live status before and during work.
   Mark the active step in `plan-status.md`, note the immediate objective, and record blockers or discoveries as they appear.
4. Implement narrowly.
   Keep changes aligned with the current step boundary. Defer adjacent ideas unless the user approves a plan change.
5. Validate after meaningful changes.
   Run the most relevant tests, checks, or verification commands that are feasible for the touched area. If full validation is too expensive, run the closest credible subset and say what remains.
6. Record outcome.
   Move step state forward in `plan-status.md`, capture validation evidence, and note deviations, blockers, or follow-up work.
7. Reassess the next step.
   Confirm what remains, what is blocked, and whether the plan still holds. Surface required plan adjustments explicitly, but stop after the current step.
8. Close out completed execution.
   If this invocation completes the final remaining plan step and validation is recorded, move `docs/features/in-progress/<folder>/` to `docs/features/completed/<folder>/`. Record that the move happened as part of the final execution update.

## Rules

- Treat the spec as authoritative for intended behavior; treat the plan as the execution guide.
- Require a user-provided feature folder and resolve execution artifacts from that folder.
- When invoked as `/execute-plan <folder>`, automatically resolve `spec.md`, `plan.md`, and `plan-status.md` from `docs/features/in-progress/<folder>/`.
- Execute exactly one plan step per invocation.
- If that step completes the full plan, move the feature folder from `docs/features/in-progress/<folder>/` to `docs/features/completed/<folder>/`.
- Keep `plan-status.md` current as the live execution record, not an end-of-task summary.
- Prefer small, sequential, reviewable increments over broad multi-step edits.
- Surface deviations from the plan explicitly before changing direction.
- Record blockers, unexpected findings, and notable execution decisions in `plan-status.md`.
- Avoid scope creep. Do not fold optional cleanup or unrelated fixes into the active step.
- Emphasize validation after meaningful changes and record what was actually verified.

## Progressive Disclosure

Read [execution-status-template.md](references/execution-status-template.md) when:

- `plan-status.md` is missing
- you need the canonical status structure
- you need blocker, deviation, or handoff reporting templates

Read [validation-checklists.md](references/validation-checklists.md) when:

- deciding what to verify for the current increment
- choosing evidence to record in `plan-status.md`
- changes touch migrations, interfaces, stateful flows, or other higher-risk areas
