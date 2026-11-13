#!/usr/bin/env bash
# A config after an Unfork cleanup: settings.json was edited, a skill was moved to the
# backup, and settings.json has changed again since the backup was made.
set -euo pipefail
C="$PWD/cfg/.claude"
B="$C/backups/unfork-20261101-120000"
mkdir -p "$B/skills/tech-stack" "$C/skills"
printf '%s\n' '{ "model": "opus", "effortLevel": "medium" }' > "$B/settings.json"
cat > "$B/skills/tech-stack/SKILL.md" <<'MD'
---
name: tech-stack
description: Chooses a tech stack for a new project.
---

Help choose a stack.
MD
cat > "$B/MANIFEST.md" <<'MD'
# Unfork backup, 2026-11-01 12:00

| Item | Original path | Action taken |
|---|---|---|
| settings.json | settings.json | removed `effortLevel: medium` |
| skills/tech-stack/ | skills/tech-stack/ | moved here (retired) |

## Plugins

| Plugin | Enabled before |
|---|---|
| deploy-helper@acme | true |
MD
# Changed after the backup: a new setting the user added later.
printf '%s\n' '{ "model": "opus", "voiceEnabled": true }' > "$C/settings.json"
