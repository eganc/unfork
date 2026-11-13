---
name: audit
description: Audits the user's Claude setup for customizations that override default behaviour (global CLAUDE.md, skills, plugins, hooks, settings, profile preferences) and proposes removing, scoping or simplifying each one. Use only when the user asks to audit, clean up, declutter or reset their Claude setup or customizations.
disable-model-invocation: true
---

Audit my Claude setup for anything that changes Claude's default behaviour across all my
work, and help me get back as close to vanilla as I want to be.

Report first. Change nothing until I approve each item.

Starting position: the default Claude experience is good, and every global instruction,
skill, plugin, hook or setting I've added is a fork from it. Each one has to justify being
loaded in every session. When something is questionable, prefer, in order: remove it >
scope it to the projects that need it > make it run only when I ask for it > rewrite it.
Rewriting is the last resort, not the first.

## 0. Work out where you are running

- **Claude Code** (you can read `~/.claude`): do the full audit below.
- **Chat or Cowork** (you can't read `~/.claude`): say that a file-level audit needs
  Claude Code, then audit what you can see in your own context: my profile preferences,
  style, project instructions, memory, and the names and descriptions of the skills,
  plugins and connectors enabled for me. Apply steps 2 to 4 to those, and for each change
  tell me which settings page to open. Don't guess at things you can't see.
- **Another coding agent** (e.g. Codex, with `~/.codex`): audit that agent's equivalents
  (its instructions file, skills, plugins and config) the same way.

## 1. Inventory (Claude Code)

List everything that shapes Claude's behaviour, with file paths:
- `~/.claude/CLAUDE.md` and anything it imports (and `~/CLAUDE.md` or `AGENTS.md` if present)
- `~/.claude/skills/` (including any `synced/` folder), `agents/`, `commands/`, `output-styles/`
- `~/.claude/settings.json` and `settings.local.json`: permissions, hooks, env, model,
  effort and any other value that differs from the default
- Installed plugins: their skills, agents and hooks (especially SessionStart and
  UserPromptSubmit hooks that inject text or send data), and whether each is enabled
  globally or per project. `claude plugin details <name>` shows a plugin's components and
  projected token cost.
- Skills synced from claude.ai and other surfaces. Say which are mine and which are
  Anthropic's or third-party, using the evidence on disk (e.g. a sync manifest). Flag
  skills that load twice under different names.
- The auto-memory folder for my home directory, if it has content

Before the report, ask me to run `/context` and paste the result, so we have a "before"
number for what loads into every session.

## 2. Baseline

Fetch Anthropic's current docs. Don't rely on memory, because guidance changes. Cover:
CLAUDE.md and memory, skills (authoring, descriptions, `disable-model-invocation`),
subagents, hooks vs permissions, plugin scopes, and prompting guidance for current models.
Quote the specific lines you rely on, with links. If a built-in audit exists (e.g.
`/doctor prompt-audit`), say so and use it for the wording checks.

## 3. Review

For each item, decide: keep, scope to projects, make manual-only, rewrite, or remove.
Look for:
- things loaded into every session that only matter for some projects
- skill descriptions that trigger broadly ("proactively", "whenever", "any variation")
- absolute rules and shouting (ALWAYS, NEVER, MUST, "non-negotiable", "do not suggest
  alternatives") that stop Claude from flagging a better option
- project specs, schemas or decisions pushed into always-loaded context
- instructions that work around a missing capability instead of saying it's missing
- stale facts: model names, versions, platform defaults, prices, limits
- duplicates and contradictions between skills, plugins and CLAUDE.md
- settings that quietly lower quality (e.g. a reduced effort level), and hooks doing a job
  the permission system does declaratively
- fixed output-file conventions that override what I ask for in a session

Also say what is good and should stay: facts and preferences Claude couldn't infer.
Don't invent work. If the setup is already close to vanilla, say so.

## 4. Report

- A table: item | file:line | what it changes | the docs line it conflicts with (link) |
  severity | recommended action (keep / scope / manual-only / rewrite / remove)
- The exact commands and edits for each action
- A way for me to compare against vanilla before deciding: `claude --safe-mode` or
  `claude --bare`, or temporarily disabling plugins and moving skills aside

Then stop and wait for me to approve changes one by one.

## 5. When I approve changes

- First copy every file you will touch into `~/.claude/backups/unfork-<timestamp>/`, and
  write a `MANIFEST.md` there listing each original path and each plugin's enabled state.
- Move retired skills and files into that folder. Don't delete them.
- Disable plugins with `claude plugin disable` rather than uninstalling them, unless I
  ask to uninstall. Never edit files inside a plugin's cache.
- Leave edits to claude.ai settings to me, and tell me where to make them.
- Afterwards, ask me to run `/context` again, and show the before and after.
- Tell me the backup folder and how to undo (the `/unfork:restore` command if it's
  installed, otherwise copy the files back by hand).
