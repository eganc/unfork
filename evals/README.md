# Evals

Four cases, run with [`claude plugin eval`](https://code.claude.com/docs/en/plugin-evals):

| Case | Setup | Checks |
|---|---|---|
| `messy-setup` | A drifted config with planted problems | Finds them, keeps the two good parts, changes nothing before approval |
| `clean-setup` | A config that's already close to vanilla | Doesn't invent work |
| `missing-folder` | No config at all | Says so instead of making up findings |
| `restore-backup` | A config with an Unfork backup | Explains the restore plan, flags a file that changed since, waits |

Each fixture is built by the case's `fixture.sh` inside the run's throwaway workspace.
Nothing touches your real `~/.claude`.

## Run it

```
claude plugin eval . --scaffold --allow-tools Write Edit Bash --ablation none
```

- `--scaffold` lets the fixture scripts build each test config.
- `--allow-tools Write Edit Bash` hands Claude the tools it would need to make changes, so
  the "changes nothing before approval" checks actually mean something. Bash runs inside
  Claude Code's sandbox.
- `--ablation none` skips the usual with/without-plugin comparison. Both commands are
  manual-only, so without the plugin there's nothing to call and the comparison says
  nothing useful.

A full run is 4 cases × 2 runs. Add `--runs 1` while iterating and `--max-cost-usd` if you
want a ceiling. Results land in `evals/results/`, which git ignores.
