# Clarification Patterns

Use this reference only when the request is ambiguous or underspecified.

## User Input Tool

Use the user-input tool for disambiguation instead of asking inline whenever the environment supports it.

- Ask only the minimum number of questions needed to unblock a reliable spec.
- Prefer 1 high-leverage question, and avoid more than 3 at once.
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

Ask only the highest-leverage questions first, and send them through the user-input tool when available.

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

## Requirement Status Pattern

Keep requirement status explicit:

- `Confirmed`: directly stated or confirmed by the user
- `Assumption`: reasonable working default not yet confirmed
- `Open question`: unresolved decision that materially affects implementation

## Spec Readiness Check

A spec is usually ready for planning and coding when:

- the problem and target users are clear
- scope and non-goals are explicit
- core requirements are concrete
- major constraints are documented
- acceptance criteria are testable
- unresolved questions are limited and visible
