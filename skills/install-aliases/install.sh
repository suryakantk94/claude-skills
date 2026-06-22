#!/usr/bin/env bash
# Installs kf-aliases by sourcing aliases.zsh from your ~/.zshrc.
# Idempotent: safe to run more than once.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ALIASES_FILE="$SCRIPT_DIR/aliases.zsh"
ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"
MARKER="# kf-aliases"

if [ ! -f "$ALIASES_FILE" ]; then
  echo "error: $ALIASES_FILE not found" >&2
  exit 1
fi

if grep -qF "$MARKER" "$ZSHRC" 2>/dev/null; then
  echo "Already installed — '$MARKER' marker present in $ZSHRC. Nothing to do."
else
  printf '\nsource "%s"  %s\n' "$ALIASES_FILE" "$MARKER" >> "$ZSHRC"
  echo "Added source line to $ZSHRC."
fi

echo
echo "Done. Reload your shell:  source \"$ZSHRC\"   (or open a new terminal)"
echo
echo "Optional dependencies for full coverage:"
echo "  eza        brew install eza                            # ls alias"
echo "  zoxide     brew install zoxide  (+ eval \"\$(zoxide init zsh)\")  # cd alias"
echo "  kubectx    brew install kubectx                        # kc / kn"
echo "  git co     git config --global alias.co checkout       # gcm / gcb"
