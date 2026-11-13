# Clean up your Claude

If you've used Claude Code for a while, your setup has probably drifted. A skill you
wrote a year ago, a plugin that injects text at session start, a "never suggest
alternatives" line, a lower effort setting you forgot about. Each one made sense at the
time. Together they fork your Claude away from the default experience, which keeps
getting better while your overrides stay frozen.

This repo is one prompt that audits that drift and helps you undo it. It runs once,
reports first, and changes nothing until you approve each item. It doesn't stay installed.

## The idea

Treat vanilla as the baseline. Everything that loads in every session has to earn its
place. When something doesn't, prefer, in order:

1. **Remove it.**
2. **Scope it** to the projects that need it (enable plugins in a project's
   `.claude/settings.json` rather than globally).
3. **Make it manual-only.** `disable-model-invocation: true` in a skill's frontmatter means
   it runs only when you type `/name`, and its description stops loading into context.
4. **Rewrite it.** This is the last resort.

What's worth keeping globally is usually small: facts about you and your tools that
Claude can't infer. "Use the cf CLI unless the project has a Wrangler config" is a good
global line. A default tech stack is not.

## Use it

1. Open Claude Code in your home directory.
2. Paste the contents of [`PROMPT.md`](PROMPT.md).
3. Read the report, then approve or reject each change.

Before you decide, compare against vanilla: run the same task with `claude --bare`, or
with plugins disabled and `~/.claude/skills` moved aside.

**Privacy:** the report lists your skills, plugins and settings, and may quote your
instructions. Don't post it publicly without reading it first.

## Optional: rerun it as a command

If you want to rerun the audit every few months:

```
/plugin marketplace add eganc/clean-up-your-claude
/plugin install setup-drift-audit@setup-drift-audit
```

Then run `/setup-drift-audit:cleanup-claude`. The skill is manual-only, so it adds
nothing to your sessions until you call it. Installing a tool to remove tools would
otherwise defeat the point.

## What it typically finds

See [`EXAMPLE.md`](EXAMPLE.md) for an anonymised before/after from a real setup.

## Related

Claude Code ships a built-in check, `/doctor prompt-audit` (v2.1.283 or later), for
outdated wording and contradictions in instruction files. This prompt covers the wider
setup too (plugins, hooks, settings, synced skills, global vs project scope), and its
default answer is to remove things rather than reword them.
