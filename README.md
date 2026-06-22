# claude-skills — personal zsh aliases

My shell aliases, portable across machines. Clone this repo on a new computer, run the installer, and your aliases come with you.

## Install

```bash
git clone https://github.com/suryakantk94/claude-skills.git
cd claude-skills
./install.sh
source ~/.zshrc
```

`install.sh` appends a single `source` line to your `~/.zshrc` pointing at `aliases.zsh` in this repo (idempotent — safe to run twice). Because it *sources* the file rather than copying, a later `git pull` here updates your aliases everywhere.

Prefer to wire it up by hand? Just add this to `~/.zshrc`:

```zsh
source "/path/to/claude-skills/aliases.zsh"
```

## What's included

| Group | Aliases |
|---|---|
| Shell | `ls` (eza), `cd` (zoxide), `restartzsh` |
| Git | `gst` `gfp` `gp` `gcm` `gpo` `gcb` `gs` `gsp` |
| Kubernetes | `kgp` `kl` `kgs` `kd` `kpf` `kc` `kn` |
| Helm | `helmlogin` |
| Fun | `LetsHaveFunJarvis` |

See [`aliases.zsh`](aliases.zsh) for the exact definitions.

## Dependencies

Aliases that wrap external tools are **guarded** — if the tool isn't installed, the alias is skipped, so a fresh machine never ends up with a broken `ls` or `cd`. For full coverage:

| Tool | Install | Used by |
|---|---|---|
| [eza](https://github.com/eza-community/eza) | `brew install eza` | `ls` |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | `brew install zoxide` + `eval "$(zoxide init zsh)"` in `~/.zshrc` | `cd` |
| [kubectx/kubens](https://github.com/ahmetb/kubectx) | `brew install kubectx` | `kc`, `kn` |
| git `co` alias | `git config --global alias.co checkout` | `gcm`, `gcb` |

## License

MIT
