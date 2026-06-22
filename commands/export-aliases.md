---
description: Export all shell aliases from your zsh config — ready to paste on a new machine
user-invocable: true
---

# /kloudfuse:export-aliases

Collects every alias from your zsh config files (`~/.zshrc`, `~/.zshenv`, `~/.zprofile`, oh-my-zsh custom), de-duplicates them, and outputs a clean `zsh` block you can paste directly into `~/.zshrc` on a new machine.

## Steps

1. Run:
   ```bash
   grep -E "^alias " ~/.zshrc ~/.zshenv ~/.zprofile ~/.zsh_aliases 2>/dev/null | sed 's/.*://' | sort -u
   grep -rE "^alias " ~/.oh-my-zsh/custom/*.zsh 2>/dev/null
   ```

2. De-duplicate (same alias defined twice — keep the last/most specific definition).

3. Output a fenced `zsh` block grouped logically (git, kubernetes, shell utils, etc.).

4. List any **dependencies** the aliases require (e.g. zoxide for `cd="z"`, eza for `ls`, kubectx/kubens).

## What NOT to do

- Do not include functions, `export`s, or `source` lines — aliases only.
- Do not modify any config files.
- Do not explain each alias unless asked.
