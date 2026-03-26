# Compliance Checklists

Use these prompts to inspect common spec/plan conformance failure modes. Load only the sections relevant to the review.

## Spec Conformance Checklist

- Are all explicitly required behaviors implemented?
- Do observed outputs or state transitions match acceptance criteria?
- Are any non-goals or constraints violated by the implementation?
- Did the implementation resolve an open question without documented approval?
- Are edge cases mentioned in the spec unimplemented, contradicted, or untested?

## Plan Conformance Checklist

- Does the reviewed work stay within the intended step or milestone boundary?
- Did the implementation include deferred work that the plan left for later?
- Were sequencing assumptions or prerequisites skipped in a way that changes risk?
- Did the work introduce a direction change without documenting approval?
- Does `plan-status.md` or equivalent execution tracking reflect what actually happened?

## Regression Checklist

- Did existing behavior change outside the intended scope?
- Were compatibility expectations, interfaces, or existing flows broken?
- Do renamed fields, flags, commands, or UI elements create backward-compatibility risk?
- Do tests or observed outputs indicate previously working paths now fail or behave differently?

## Test Adequacy Checklist

- Is there direct validation for the changed behavior?
- Are regression-sensitive paths covered, or only the happy path?
- Do tests assert the intended behavior from the spec, or only implementation details?
- Is any claimed completion unsupported by missing, skipped, or overly broad validation?
- If tests were not added, is there a credible reason and a clearly stated residual risk?

## Assumptions and Open Questions Checklist

- Does the implementation depend on behavior not settled in the spec?
- Are defaults, fallback behaviors, or error cases guessed rather than specified?
- Is there evidence of temporary logic that may become permanent without approval?
- Are there TODOs, comments, or flags that imply incomplete decisions?
