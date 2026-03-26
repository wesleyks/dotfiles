# Spec Templates

Use these templates as starting points. Trim unused sections instead of leaving placeholders behind. Adapt the structure to the system being documented instead of forcing every file or section into existence.

## `docs/prds/<folder>/README.md`

```markdown
# Rewrite Documentation Index

## Scope
- Describe the product or subsystem covered by this spec set.
- State what is intentionally out of scope.

## Rewrite Goal
- Describe what a fresh implementation must preserve.

## Technology Neutrality
- State that the PRD preserves behavior and constraints, not the legacy stack.
- Call out any implementation details that are incidental and safe to replace.

## Evidence Basis
- Summarize which parts of the current codebase were inspected.

## Document Map
- [PRD](./prd.md)
- [Functional Spec](./functional-spec.md)
- [Data and Contracts](./data-and-contracts.md)
- [Product Behavior](./product-behavior.md)
- [Security](./security.md)
- [Components](./components/)
- [Appendices](./appendices/)

## Known Unknowns
- List gaps, ambiguities, or parts not yet verified.
```

## `docs/prds/<folder>/prd.md`

```markdown
# Product Requirements Document

## Problem And Goal
- Describe what this system enables and why it exists.

## Users
- Describe end users, operators, or integrated systems.

## Core Requirements
- List the must-have behaviors that the rewrite must preserve.

## User Journeys
- Describe the main end-to-end flows.

## Non-Goals
- List what does not need to be preserved.

## Technology-Specific Notes
- Include only if some behavior is coupled to the current stack and that coupling matters to the rewrite.
- Separate mandatory compatibility requirements from incidental implementation choices.

## Open Questions
- List unresolved behavior or business intent.
```

## `docs/prds/<folder>/functional-spec.md`

```markdown
# Functional Specification

## Scope
- Describe what this functional spec covers.

## Flows
- Describe the key end-to-end behaviors.

## Business Rules And Invariants
- List invariants, guardrails, and validation rules.

## State Transitions
- Describe lifecycle changes for the main entities.

## Failure Behavior
- Describe user-visible errors, retries, and degraded modes.

## Portability Notes
- Record any legacy framework behavior that appears important.
- Rewrite it as a portable requirement where possible.
```

## `docs/prds/<folder>/data-and-contracts.md`

```markdown
# Data And Contracts

## Domain Entities
- Describe the main entities and relationships.

## External Contracts
- Describe APIs, events, files, webhooks, and integration surfaces.

## Validation Rules
- Describe field constraints, uniqueness, and referential rules.

## Migration Constraints
- Describe compatibility or data-porting requirements for the rewrite.
```

## `docs/prds/<folder>/components/<name>.md`

```markdown
# <Component Name>

## Responsibility
- Describe what this component owns.

## Inputs
- APIs, events, jobs, tables, files, or UI actions consumed.

## Outputs
- APIs, events, writes, side effects, or rendered views produced.

## Internal Rules
- Describe the important processing logic and invariants.

## Edge Cases
- Describe special handling, retries, idempotency, and failure paths.

## Source Evidence
- `path/to/file`
- `path/to/test`
```

## Split Guidance

Split into deeper files when any of these happen:

- A file mixes multiple bounded contexts or subsystems.
- A single section grows beyond roughly 150 to 250 lines.
- A reader would need to scroll extensively to find one specific behavior.
- The same file is serving both high-level orientation and low-level edge cases.

When splitting, keep the parent file as a map. Replace moved detail with a 2 to 5 bullet summary and a direct link to the child file.
