# Execution Status Template

Use this as the canonical structure for `plan-status.md`. Keep step titles and ordering aligned with `plan.md`.

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

- before starting a new increment
- after a meaningful validation run
- when a blocker or unexpected finding appears
- when execution deviates from the plan
- before pausing or handing work off

## Usage Guidance

- Keep only one step in `In Progress`.
- Move steps between sections as work advances; do not duplicate the same step across sections.
- Keep validation evidence concrete: command run, test suite, manual path checked, or artifact inspected.
- Record partial validation honestly and note what still remains.
- If `plan.md` changes, resync step titles and ordering immediately.
