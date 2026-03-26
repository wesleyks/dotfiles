---
name: codebase-prd-extractor
description: Derive rewrite-oriented PRDs and supporting specs from an existing codebase and write them into `docs/prds/<folder>/` for rewrites, migrations, or greenfield reimplementation work on a different stack. Use when Codex needs to reverse-engineer product behavior, business rules, workflows, interfaces, invariants, and migration constraints from source code, tests, configs, migrations, or repository docs, especially when the output should become a reusable PRD set with progressive disclosure for large systems.
---

# Codebase PRD Extractor

Extract rewrite-ready PRDs and supporting specs from a codebase. Treat the code as the source of truth, prefer evidence over guesses, and leave a PRD set under a user-selected folder in `docs/prds/<folder>/` that another engineer or agent could use to rebuild the system on a different technology stack.

## Outputs

Write outputs under `docs/prds/<folder>/`, where `<folder>` is provided by the user or inferred from the requested scope.

If the user gives a folder such as `core-specs`, place every generated file under `docs/prds/core-specs/`.

Start with a top-level index file that links to the rest of the spec set. Use a stable, obvious name such as:

```text
docs/prds/
  <folder>/
    README.md
    prd.md
    functional-spec.md
    data-and-contracts.md
    migration-notes.md
    product-behavior.md
    domains/
    components/
    appendices/
```

Treat that file tree as an example, not a required schema. For small systems, one or two files may be enough. For large systems, split aggressively and link files together instead of creating one giant document.

## Workflow

1. Determine the rewrite boundary and output folder.
   Clarify which app, service, package, or feature set the user wants specified, and which output folder should contain the PRDs. If the user does not provide a folder name, infer a short, stable folder name from the requested scope and state that assumption in the docs.
2. Build evidence from the codebase.
   Inspect entrypoints, routing, schemas, API contracts, jobs, tests, feature flags, migrations, and operational config. Prefer primary implementation files and tests over comments or stale docs.
3. Separate fact from inference.
   Mark confirmed behavior as observed from code or tests. Mark inferred behavior when the code strongly suggests intent but does not fully prove it.
4. Translate implementation into rewrite requirements.
   Focus on user-visible behavior, state transitions, invariants, interfaces, failure modes, data ownership, background processing, security constraints, and operational assumptions. Preserve the requirements, not the old stack.
5. Write the PRD set into `docs/prds/<folder>/`.
   Create a concise index first, then add focused PRDs or supporting specs for areas that would otherwise make the index too large.
6. Validate coverage.
   Check that each major subsystem, external interface, and important data model is represented somewhere in the PRD set. Note unknowns and open questions explicitly.

## Technology Neutrality

Use the current stack as evidence, not as the target design.

- Document framework- or library-specific details only when they express behavior the rewrite must preserve.
- Avoid prescribing the replacement framework, ORM, queue, deployment platform, or frontend architecture unless the user explicitly asks for that recommendation.
- Rewrite implementation details into portable requirements. For example, prefer `Invalidate cached pricing after plan changes` over `Use Next.js tag revalidation after Stripe webhook handlers run`.
- When the current implementation leaks constraints from the stack, separate them into:
  - product or business requirements that must survive the rewrite
  - incidental implementation choices that a new stack may replace
- If the user wants a stack-specific rewrite plan in addition to the PRD, keep that in a separate file from the core product requirements.

## Progressive Disclosure

Use progressive disclosure by default for medium or large codebases.

- Keep `docs/prds/<folder>/README.md` short. It should describe the system at a high level and link to deeper files.
- Put cross-cutting concerns in standalone files such as `functional-spec.md`, `data-and-contracts.md`, `security.md`, or `migration-notes.md`.
- Put subsystem details in separate files under folders like `components/`, `domains/`, or `appendices/`.
- Link downward from summaries to details. Avoid copying the same detail into multiple files.
- If a section exceeds a few screenfuls, split it into a child file and replace the detail with a short summary plus link.

Read [spec-templates.md](references/spec-templates.md) when you need concrete file shapes. Read [extraction-checklist.md](references/extraction-checklist.md) when you need a reminder of what to pull from the codebase.

## Spec Writing Rules

- Write in imperative, concrete language.
- Describe required behavior for the rewrite, backed by observed current behavior.
- Prefer bullets and short sections over narrative prose.
- Include file paths, endpoint names, table names, events, and job names when they matter.
- Preserve uncertainty honestly. Use `Unknown`, `Not yet verified`, or `Inference` labels when needed.
- Capture rewrite constraints, not just implementation details. Explain what must remain true in a fresh implementation, and avoid binding the doc to the current framework unless the behavior depends on it.
- Prefer capability language over tool language. Describe what the system must do before mentioning how the legacy stack currently does it.
- Do not dump raw code into the spec. Summarize the behavior and cite the relevant source files.

## Minimum Coverage

Unless the repository is extremely small, cover these areas somewhere in the spec set:

- Product purpose and scope
- User personas or operators when they are implied by the system
- Core user journeys and business outcomes
- Functional requirements and business rules
- Core domain entities and data relationships
- External interfaces: HTTP, RPC, queues, cron, webhooks, CLI, or UI flows
- State transitions and business rules
- Background jobs and async processing
- Authentication, authorization, and trust boundaries
- Configuration, environment assumptions, and deploy/runtime dependencies
- Error handling, retries, idempotency, and failure modes
- Migration or rewrite risks, including behavior that is easy to break

## Preferred Process In Repo

When working in a repository:

1. Discover the relevant source files first.
2. Draft `docs/prds/<folder>/README.md` with scope, rewrite goal, and a link map.
3. Write `prd.md` and `functional-spec.md` before documenting lower-level implementation evidence.
4. Fill in the highest-risk or least-obvious subsystem docs next.
5. Backfill lower-risk areas after the product behavior and requirements are documented.
6. End with open questions, ambiguities, and assumptions.

## Final Check

Before finishing:

- Confirm every PRD or supporting spec file lives under `docs/prds/<folder>/`.
- Confirm the top-level index links to every deeper file.
- Confirm large sections are split rather than inlined.
- Confirm the PRD set is sufficient for a rewrite from scratch on a different stack without rereading the whole codebase.
- Confirm the documents do not accidentally prescribe a replacement stack unless the user asked for that.
