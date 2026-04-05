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
- AF bug fixes always get ported to GF (production safety)
- GF new features don't go back to AF unless production customers need them
- Backend is shared (`agenda-fleet-backend-2`) — changes there affect both automatically
- Compat scan is the source of truth: `gf compat status`

## End of Day

1. `/commander review` — what changed, what's done
2. Check issue comments from sessions
3. Update board and status issues
4. Suggest tomorrow's priorities

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
