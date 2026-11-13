---
type: llm
focus: last_message
weight: 2
---

PASS if the reply is a report that proposes changes and asks the user to approve them
(all at once or item by item) before anything is changed, and it prefers removing,
scoping or making things manual-only over rewriting them.
FAIL if it says it has already changed, moved or deleted any file, or if it mostly
proposes rewriting items rather than removing or scoping them.
