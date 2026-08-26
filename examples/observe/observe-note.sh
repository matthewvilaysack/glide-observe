#!/usr/bin/env bash
# Refresh the Observe status note in a Hubble vault from the observe CLI
# (github.com/matthewvilaysack/observe). The observe.html view in the
# same vault folder renders the note and polls it for changes.
#
#   observe-note.sh <vault-dir>
set -euo pipefail

VAULT="${1:?usage: observe-note.sh <vault-dir>}"
OBSERVE_BIN="${OBSERVE_BIN:-observe}"

command -v "$OBSERVE_BIN" >/dev/null || { echo "observe CLI not found on PATH" >&2; exit 1; }

"$OBSERVE_BIN" --text >/dev/null

SELF="$(readlink -f "$(command -v "$OBSERVE_BIN")" 2>/dev/null || command -v "$OBSERVE_BIN")"
TSV="$(cd "$(dirname "$SELF")/.." && pwd)/data/status.tsv"
[ -f "$TSV" ] || { echo "no gathered data at $TSV" >&2; exit 1; }

mkdir -p "$VAULT/observe"
{
  printf -- '---\nupdated: "%s"\n---\n' "$(date -u '+%Y-%m-%d %H:%M UTC')"
  cat "$TSV"
} > "$VAULT/observe/status.md"
echo "wrote $VAULT/observe/status.md"
