---
runs: 2
max_turns: 15
timeout_seconds: 300
allowed_tools: [Read, Glob, Grep, Skill]
expected_outcome: Says the folder doesn't exist and asks for the right path, without inventing findings.
---

/unfork:audit ./no-such-folder/.claude
