# SOP: Issue Standards

How to write, manage, and close GitHub issues.

## Creating Issues

Every bug report, feature request, or observation becomes a GitHub issue. No work happens without an issue.

### Title
- Action-oriented, scannable
- Good: "Dispatch — markers not showing until route selected"
- Bad: "Fix bug" or "Update code"

### Body
- What's wrong or what's needed
- Where it is (file:line)
- What it should do
- Relevant reference (AF source if porting, plan file if designed)

### Labels
Use consistently: `bug`, `enhancement`, `port`, `ux`, `maps`, `ops`

### No Duplicates
Check existing issues before creating.

## Closing Issues

When fixing an issue:

1. **Comment with root cause** — not just "fixed it" but WHY it was broken
2. **Reference the commit hash** — so anyone can find the exact change
3. **Close the issue** — only when fully resolved

Example comment:
> Root cause: moduleGuard used selectSnapshot before org modules loaded. Fixed in commit 06bfcd89.

## Partial Fixes

If a fix is incomplete:
1. Create a new issue for the remaining work
2. Reference the parent issue
3. Close the parent only when fully resolved

## Where Issues Go

| Product | Issue Tracker |
|---------|--------------|
| GigaFleet (all sub-projects) | `Giga-Enterprise/giga-fleet` |
| AgendaHospice | `agenda-hospice/agenda-hospice-admin` |
| AgendaFleet admin | `pdemilly/agenda-fleet-admin` |
| AgendaFleet backend | `pdemilly/agenda-fleet-backend-2` |
| Mantrasoft platform | `pdemilly/mantrasoft` |
| Operations / team | `MANTRASOFT/hq` |
