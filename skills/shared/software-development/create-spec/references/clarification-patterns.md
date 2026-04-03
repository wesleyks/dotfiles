# Clarification Patterns

Use this reference only when the request is ambiguous or underspecified.

## User Input Tool

Use the user-input tool for disambiguation instead of asking inline whenever the environment supports it.

- Ask only the minimum number of questions needed to unblock a reliable spec.
- Ask and resolve questions one at a time; do not batch unrelated unresolved decisions.
- Use mutually exclusive options when the tool supports them, but always leave room for the user to provide a different answer.
- Treat the user's response as authoritative over defaults or suggested options.
- If the tool is unavailable, fall back to concise plain-text questions.

## Minimum Missing Information

Before asking questions, identify the smallest set of unknowns that prevents a reliable spec. Common blockers:

- who the user or stakeholder is
- what exact outcome is expected
- what is explicitly out of scope
- what constraints must be honored
- how success will be judged

Ask only the highest-leverage question first, resolve it, then continue to the next unresolved item.

## Follow-Up Question Patterns

Prefer focused questions such as:

- "Who is this for, and what do they need to accomplish?"
- "What must be in scope for the first version, and what is explicitly out of scope?"
- "Are there technical or business constraints this spec must respect?"
- "How will we know this is successful once implemented?"

These are good candidates for a user-input tool call because they narrow scope quickly without overloading the user.

## Option Framing Pattern

When the user has not made a decision yet, offer a small set of concrete options with tradeoffs:

```md
Outstanding decision: authentication for the first release

Option A: Email-only sign-in
- Lower implementation cost
- Fewer edge cases
- Less flexible for enterprise rollout

Option B: SSO from the start
- Better fit for enterprise buyers
- Higher implementation and integration cost
- More setup risk for the first release

You can also choose a different direction if neither option fits.
```

If the user-input tool supports structured options, use it for this pattern so the user can respond quickly while still preserving an open-ended path.
When offering options, you may include a recommendation, but the user must be able to provide their own answer.

## Requirement Status Pattern

Keep requirement status explicit:

- `Confirmed`: directly stated or confirmed by the user
- `Assumption`: reasonable working default not yet confirmed
- `Decision needed`: unresolved decision that materially affects implementation and must be discussed directly with the user

## Spec Readiness Check

A spec is usually ready for planning and coding when:

- the problem and target users are clear
- scope and non-goals are explicit
- core requirements are concrete
- major constraints are documented
- acceptance criteria are testable
- material decisions are resolved, or explicitly deferred by the user
