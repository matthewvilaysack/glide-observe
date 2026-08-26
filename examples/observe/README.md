# Observe view

The observe deck as a Hubble HTML app: one card per environment saying "updated!" or "not updated?", plus the deploy timeline, rendered inside the vault.

## Install into a vault

1. Copy `observe.html` into a folder in your vault, for example `observe/`.
2. Refresh the data note next to it: `./observe-note.sh <vault-dir>` (needs the [observe](https://github.com/matthewvilaysack/observe) CLI on PATH; run it by hand, from a cron, or let an agent do it).
3. Open `observe/observe.html` in Hubble. The view polls `status.md` every five seconds, so a refresh shows up without touching the app.

The note's body is the observe engine's TSV snapshot verbatim; the view knows the row shapes (`meta`, `env`, `tl`) and nothing about any particular project.
Timeline entries are labels only in this surface: Hubble app views cannot open external links, so PR numbers are shown, not linked.
