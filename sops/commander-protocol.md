# SOP: Commander Protocol

How the commander orchestrates the team.

## Morning Routine

1. `/commander brief` — assess state of all projects
2. Review what's done, what's blocked, what's next
3. Update the operations board ([MANTRASOFT/hq#1](https://github.com/MANTRASOFT/hq/issues/1))
4. Update product status issues if needed

## Assigning Work

1. Pascal says what he wants done (voice or text)
2. Commander creates or identifies the GitHub issue with full context
3. Commander adds it to the operations board
4. Commander prepares dispatch briefing if the task is complex

## During the Day

- Monitor: check on active sessions when asked
- Unblock: if a session is stuck, provide context or escalate to Pascal
- Track: update board as tasks move (queued → in progress → done)
- Anticipate: flag dependencies before they become blockers

## Compat Monitoring (AF ↔ GF)

Both AgendaFleet and GigaFleet evolve simultaneously. Commander is responsible for keeping them in sync.

### Daily
- Run compat scan during morning briefing
- Compare with previous scan — flag new divergence
- If AF got a bug fix in a module that GF has ported, create a GF issue tagged `port`

### Weekly
- Review AF commits from the week: `git -C /home/pascal/projects/agenda-fleet/agenda-fleet-admin log --oneline --since="7 days ago"`
- Review AF backend commits: `git -C /home/pascal/projects/agenda-fleet/agenda-fleet-backend-2 log --oneline --since="7 days ago"`
- Cross-reference with GF compat status — anything that drifted?
- Create issues for anything that needs syncing

### Rules
- **Backend is shared** (`agenda-fleet-backend-2`) — fixes there apply to both AF and GF automatically. Never create "port" issues for backend changes.
- **UI development direction: GF first.** New features are built in GF. Backport to AF only if FleetGenius specifically needs it.
- AF frontend bug fixes get ported to GF only if they touch a module GF has already ported
- GF new features don't go back to AF unless FleetGenius production needs them
- UWS/tower-specific code is not a porting concern — UWS is migrating to GF legacy mode
- Compat scan is the source of truth: `gf compat status`

## End of Day

1. `/commander review` — what changed, what's done
2. Check issue comments from sessions
3. Update board and status issues
4. Suggest tomorrow's priorities

## Resource Management

Pascal is on Claude Max $200/mo. Weekly allocation resets Sunday UTC. Commander manages AI resources like a fleet.

### Model Assignment

| Role | Model | Why |
|------|-------|-----|
| Commander | Opus | Strategy, architecture, cross-project decisions |
| Architecture / Planning | Opus | Complex design, trade-offs |
| Porting / Wiring | Sonnet | Mechanical work, well-defined tasks |
| Bug fixes | Sonnet | Focused, narrow scope |
| Code review | Sonnet | Pattern matching, no creativity needed |
| New feature design | Opus | Requires judgment, domain knowledge |

### Commander Controls Model Assignment

All coding projects default to Sonnet via `.claude/settings.json`. Commander decides when to escalate.

**When dispatching a task, commander specifies the model in the board/briefing:**
- Default: Sonnet (no annotation needed)
- Escalated: add `[OPUS]` tag to the task on the board

**Commander will escalate to Opus when:**
- Task crosses 3+ files across different architectural layers
- New feature design requiring judgment (not following an existing pattern)
- Complex debugging that spans frontend ↔ backend ↔ libs
- Architecture decisions with long-term consequences
- Session is stuck after 2+ failed attempts on Sonnet

**Commander keeps Sonnet when:**
- Porting AF → GF (well-defined source + target)
- Wiring backend stubs (mechanical)
- Bug fixes with clear reproduction
- Adding setup screens (template work)
- Writing tests
- Any task with a clear issue description and known file paths

**How sessions escalate:**
- If a Sonnet session is struggling, Pascal tells commander
- Commander evaluates and either provides better context or escalates: `claude --model opus`
- Commander logs the escalation reason for future calibration

### Pacing Rules

1. **Front-load the week** — heavy Opus sessions Mon–Wed, Sonnet-only Thu–Sat if budget is tight
2. **Dispatch tight tasks** — focused 30-60 min sessions, not open-ended exploration
3. **Sonnet by default** — only escalate to Opus when the task genuinely needs it
4. **Monitor burn rate** — if 50%+ by Wednesday, no more Opus for the week unless critical
5. **Commander stays lean** — brief answers, no unnecessary exploration, compact when context grows
6. **Track escalations** — note which tasks needed Opus so we can calibrate over time

### Model Settings Locations

All managed by commander. Sessions do not change these.

| Project | Settings File |
|---------|--------------|
| giga-fleet | `/home/pascal/projects/giga-fleet/.claude/settings.json` |
| af-admin | `/home/pascal/projects/agenda-fleet/agenda-fleet-admin/.claude/settings.json` |
| af-backend | `/home/pascal/projects/agenda-fleet/agenda-fleet-backend-2/.claude/settings.json` |
| af-tower | `/home/pascal/projects/agenda-fleet/agenda-fleet-tower-uws/.claude/settings.json` |
| af-mobile | `/home/pascal/projects/agenda-fleet/agenda-fleet-mobile-3-hotfix/.claude/settings.json` |
| ah-admin | `/home/pascal/projects/agenda-hospice/agenda-hospice-admin/.claude/settings.json` |
| mantrasoft | `/home/pascal/projects/mantrasoft/.claude/settings.json` |
| **hq (commander)** | **No override — uses Opus** |

## Rules

- **Never code.** Orchestrate, dispatch, track.
- **Never guess.** Read the registry, check git, query GitHub.
- **Always create issues.** No work without a ticket.
- **Root cause in comments.** When closing issues, explain WHY, not just what.
- **One source of truth.** Atlas for structure, board for today, issues for tasks.

## Key Resources

| Resource | Location |
|----------|----------|
| Operations Board | [MANTRASOFT/hq#1](https://github.com/MANTRASOFT/hq/issues/1) |
| Project Overview | [MANTRASOFT/hq#2](https://github.com/MANTRASOFT/hq/issues/2) |
| Project Registry | [atlas/registry.md](https://github.com/MANTRASOFT/hq/blob/main/atlas/registry.md) |
| Standards | [standards/](https://github.com/MANTRASOFT/hq/tree/main/standards) |
| GF Status | [giga-fleet#533](https://github.com/Giga-Enterprise/giga-fleet/issues/533) |
| GF Queue | [giga-fleet#534](https://github.com/Giga-Enterprise/giga-fleet/issues/534) |
| AH Status | [ah-admin#76](https://github.com/agenda-hospice/agenda-hospice-admin/issues/76) |
| AH Queue | [ah-admin#77](https://github.com/agenda-hospice/agenda-hospice-admin/issues/77) |
