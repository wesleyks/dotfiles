# Spec Template

Use this as the canonical template when producing the final artifact. Adapt the section order only when the user's context clearly calls for it.

```md
# <Spec title>

## Problem

What problem is being solved? Why does it matter now?

- Confirmed:
- Assumption:
- Open question:

## Goals

- Confirmed:
- Assumption:

## Non-Goals

- Confirmed:
- Assumption:

## Users / Stakeholders

- Confirmed:
- Assumption:
- Open question:

## Requirements

List concrete behaviors, constraints, and expected outcomes. Prefer numbered requirements when the spec will feed directly into implementation planning.

1. Confirmed:
2. Confirmed:
3. Assumption:
4. Open question:

## Edge Cases

- Confirmed:
- Assumption:
- Open question:

## Constraints

Include technical, business, legal, operational, timeline, compatibility, or rollout constraints.

- Confirmed:
- Assumption:
- Open question:

## Acceptance Criteria

Write concise, testable checks.

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Open Questions

- Question
- Question
```

## Writing Guidance

- Prefer concrete statements over intent-heavy prose.
- If a requirement is not confirmed, label it as `Assumption` or `Open question`.
- Keep acceptance criteria observable. Avoid words like `intuitive`, `fast`, `simple`, or `robust` unless they are tied to measurable checks.
- If the request is still ambiguous after clarification, include the unresolved decision in `Open Questions` instead of pretending it is settled.
- If there are multiple viable approaches, note the chosen direction only if the user confirmed it.

## Acceptance Criteria Heuristics

Strong acceptance criteria are:

- specific
- observable
- scoped to the requested change
- testable by a developer, reviewer, or QA pass

Weak:

- "The UX should feel seamless."
- "The system should be reliable."

Stronger:

- "A signed-in user can complete the flow without leaving the page."
- "If the external API times out, the user sees a retryable error state and no partial write is persisted."
