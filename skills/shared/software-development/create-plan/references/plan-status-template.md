# Plan Status Template

Use this as the canonical template when producing `plan-status.md`. Keep it synchronized with the step titles and ordering in `plan.md`.

```md
# <Implementation plan title> Status

## Summary

- Overall status:
- Current focus:
- Last updated:

## Not Started

- [ ] Step 1: <Short title>
- [ ] Step 2: <Short title>

## In Progress

- [ ] Step X: <Short title>
  - Active work:
  - Next validation point:

## Completed

- [x] Step 0: <Short title>
  - Completed on:
  - Validation evidence:

## Blockers

- Blocker:
  - Affects:
  - Needed to unblock:

## Notes and Deviations

- Note:
- Deviation from plan:
```

## Usage Guidance

- Move a step between sections as execution progresses; do not duplicate the same step in multiple status sections.
- Record blockers even when work continues elsewhere.
- Use `Notes and Deviations` to capture approved plan changes, surprises, or scope adjustments discovered during execution.
- Keep validation evidence short and concrete.
