Audit my Claude Code setup for anything that changes Claude's default behaviour across
all my projects, and help me get back as close to vanilla as I want to be.

Work read-only until I approve each change. Report first.

Starting position: the default Claude Code experience is good, and every global
instruction, skill, plugin, hook or setting I've added is a fork from it. Each one has to
justify being loaded in every session. When something is questionable, prefer, in order:
remove it > scope it to the projects that need it > make it run only when I ask for it >
rewrite it. Rewriting is the last resort, not the first.

1. Inventory everything that shapes Claude's behaviour, with file paths:
   - ~/.claude/CLAUDE.md and anything it imports (and ~/CLAUDE.md, AGENTS.md if present)
   - ~/.claude/skills/ (including any synced/ folder), agents/, commands/, output-styles/
   - ~/.claude/settings.json and settings.local.json: permissions, hooks, env, model,
     effort and any other value that differs from the default
   - Installed plugins: their skills, agents, hooks (especially SessionStart and
     UserPromptSubmit hooks that inject text or send data), and whether each is enabled
     globally or per project
   - Skills synced from claude.ai and other surfaces. Say which are mine and which are
     Anthropic's or third-party, using the evidence on disk (e.g. a sync manifest). Flag
     skills that load twice under different names.
   - The auto-memory folder for my home directory, if it has content

2. Fetch Anthropic's current docs. Don't rely on memory, because guidance changes. Cover:
   CLAUDE.md and memory, skills (authoring, descriptions, `disable-model-invocation`),
   subagents, hooks vs permissions, plugin scopes, and prompting guidance for current
   models. Quote the specific lines you rely on, with links. If a built-in audit exists
   (e.g. `/doctor prompt-audit`), say so and use it for the wording checks.

3. For each item, decide: keep, scope to projects, make manual-only, rewrite, or remove.
   Look for:
   - things loaded into every session that only matter for some projects
   - skill descriptions that trigger broadly ("proactively", "whenever", "any variation")
   - absolute rules and shouting (ALWAYS, NEVER, MUST, "non-negotiable", "do not suggest
     alternatives") that stop Claude from flagging a better option
   - project specs, schemas or decisions pushed into always-loaded context
   - instructions that work around a missing capability instead of saying it's missing
   - stale facts: model names, versions, platform defaults, prices, limits
   - duplicates and contradictions between skills, plugins and CLAUDE.md
   - settings that lower quality quietly (e.g. a reduced effort level), and hooks doing a
     job the permission system does declaratively
   - fixed output-file conventions that override what I ask for in a session
   Also say what is good and should stay: facts and preferences Claude couldn't infer.

4. Report:
   - A table: item | file:line | what it changes | the docs line it conflicts with (link) |
     severity | recommended action (keep / scope / manual-only / rewrite / remove)
   - The exact commands and edits for each action, with a backup step first
   - A way for me to compare against vanilla before deciding (e.g. `claude --bare`, or
     temporarily disabling plugins and moving skills aside)

Then stop and wait for me to approve changes one by one.
