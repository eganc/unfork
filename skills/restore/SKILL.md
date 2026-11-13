---
name: restore
description: Undoes changes made by the Unfork audit by restoring files and plugin states from an unfork backup folder. Use only when the user asks to undo or restore an Unfork cleanup.
disable-model-invocation: true
---

Restore my Claude setup from an Unfork backup.

1. List the folders matching `~/.claude/backups/unfork-*`, newest first, with the date and
   what each `MANIFEST.md` says was changed. If there are none, say so and stop.
2. Ask which backup to restore. Default to the newest one, and offer to restore all of it
   or only some items.
3. Before restoring, show what will happen to each item: which file is copied back to
   which path, which file it replaces, and which plugins are re-enabled. If a file
   changed after the backup was made, point that out, since restoring it will overwrite
   the newer version.
4. Wait for my approval, then:
   - Copy each file back to its original path. Keep the backup folder.
   - Run `claude plugin enable <plugin>` for each plugin the manifest lists as enabled.
5. Report what was restored and anything you skipped. Remind me to start a new session
   so the restored setup loads.

If I ran the cleanup in chat or Cowork, the changes were made in claude.ai settings, so
nothing here can undo them. Tell me which settings pages to revisit instead.
