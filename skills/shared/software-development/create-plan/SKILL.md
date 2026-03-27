---
name: create-plan
description: Turn an existing approved spec into an implementation plan with ordered, dependency-aware steps, risks, validation checkpoints, completion criteria, and execution boundaries. Use when the user already has a spec and wants an implementation plan, task breakdown, milestone list, or stepwise execution sequence. This skill plans from the spec as the source of truth; it does not invent or redefine requirements.
---

# Create Plan

Convert an existing approved spec into an execution plan. Treat the spec as authoritative, keep requirement changes visible, and produce small, reviewable increments that separate implementation from verification.

## Trigger

Use this skill when the user already has a spec and wants to:

- create an implementation plan
- break work into ordered steps
- define milestones or execution phases
- generate a task breakdown from an approved spec
- sequence work with dependencies and validation checkpoints

Typical invocation form:

- `/create-plan <folder>`

Do not use this skill to write or rewrite the spec itself.

## Preconditions

Before planning, get the target feature folder from the user and look for the governing spec there.

If the user invokes the skill as `/create-plan <folder>`, treat `<folder>` as the feature folder name automatically.

Resolve the planning artifact set as:

- `docs/features/in-progress/<folder>/spec.md`
- `docs/features/in-progress/<folder>/plan.md`
- `docs/features/in-progress/<folder>/plan-status.md`

If the user does not provide a folder, planning is blocked until one is provided.

If `spec.md` is missing from the requested folder, or the available spec is too incomplete to support reliable sequencing:

- say that planning is blocked on the missing or unapproved spec
- point the user back to spec creation or clarification work
- do not fill the gap by inventing requirements

## Outputs

Generate both planning artifacts in the same folder as the source spec:

- `docs/features/in-progress/<folder>/plan.md`
- `docs/features/in-progress/<folder>/plan-status.md`

`plan.md` is the execution plan.

`plan-status.md` is the tracker intended to be updated during implementation.

## Workflow

1. Validate the source of truth.
   Use the user-provided folder to locate `docs/features/in-progress/<folder>/spec.md`. Pull out confirmed scope, explicit non-goals, constraints, acceptance criteria, and open questions that affect sequencing.
2. Set the artifact location.
   Write `plan.md` and `plan-status.md` into the same folder as `spec.md`. Do not create a separate planning folder.
3. Surface planning blockers early.
   If the spec contains contradictions, missing decisions, or ambiguous requirements that materially change the plan, call them out explicitly. Ask targeted follow-up questions instead of silently resolving them.
4. Derive implementation slices.
   Break the spec into small increments that can be reviewed and validated independently. Prefer boundaries that reduce risk and make progress observable.
5. Order the work.
   Sequence steps by dependency, risk, and enabling value. Make prerequisites explicit. Call out work that can happen in parallel only when the dependency boundaries are clear.
6. Separate implementation from verification.
   For each step, distinguish build work from validation work. Include test, review, or operational checkpoints instead of treating verification as implied.
7. Mark deferred and unknown work.
   Keep non-goals, later-phase items, and unresolved dependencies visible. Do not bury them inside step text.
8. Write both artifacts.
   Produce `plan.md` and `plan-status.md` in the requested feature folder, then do a final pass to ensure every step has a completion signal and the status tracker matches the plan.

## Rules

- Treat the spec as the source of truth.
- Require a user-provided feature folder and resolve the spec from that folder.
- When invoked as `/create-plan <folder>`, automatically resolve the spec from `docs/features/in-progress/<folder>/spec.md`.
- Store `plan.md` and `plan-status.md` in the same folder as `spec.md`.
- Do not silently redefine requirements, scope, or acceptance criteria.
- When planning assumptions are necessary, label them clearly and separate them from confirmed spec statements.
- If a requirement mismatch is found between the spec and the requested plan, surface the mismatch back to the user.
- Prefer small, reviewable increments over large phases with vague outcomes.
- Include ordered steps, dependencies, risks, validation checkpoints, and clear completion criteria.
- Give each step a clear execution boundary: what changes in that step, and what should stay out of scope for that step.
- Separate implementation work from verification work, even when both appear in the same step.
- Call out blockers, unknowns, and deferred work explicitly.
- If open questions in the spec block reliable sequencing, stop and ask for clarification before finalizing the plan.

## Progressive Disclosure

Read [plan-template.md](references/plan-template.md) when producing `plan.md`.

Read [plan-status-template.md](references/plan-status-template.md) when producing `plan-status.md`.
