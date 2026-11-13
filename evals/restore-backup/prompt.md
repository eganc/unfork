---
runs: 2
max_turns: 30
timeout_seconds: 600
allowed_tools: [Read, Glob, Grep, Skill]
expected_outcome: Lists the backup, shows what would be restored where, flags the changed file, and asks before acting.
---

/unfork:restore ./cfg/.claude
