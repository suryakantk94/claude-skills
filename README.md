# claude-skills

A personal collection of [Claude Code](https://claude.com/claude-code) commands.

## Commands

| Command | What it does |
|---|---|
| `/claude-skills:export-aliases` | Collects every alias from your zsh config (`~/.zshrc`, `~/.zshenv`, `~/.zprofile`, oh-my-zsh custom), de-duplicates them, and outputs a clean `zsh` block you can paste into a new machine's `~/.zshrc`. |

## Installation

Add this repo as a marketplace, then install the plugin:

```text
/plugin marketplace add suryakantk94/claude-skills
/plugin install claude-skills@claude-skills
```

> After installation, run `/reload-plugins` (or restart Claude Code) so the new
> slash commands appear in autocomplete.

Once installed, the commands above become available in Claude Code.

## Adding a command

Drop a new `<name>.md` file in `commands/`. It's exposed as `/claude-skills:<name>`.
A command file is markdown with optional frontmatter:

```markdown
---
description: One-line summary shown in the command list
user-invocable: true
---

# /claude-skills:<name>

Instructions Claude follows when the command runs.
```

## License

MIT
