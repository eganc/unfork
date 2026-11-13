#!/usr/bin/env bash
# A config that is already close to vanilla: one useful global line, one manual-only skill.
set -euo pipefail
C="$PWD/tidy/.claude"
mkdir -p "$C/skills/release-notes"
printf '%s\n' 'When interacting with Cloudflare, use the cf CLI unless the project has a Wrangler configuration file.' > "$C/CLAUDE.md"
printf '%s\n' '{ "model": "opus" }' > "$C/settings.json"
cat > "$C/skills/release-notes/SKILL.md" <<'MD'
---
name: release-notes
description: Drafts release notes from merged pull requests. Run with /release-notes.
disable-model-invocation: true
---

List merged pull requests since the last tag and group them into Added, Changed and Fixed.
MD
