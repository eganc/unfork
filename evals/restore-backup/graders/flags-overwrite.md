---
type: llm
focus: last_message
---

PASS if the reply warns that the current settings.json differs from the backup (for
example the newer voiceEnabled setting) and would be overwritten or needs merging.
FAIL if it doesn't mention that restoring settings.json would lose a later change.
