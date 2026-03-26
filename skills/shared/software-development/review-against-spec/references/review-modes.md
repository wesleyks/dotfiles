# Review Modes

Use the lightest review mode that matches the available evidence. Combine modes when needed.

## Code-Focused Review

Use when you have:

- source files
- diffs
- tests
- configuration changes

Focus on:

- whether the code implements the required spec behavior
- whether the changed scope stays inside the approved plan step or milestone
- whether tests cover the touched behavior and likely failure paths
- whether comments, flags, or TODOs imply unresolved assumptions or deferred work

Expected evidence:

- file and line references
- tests added or missing
- concrete mismatch between code and the governing documents

## Behavior-Focused Review

Use when you have:

- test output
- logs
- screenshots
- manual verification notes
- observed runtime behavior

Focus on:

- whether the observed behavior satisfies acceptance criteria
- whether regressions are visible in exercised flows
- whether claimed completion is supported by the validation evidence
- whether observed behavior suggests hidden plan drift or missing implementation

Expected evidence:

- reproduction steps
- observed versus expected behavior
- validation commands or checks reviewed

## Combined Review

Use when both implementation and observed behavior are available.

Prefer combined review for:

- risky changes
- multi-step plan execution
- regressions with unclear root cause
- situations where code appears compliant but behavior evidence is weak or contradictory
