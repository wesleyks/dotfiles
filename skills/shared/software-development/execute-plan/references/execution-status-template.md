# Execution Status Template

Use this as the canonical structure for `plan-status.md` in the user-provided feature folder. Keep step titles and ordering aligned with `plan.md`.

## Storage Convention

- Require the user to provide `<folder>`.
- Read execution inputs from `docs/features/in-progress/<folder>/spec.md` and `docs/features/in-progress/<folder>/plan.md`.
- Write status to `docs/features/in-progress/<folder>/plan-status.md`.
- After all steps are complete, move the full feature folder to `docs/features/completed/<folder>/`.

```md
# <Implementation plan title> Status

## Summary

- Overall status:
- Current step:
- Current objective:
- Last updated:
- Spec reference:

## Not Started

- [ ] Step 1: <Short title>

## In Progress

- [ ] Step X: <Short title>
  - Scope for this increment:
  - Files or areas expected to change:
  - Validation target:
  - Started:

## Completed

- [x] Step 0: <Short title>
  - Completed on:
  - Validation evidence:
  - Follow-up notes:

## Blockers

- Blocker:
  - Affects step:
  - Observed:
  - Needed to unblock:
  - Workaround, if any:

## Deviations and Decisions

- Deviation:
  - From plan:
  - Why:
  - Approval or decision:
  - Impact on next steps:

- Execution note:
  - Relevance:
  - Action or implication:

## Next Up

- Next planned step:
- Preconditions:
- Open risks:
```

## Update Points

Update `plan-status.md` at these points:

- before starting the single step selected for this invocation
- after a meaningful validation run
- when a blocker or unexpected finding appears
- when execution deviates from the plan
- before pausing or handing work off
- before moving the feature folder to `docs/features/completed/<folder>/`

## Usage Guidance

- Keep only one step in `In Progress`.
- Execute only one step per invocation, then stop after updating status and validation evidence.
- Move steps between sections as work advances; do not duplicate the same step across sections.
- Keep validation evidence concrete: command run, test suite, manual path checked, or artifact inspected.
- Record partial validation honestly and note what still remains.
- If `plan.md` changes, resync step titles and ordering immediately.
- When execution is fully complete, make the final status update before moving the folder to `docs/features/completed/<folder>/`.
