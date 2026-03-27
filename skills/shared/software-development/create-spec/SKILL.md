---
name: create-spec
description: Turn a rough request into a clear, implementation-ready spec by clarifying scope, defining requirements, surfacing ambiguity, and producing a structured document that separates confirmed requirements, assumptions, and open questions. Use when the user wants to define requirements, write a spec, clarify scope, or turn a vague idea into an implementation plan that is ready for planning and coding.
---

# Create Spec

Convert a vague or partial request into a high-quality implementation spec. Reduce ambiguity before coding starts. Treat user clarification as authoritative and keep a clear distinction between confirmed requirements, assumptions, and unresolved questions.

## Trigger

Use this skill when the user wants to:

- define or refine requirements
- write a spec
- clarify scope
- turn an idea, feature request, or rough plan into an implementation-ready document
- identify missing decisions before planning or coding

## Output

Store the spec at `docs/features/in-progress/<folder>/spec.md`.

Use the user-provided `<folder>` when one is given. Otherwise infer a short kebab-case folder name from the feature or project name. If revising an existing spec, reuse its current folder instead of creating a new one.

Produce a structured spec artifact with these sections unless the user asks for a different shape:

- problem
- goals
- non-goals
- users / stakeholders
- requirements
- edge cases
- constraints
- acceptance criteria
- open questions

Within the spec, label content clearly as:

- Confirmed
- Assumption
- Open question

## Workflow

1. Assess completeness.
   Identify whether the request already has enough information for a reliable spec. If not, determine the minimum missing information that blocks a trustworthy spec.
2. Determine the artifact path.
   Choose the `docs/features/in-progress/<folder>/spec.md` destination before drafting. Prefer a user-provided folder. Otherwise infer one from the request and keep it stable through later planning and execution work.
3. Clarify before settling.
   When disambiguation is needed, call the user-input tool to ask focused follow-up questions for missing scope, users, constraints, success criteria, or edge cases. Prefer a small number of high-leverage questions. If the tool is unavailable in the current environment, fall back to concise plain-text questions.
4. Offer bounded options when needed.
   If ambiguity remains, propose a small set of concrete options with tradeoffs. Do not force a false choice: always leave room for the user to choose a different direction or provide their own answer.
5. Treat the user as the authority.
   Replace defaults or earlier suggestions with the user's clarification whenever they provide one.
6. Draft the spec.
   Write the spec at `docs/features/in-progress/<folder>/spec.md` using concise, testable language. Separate settled facts from assumptions and unresolved questions.
7. Tighten acceptance criteria.
   Rewrite vague success statements into observable, testable acceptance criteria where possible.
8. Check implementation readiness.
   Before finishing, confirm the spec is specific enough for planning and coding, and call out any remaining uncertainty explicitly.

## Rules

- Bias toward reducing ambiguity before implementation starts.
- Do not present guesses as settled requirements.
- If the request is too vague, do not draft a confident spec immediately. First use the user-input tool to ask for the minimum missing information needed. If the tool is unavailable, ask concise plain-text questions instead.
- Store specs under `docs/features/in-progress/<folder>/`; do not place them in ad hoc locations.
- Use a user-provided folder when available. Otherwise infer one from the request instead of blocking on naming.
- When proposing options, keep the set small and include tradeoffs.
- Preserve unresolved items instead of papering over them.
- Prefer concise requirements and concise acceptance criteria over narrative prose.

## Progressive Disclosure

Read [spec-template.md](references/spec-template.md) when drafting or revising the actual spec artifact.

Read [clarification-patterns.md](references/clarification-patterns.md) when:

- the request is underspecified
- you need to ask follow-up questions efficiently
- you need to propose decision options with tradeoffs
- you need examples of how to separate confirmed requirements, assumptions, and open questions
