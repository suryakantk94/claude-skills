# claude-skills

My personal [Claude Code](https://claude.com/claude-code) skills — a growing collection.
Install the plugin once and Claude can run these on any machine.

## Skills

| Skill | What it does |
|---|---|
| `install-aliases` | Installs my portable zsh aliases (`aliases.zsh`) into `~/.zshrc`. Say *"install my aliases"* on a new machine and Claude runs the bundled installer, then reports which optional tools (eza, zoxide, kubectx) are missing. |

_More skills get added under `skills/<name>/` over time — they're auto-discovered._

## Install the plugin

```text
/plugin marketplace add suryakantk94/claude-skills
/plugin install claude-skills@claude-skills
```

> After installation, run `/reload-plugins` (or restart Claude Code) so the new skills register.

## Just want the aliases (no Claude needed)

The `install-aliases` skill bundles a plain installer you can run directly:

```bash
git clone https://github.com/suryakantk94/claude-skills.git
cd claude-skills
./skills/install-aliases/install.sh
source ~/.zshrc
```

It appends a single `source` line to `~/.zshrc` pointing at `skills/install-aliases/aliases.zsh`
(idempotent — safe to run twice). Because it *sources* the file, a later `git pull` updates your
aliases everywhere.

### Aliases included

| Group | Aliases |
|---|---|
| Shell | `ls` (eza), `cd` (zoxide), `restartzsh` |
| Git | `gst` `gfp` `gp` `gcm` `gpo` `gcb` `gs` `gsp` |
| Kubernetes | `kgp` `kl` `kgs` `kd` `kpf` `kc` `kn` |
| Helm | `helmlogin` |
| Fun | `LetsHaveFunJarvis` |

### Optional dependencies

Tool-wrapping aliases are **guarded** — missing a tool just skips its alias (a fresh machine never gets a broken `ls`/`cd`):

| Tool | Install | Used by |
|---|---|---|
| [eza](https://github.com/eza-community/eza) | `brew install eza` | `ls` |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | `brew install zoxide` + `eval "$(zoxide init zsh)"` | `cd` |
| [kubectx/kubens](https://github.com/ahmetb/kubectx) | `brew install kubectx` | `kc`, `kn` |
| git `co` alias | `git config --global alias.co checkout` | `gcm`, `gcb` |

## Adding a new skill

Create `skills/<name>/SKILL.md` with frontmatter:

```markdown
---
name: <name>
description: One-line trigger description — when Claude should use this skill.
---

# <Title>

Steps Claude follows. Bundle any helper files (scripts, configs) in the same folder.
```

## License

MIT
