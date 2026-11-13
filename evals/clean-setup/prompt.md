---
runs: 2
max_turns: 40
timeout_seconds: 600
allowed_tools: [Read, Glob, Grep, Skill]
expected_outcome: Says the setup is already close to default and recommends keeping what's there.
---

/unfork:audit ./tidy/.claude
