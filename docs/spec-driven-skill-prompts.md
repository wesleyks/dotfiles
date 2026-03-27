# Spec-Driven Skill Prompts

Use these prompts individually with `skill-creator`. Each prompt is written to enforce progressive disclosure:

- Keep `SKILL.md` concise and procedural.
- Put only core workflow, trigger rules, and navigation in `SKILL.md`.
- Move detailed templates, examples, checklists, and variant-specific guidance into `references/`.
- Add `scripts/` only when deterministic or repetitive steps would otherwise be re-authored often.
- Avoid extra docs such as `README.md`, `CHANGELOG.md`, or setup notes unless they are part of the actual skill behavior.
- Create each skill under `skills/shared/software-development/<skill-name>` so it is repo-managed and available as a shared software-development skill.

## Prompt: `create-spec`

```md
Create a new Codex skill named `create-spec`.

Goal:
This skill should turn a rough user request into a high-quality implementation spec that is suitable for planning and coding.

Location requirement:
Create this skill at `skills/shared/software-development/create-spec`.

Design constraints:
- Follow progressive disclosure principles strictly.
- Keep `SKILL.md` lean: include only trigger conditions, the end-to-end workflow, artifact expectations, and rules for when to load additional references.
- Put detailed spec templates, section-by-section guidance, and example specs into `references/`.
- If you include examples, keep them in `references/`, not inline in `SKILL.md`.
- Do not create extra documentation files outside normal skill structure.

Required behavior:
- Trigger when the user wants to define requirements, write a spec, clarify scope, or turn a vague idea into an implementation-ready document.
- Store specs at `docs/features/in-progress/<folder>/spec.md`, where `<folder>` is user-provided when available or inferred from the request.
- Produce a structured spec artifact with sections such as:
  - problem
  - goals
  - non-goals
  - users / stakeholders
  - requirements
  - edge cases
  - constraints
  - acceptance criteria
  - open questions
- Work with the user to disambiguate anything that is not well defined before treating it as settled.
- When ambiguity remains, propose a small set of concrete options with tradeoffs, but always allow the user to choose a different direction or provide their own answer.
- Treat user clarification as authoritative over defaults or suggested options.
- Distinguish clearly between confirmed requirements, assumptions, and unresolved questions.
- Bias toward reducing ambiguity before implementation starts.
- Encourage concise, testable acceptance criteria.
- If the request is too vague, the skill should first identify the minimum missing information needed to produce a reliable spec and ask focused follow-up questions.

Progressive disclosure requirements:
- `SKILL.md` should explain when to read which reference files.
- Put the canonical spec template in `references/spec-template.md`.
- Put example spec patterns in a separate references file only if needed.
- If multiple kinds of specs are supported, keep selection guidance in `SKILL.md` and variant details in separate reference files.

Deliverables:
- `SKILL.md`
- `agents/openai.yaml`
- Optional `references/` files if they materially improve quality

Also ensure the skill description is explicit enough to trigger reliably.
```

## Prompt: `create-plan`

```md
Create a new Codex skill named `create-plan`.

Goal:
This skill should convert an existing approved spec into an implementation plan with ordered steps, dependencies, validation points, and execution boundaries.

Location requirement:
Create this skill at `skills/shared/software-development/create-plan`.

Design constraints:
- Follow progressive disclosure principles strictly.
- Keep `SKILL.md` focused on workflow and decision rules, not long planning theory.
- Move plan templates, checklists, and examples into `references/`.
- Do not repeat spec-writing guidance; this skill assumes a spec already exists.

Required behavior:
- Trigger when the user has a spec and wants an implementation plan, task breakdown, milestone list, or stepwise execution sequence.
- Support invocation in the form `/create-plan <folder>`.
- Treat the spec as the source of truth.
- Require the user to provide a feature folder.
- Read the spec from `docs/features/in-progress/<folder>/spec.md`.
- Write `plan.md` and `plan-status.md` in that same folder.
- Refuse to silently redefine requirements; instead, surface mismatches or ambiguities back to the user.
- Produce plans that include:
  - ordered steps
  - dependencies
  - risks
  - validation or test checkpoints
  - clear completion criteria per step
- Create a companion `plan-status.md` file that is intended to be updated during execution.
- Structure `plan-status.md` so it can track, at minimum:
  - not started steps
  - in progress steps
  - completed steps
  - blockers
  - notes or deviations from plan
- Prefer plans with small, reviewable increments.
- Separate implementation work from verification work.
- Call out blockers, unknowns, and work that should be deferred.

Progressive disclosure requirements:
- `SKILL.md` should contain the planning workflow and rules for reading optional references.
- Put the canonical plan template in `references/plan-template.md`.
- Put planning heuristics or examples in separate references only if they are needed.
- If the skill supports different plan styles, describe the selection rule in `SKILL.md` and store each style in a separate reference file.

Deliverables:
- `SKILL.md`
- `agents/openai.yaml`
- The skill instructions should direct Codex to generate both `plan.md` and `plan-status.md` as planning artifacts.
- Optional `references/` files if they materially improve quality

Also ensure the skill description makes it clear that this skill plans from an existing spec rather than inventing requirements.
```

## Prompt: `execute-plan`

```md
Create a new Codex skill named `execute-plan`.

Goal:
This skill should implement an approved plan against a codebase in small increments, validate progress, and keep work aligned with the spec and plan.

Location requirement:
Create this skill at `skills/shared/software-development/execute-plan`.

Design constraints:
- Follow progressive disclosure principles strictly.
- Keep `SKILL.md` concise and execution-oriented.
- Put detailed execution checklists, reporting templates, and validation matrices into `references/`.
- Add scripts only if there is a deterministic repetitive action worth automating.

Required behavior:
- Trigger when the user wants the approved plan executed, implemented, or carried through step by step.
- Support invocation in the form `/execute-plan <folder>`.
- Assume a spec and plan already exist.
- Read the spec from `docs/features/in-progress/<folder>/spec.md`.
- Read the plan from `docs/features/in-progress/<folder>/plan.md`.
- Execute exactly one plan step per invocation.
- Update `docs/features/in-progress/<folder>/plan-status.md` during execution.
- If that invocation completes the final remaining step, move `docs/features/in-progress/<folder>/` to `docs/features/completed/<folder>/`.
- Use the plan as an execution guide, but verify against the spec when behavior questions arise.
- Treat `plan-status.md` as the live execution record and update it as work progresses.
- Encourage small, sequential implementation increments with validation after meaningful changes.
- Track what step is in progress, what was completed, and what remains.
- Record blockers, deviations, and notable execution decisions in `plan-status.md`.
- Surface deviations from plan explicitly instead of silently changing direction.
- Emphasize running relevant tests, checks, or verification commands after changes when feasible.
- Report blockers, unexpected findings, and proposed plan adjustments clearly.
- Avoid scope creep.

Progressive disclosure requirements:
- `SKILL.md` should define the core execution loop and explain when to open supporting references.
- Put execution status/report templates in `references/execution-status-template.md`.
- Put validation checklists in a separate reference file.
- Keep tool- or framework-specific execution guidance in separate references if needed.

Deliverables:
- `SKILL.md`
- `agents/openai.yaml`
- Optional `references/` files if they materially improve execution quality

Also ensure the skill description makes the boundary clear: this skill executes an existing plan, updates `plan-status.md`, and does not write the plan itself.
```

## Prompt: `review-against-spec`

```md
Create a new Codex skill named `review-against-spec`.

Goal:
This skill should review completed or in-progress implementation work against the governing spec and plan, with primary focus on gaps, regressions, missing tests, and unapproved deviations.

Location requirement:
Create this skill at `skills/shared/software-development/review-against-spec`.

Design constraints:
- Follow progressive disclosure principles strictly.
- Keep `SKILL.md` short and focused on review workflow, severity ordering, and comparison rules.
- Put review checklists, report templates, and examples into `references/`.
- Do not embed long review examples in `SKILL.md`.

Required behavior:
- Trigger when the user wants to verify whether implementation matches the spec or plan, or wants a review focused on compliance with intended behavior.
- Compare code and observed behavior against both:
  - the spec for required behavior
  - the plan for intended execution scope
- Prioritize findings over summary.
- Report:
  - spec gaps
  - behavior regressions
  - missing or weak tests
  - plan deviations
  - unresolved assumptions
- Distinguish clearly between confirmed defects, likely risks, and open questions.
- Encourage file/line references when reviewing concrete code.
- If no major findings are present, say so explicitly and note residual risk areas.

Progressive disclosure requirements:
- `SKILL.md` should contain only the review method, finding prioritization rules, and instructions for loading references.
- Put the review report template in `references/review-template.md`.
- Put detailed checklists for common failure modes in separate reference files if needed.
- If multiple review modes exist, keep selection guidance in `SKILL.md` and mode-specific guidance in references.

Deliverables:
- `SKILL.md`
- `agents/openai.yaml`
- Optional `references/` files if they materially improve review quality

Also ensure the skill description is explicit that this is a spec/plan conformance review skill, not a generic code review skill.
```
