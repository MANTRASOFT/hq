# Operations Board

Daily task assignments for Claude coding sessions. Updated by the Commander each morning.

The current board is maintained as a pinned issue on this repo. Sessions read it via:

```bash
gh issue view 1 --repo MANTRASOFT/hq
```

## How It Works

1. **Morning:** Commander runs `/commander brief`, updates the board
2. **Session boot:** Coding session runs `/session <project>`, reads the board, picks a task
3. **During work:** Session works on the assigned issue in the product's repo
4. **Completion:** Session comments on the issue with results, commander updates the board
