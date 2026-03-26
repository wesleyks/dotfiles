# Validation Checklists

Use this reference to choose the smallest credible validation for the active increment and to record evidence in `plan-status.md`.

## Execution Checklist

Before validation:

- confirm the change still matches the active plan step boundary
- re-check the spec if the intended behavior was ambiguous during implementation
- identify the highest-signal automated checks for the touched area
- identify any manual verification needed if automated coverage is incomplete

After validation:

- record what passed, failed, or was not run
- note residual risk if validation was partial
- capture blockers or plan-impacting findings in `plan-status.md`
- state the next step only after the current increment has a clear outcome

## Validation Matrix

| Change type | Minimum validation | Stronger validation | Evidence to record |
| --- | --- | --- | --- |
| Pure logic change | Run the narrowest affected unit or module tests | Run adjacent regression tests | Exact test command and result |
| API or CLI contract change | Run focused contract or integration tests | Exercise the interface end to end | Command, response shape, or sample invocation |
| UI behavior change | Run relevant component or frontend tests | Manual smoke path plus automated coverage | Test command and manual path checked |
| Database or migration change | Run migration or schema checks in a safe environment | Apply migration and exercise read/write path | Migration command, result, and touched flow |
| State machine or workflow change | Exercise the affected transition path | Run full scenario or regression suite | Steps validated and observed outcome |
| Config or build change | Run the narrow build, lint, or config validation | Run the full build or startup path | Command and whether artifacts/startup succeeded |
| Refactor with intended behavior unchanged | Run existing regression tests for touched modules | Add or run characterization coverage | Test command and unchanged behavior claim |
| Bug fix with known reproduction | Reproduce before, then verify after | Add a regression test if feasible | Repro steps, test added or command run |
| Background job or async flow | Run focused job tests or dry-run path | Execute end-to-end with observable side effects | Command, queue/job path, and observed result |
| Docs-only or non-runtime metadata change | Verify links, examples, or formatting as applicable | Run doc lint or example commands | What was checked and result |

## When Validation Is Limited

If full validation is not feasible:

- run the closest credible subset
- state why the preferred validation was not run
- record the remaining risk explicitly
- avoid claiming completion beyond the evidence you have
