# Observe, for Glide

This is a fork of [hubble.md](https://github.com/bholmesdev/hubble.md) kept as the base for Observe: the environment-status surface that [tryglide.com](https://tryglide.com) will use eventually.

Why this base: Hubble already renders Markdown notes and HTML-based app views with live reload, which is exactly the delivery shape Observe wants.
The plan is to ship the [observe](https://github.com/matthewvilaysack/observe) deck (updated or not per environment, a PR-linked deploy timeline) as a Hubble view, so a Glide workspace gets deploy-drift answers inside the same window as its notes.

Working agreements for this fork:

- Track upstream `main`; keep our changes additive (views, skills, branding) so merges stay cheap.
- The deck's data contract stays the observe engine's `status.tsv`, produced by any profile; nothing in this fork learns about a specific project.
- The view lives at `examples/observe/`: `observe.html` (the deck as a Hubble HTML app, polling its data note) and `observe-note.sh` (wraps the observe CLI's snapshot into `observe/status.md` in a vault). Until the Glide integration lands, that example is the integration surface.
