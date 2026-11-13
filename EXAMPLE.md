# Example: one setup, before and after

From a real audit (November 2026), anonymised.

## Before

- **Global CLAUDE.md:** one line about which CLI to use for a hosting provider. Kept.
- **Nine personal skills** (2,168 lines) for a product-planning pipeline: idea
  refinement, tech stack, architecture review, design brief, app-store brief, a
  CLAUDE.md generator and others. All were model-invoked, with descriptions like
  "invoke proactively" and "use whenever someone asks 'should I use X or Y'". The tech
  stack skill fired on ordinary library questions in existing codebases.
- **The CLAUDE.md generator** told Claude to put the full data model and "locked
  decisions" into every project's CLAUDE.md, with a 400-line budget and the line "Do not
  suggest switching any of these without being asked." Anthropic's docs suggest under
  200 lines, and only what Claude can't learn by reading the repo.
- **Two near-identical CLAUDE.md generator skills** with the same trigger phrases.
- **The same six skills loading twice:** local copies, plus older versions uploaded to
  claude.ai that synced back into Claude Code under another name.
- **A skill that required an image-generation tool** Claude Code doesn't have.
- **Stale defaults:** a stack skill whose defaults named a hosting/database combination
  the user no longer mostly used, three contradictory "default stack" statements in one
  file, "Always Stripe. Never anything else" (wrong for app-store digital goods), and a
  framework one platform had moved away from.
- **Five plugins enabled globally.** One injected "do not stop in planning mode, choose
  defaults immediately" into every session started in an empty folder, which was exactly
  where the planning skills ran. Another was installed twice under the same name, and
  one sent telemetry on every prompt.
- **Settings:** `effortLevel: medium`, a hook doing the permission system's job, and
  leftover permissions for a temp folder.

## After

- Planning skills: `disable-model-invocation: true`. They run when called with `/name`
  and cost nothing otherwise.
- CLAUDE.md generators and the image-generation skill: retired. `/init` plus Claude
  reading `docs/` does the job.
- claude.ai uploads of the same skills: deleted, so there's one source of truth.
- Plugins: disabled globally and enabled per project. Duplicate removed.
- Settings: default effort, plain `permissions.allow` entries instead of the hook, stale
  entries removed.
- Global CLAUDE.md: unchanged.
