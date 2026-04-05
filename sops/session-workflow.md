# SOP: Session Workflow

How a Claude coding session picks up work, executes, and reports back.

## Starting a Session

1. Open VSCode on the project
2. Start Claude Code in a terminal
3. Run `/session <project>` (e.g., `/session admin`, `/session backend`)
4. Session reads the operations board ([MANTRASOFT/hq#1](https://github.com/MANTRASOFT/hq/issues/1))
5. Pick your task from the available queue
6. Session reads the full issue, loads context, starts working

## During Work

- Follow the project's CLAUDE.md for conventions
- Follow the [company standards](../standards/) for coding rules
- Commit regularly with clear messages
- If blocked, comment on the issue explaining what's blocking

## Completing Work

1. Comment on the assigned issue with:
   - What was done (commits, files changed)
   - Decisions made and why
   - What's left (if anything)
2. Tell Pascal the task is done
3. Commander updates the board

## Rules

- One task per session — don't context-switch
- Read the full issue before starting — it has context
- Check for plan files referenced in the issue
- Check for dependency blockers before starting
- If the issue references AF code to port, read AF first
- Never modify code outside your assigned scope without asking
