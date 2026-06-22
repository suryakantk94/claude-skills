---
name: install-aliases
description: Install the user's personal zsh aliases on the current machine. Use when setting up a new computer or when the user says "install my aliases", "set up my shell aliases", or "bring my aliases here". Sources a bundled aliases.zsh into ~/.zshrc and reports which optional tools (eza, zoxide, kubectx) are missing.
---

# Install personal zsh aliases

Installs the user's portable zsh aliases (bundled here in `aliases.zsh`) by sourcing
them from `~/.zshrc`. Idempotent — safe to run more than once.

## Steps

1. Run the bundled installer. It lives next to this `SKILL.md`:
   ```bash
   bash "${CLAUDE_PLUGIN_ROOT:-.}/skills/install-aliases/install.sh"
   ```
   (If `CLAUDE_PLUGIN_ROOT` isn't set, run `install.sh` from this skill's own directory.)

2. Tell the user to reload the shell so the aliases take effect:
   ```bash
   source ~/.zshrc
   ```

3. Report which optional dependencies are present vs missing:
   ```bash
   for t in eza zoxide kubectx kubens; do
     command -v "$t" >/dev/null 2>&1 && echo "✓ $t" || echo "✗ $t (missing)"
   done
   ```
   Map each to what it unlocks, and give the install command for any that are missing:
   - `eza` → the `ls` alias — `brew install eza`
   - `zoxide` → the `cd` alias — `brew install zoxide`, then add `eval "$(zoxide init zsh)"` to `~/.zshrc`
   - `kubectx` / `kubens` → `kc` / `kn` — `brew install kubectx`
   - `gcm` / `gcb` need a git `co` alias — `git config --global alias.co checkout`

## Notes

- `ls` and `cd` are guarded with `command -v`, so a machine without eza/zoxide keeps the
  built-in commands instead of breaking the shell.
- Because the installer *sources* the file (rather than copying), a later `git pull` in this
  repo updates the user's aliases on every machine that installed this way.
