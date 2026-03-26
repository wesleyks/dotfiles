# Review Template

Use this template when delivering a spec/plan conformance review. Findings come first.

```md
# Review Against Spec

## Findings

### High

- Finding: <confirmed spec violation, regression, or unapproved plan deviation>
  - Why it matters:
  - Spec or plan reference:
  - Evidence:
  - File/line reference:

### Medium

- Finding: <likely gap, weak/missing tests, or likely deviation>
  - Why it matters:
  - Spec or plan reference:
  - Evidence:
  - File/line reference:

### Low / Open Questions

- Question or residual risk:
  - Why it matters:
  - Missing evidence:
  - File/line reference, if applicable:

## Residual Risk

- Risk area:
- Risk area:

## Summary

- Conformance result:
- Scope reviewed:
- Validation reviewed:
```

## Guidance

- If there are no major findings, say so explicitly before listing residual risks.
- Keep summaries short; the findings section is the main output.
- Use file and line references whenever concrete code was reviewed.
- Do not present an assumption as a confirmed defect.
