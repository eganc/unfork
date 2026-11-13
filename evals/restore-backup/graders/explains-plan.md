---
type: llm
focus: last_message
weight: 3
---

PASS if the reply does all of these, in any format:
1. Names the backup from 2026-11-01.
2. Says what would happen to settings.json: copied back from the backup, or merged with
   the current file. Either is fine.
3. Says the tech-stack skill would go back into skills/.
4. Mentions re-enabling the deploy-helper plugin.
5. Asks the user whether or how to proceed, rather than acting.

FAIL if it says it has already restored anything, or misses any of the five points.
