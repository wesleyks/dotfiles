# Plan Template

Use this as the canonical template when producing `plan.md` in the user-provided feature folder. Adapt the section order only when the user's context clearly requires it, but keep the same planning signals.

## Storage Convention

- Require the user to provide `<folder>`.
- Read the governing spec from `docs/features/in-progress/<folder>/spec.md`.
- Write the plan to `docs/features/in-progress/<folder>/plan.md`.
- Keep the plan and spec together so execution work can find the full feature packet in one place.

```md
# <Implementation plan title>

## Source Spec

- Spec:
- Planning scope:
- Relevant constraints:
- Relevant acceptance criteria:

## Planning Notes

- Confirmed planning assumptions:
- Spec mismatches or ambiguities:
- Deferred items:

## Execution Strategy

- Primary sequencing logic:
- Parallelizable work:
- Highest-risk area:

## Ordered Steps

### Step 1: <Short title>

- Objective:
- Depends on:
- Blocks:
- Execution boundary:
- Implementation work:
- Verification work:
- Risks:
- Completion criteria:

### Step 2: <Short title>

- Objective:
- Depends on:
- Blocks:
- Execution boundary:
- Implementation work:
- Verification work:
- Risks:
- Completion criteria:

### Step N: <Short title>

- Objective:
- Depends on:
- Blocks:
- Execution boundary:
- Implementation work:
- Verification work:
- Risks:
- Completion criteria:

## Cross-Cutting Risks

- Risk:
- Risk:

## Validation Checkpoints

- Checkpoint:
- Checkpoint:

## Deferred Work

- Deferred item:
- Deferred item:
```

## Writing Guidance

- Keep steps ordered and dependency-aware.
- Prefer steps that produce a reviewable increment instead of broad activity buckets.
- Use `Execution boundary` to state what is allowed to change in the step and what remains out of scope until later.
- Use `Implementation work` for build tasks and `Verification work` for tests, manual checks, rollout validation, or review gates.
- If a step cannot be completed reliably because the spec is ambiguous, call that out in `Planning Notes` and do not hide the issue inside the step.
- Keep deferred work explicit so later-phase ideas do not blur the current execution path.
