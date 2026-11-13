# Unfork: clean up your Claude

If you've used Claude Code (or other LLM) for a while, your setup has probably drifted and
accumulated customizations you can no longer remember. A skill you wrote a year ago, a
plugin that injects text at session start, an overly zealous directive to "never suggest
alternatives", a lower effort setting you forgot about when you were desperate to save
tokens. Each one made sense at the time, but together they fork your Claude away from the
default experience, which keeps getting better while your overrides keep you locked in the
past.

This repo is one prompt that audits that drift and helps you undo it. It reports first,
and changes nothing until you approve each item. It's also packaged as a plugin whose
commands only run when you call them, so it adds nothing to your sessions in between.
Installing a tool to remove tools would otherwise defeat the point (of course!), and
you're welcome to uninstall it once you're done.

## The idea

Treat plain vanilla install as the baseline. Everything that loads in every session has
to earn its place. When something should no longer apply, prefer, in order:

1. **Remove it.** Nothing like a little rm to free the soul.
2. **Scope it** to the projects that need it (enable plugins in a project's
   `.claude/settings.json` rather than globally).
3. **Make it manual-only.** `disable-model-invocation: true` in a skill's frontmatter means
   it runs only when you type `/name`, and its description stops loading into context.
4. **Rewrite it,** as the last resort.

What's worth keeping globally is usually small: facts about you and your tools that Claude
can't infer. "Use the cf CLI unless the project has a Wrangler config" is a good global
line. A default tech stack is not.

## Use it

Install the plugin in Claude Code:

```
/plugin install unfork@unfork
```

(If that doesn't find it, add the marketplace first with
`/plugin marketplace add eganc/unfork`.)

Then run `/unfork:audit`, read the report, and approve or reject each change. It measures
how much loads into every session before and after, so you can see what you saved.

Rather not install anything? Paste [`PROMPT.md`](PROMPT.md) into Claude Code instead.

Before you decide, compare against vanilla: run the same task in `claude --safe-mode`,
which starts with all your customizations switched off.

## Where it works

- **Claude Code:** the full audit of `~/.claude` (instructions, skills, plugins, hooks,
  settings).
- **Chat and Cowork:** Claude can't see your files there, so it reviews what it can see
  (your preferences, styles, project instructions and enabled skills) and tells you which
  settings to change.
- **Other agents:** paste `PROMPT.md` into Codex or similar and it audits that agent's
  config instead.

## Undo

Before changing anything, the audit copies every file it will touch into
`~/.claude/backups/unfork-<timestamp>/`. It moves things there instead of deleting them,
and disables plugins rather than uninstalling them. Changed your mind? Run
`/unfork:restore`.

## What it reads and sends

It reads your Claude config and fetches Anthropic's public docs to check its advice
against them. Nothing else leaves your machine, and it stores nothing outside the backup
folder.

**Privacy:** the report lists your skills, plugins and settings, and may quote your
instructions. Don't post it publicly without reading it first.

## What it typically finds

See [`EXAMPLE.md`](EXAMPLE.md) for an anonymised before/after from a real setup.

## Related

Claude Code ships a built-in check, `/doctor prompt-audit` (v2.1.283 or later), for
outdated wording and contradictions in instruction files. This prompt covers the wider
setup too (plugins, hooks, settings, synced skills, global vs project scope), and its
default answer is to remove things rather than reword them.
