---
runs: 2
max_turns: 60
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Skill]
expected_outcome: Report flags the planted problems, keeps the cf line and the manual-only skill, changes nothing, and asks for approval.
---

/unfork:audit ./old-setup/.claude
