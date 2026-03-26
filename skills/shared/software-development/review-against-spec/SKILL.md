---
name: review-against-spec
description: Review implementation work for conformance to an existing spec and plan. Use when the user wants to verify whether completed or in-progress work matches the required behavior and approved execution scope. This skill compares code and observed behavior against the spec and plan, prioritizes gaps, regressions, missing tests, and unapproved deviations, and is not a generic code review skill.
---

# Review Against Spec

Review completed or in-progress implementation work against the governing spec and plan. Focus on whether the implementation matches required behavior and approved execution scope, not on general style or broad code quality commentary.

## Trigger

Use this skill when the user wants to:

- verify whether implementation matches the spec
- review work for compliance with intended behavior
- check whether implementation stayed within the approved plan
- identify gaps, regressions, weak tests, or unapproved deviations

Do not use this skill for a generic code review detached from a governing spec and plan.

## Preconditions

Before reviewing, locate:

- the governing spec
- `plan.md` or equivalent approved execution plan
- the implementation artifact to review: code, tests, diff, behavior notes, or observed outputs

If the spec or plan is missing, say the conformance review is limited or blocked. Do not infer missing requirements from the implementation.

## Review Method

1. Re-anchor on the source of truth.
   Pull the required behavior, constraints, acceptance criteria, non-goals, and explicit plan boundaries that govern the reviewed work.
2. Choose the review mode.
   Use a code-focused review when concrete files or diffs are available. Use a behavior-focused review when the evidence is running behavior, logs, screenshots, or test results. Use both when available.
3. Compare against the spec first.
   Look for missing required behavior, behavior regressions, and unresolved assumptions that affect correctness.
4. Compare against the plan second.
   Check whether the implemented scope matches the approved execution boundary, sequencing assumptions, and deferred work listed in the plan.
5. Evaluate validation evidence.
   Check whether tests or other verification meaningfully cover the changed behavior. Call out missing, weak, or misleading validation.
6. Report findings first.
   Lead with the most important findings and keep summaries brief. If there are no major findings, say so explicitly and note residual risk areas.

## Prioritization Rules

- Highest severity: confirmed spec violations, confirmed regressions, and unapproved plan deviations with user-visible or correctness impact
- Medium severity: likely gaps, weak or missing test coverage around risky changes, and deviations that may be intentional but are not approved
- Lowest severity: open questions, unresolved assumptions, and residual risk areas that could not be confirmed from the available evidence

Within each severity level, prioritize by user impact, correctness risk, and breadth of affected behavior.

## Comparison Rules

- Treat the spec as authoritative for required behavior.
- Treat the plan as authoritative for approved execution scope and intended step boundaries.
- Distinguish clearly between confirmed defects, likely risks, and open questions.
- Encourage concrete file and line references when reviewing code.
- Surface plan deviations explicitly instead of recasting them as acceptable unless approval is documented.
- If implementation appears correct but validation is weak, report that as a testing finding rather than a behavior defect.

## Progressive Disclosure

Read [review-template.md](references/review-template.md) when writing the review output.

Read [review-modes.md](references/review-modes.md) when deciding how to review code evidence versus behavior evidence.

Read [compliance-checklists.md](references/compliance-checklists.md) when you need detailed prompts for common failure modes, plan drift, or test adequacy checks.
