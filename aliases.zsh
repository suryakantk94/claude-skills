# ─────────────────────────────────────────────────────────────────────────────
# kf-aliases — personal zsh aliases, portable across machines.
# Source from ~/.zshrc:   source /path/to/aliases.zsh
# Or run ./install.sh to wire it up automatically.
# ─────────────────────────────────────────────────────────────────────────────

# ── Shell utilities ──────────────────────────────────────────────────────────
# `ls` → eza (modern ls).  Dependency: eza  (brew install eza)
# Guarded: a machine without eza keeps the normal `ls`.
if command -v eza >/dev/null 2>&1; then
  alias ls="eza --icons=always"
fi

# `cd` → z (zoxide).  Dependency: zoxide  (brew install zoxide + `eval "$(zoxide init zsh)"`)
# Guarded: a machine without zoxide keeps the normal `cd` (otherwise the shell breaks).
if command -v zoxide >/dev/null 2>&1; then
  alias cd="z"
fi

alias restartzsh='source ~/.zshrc'

# ── Git ──────────────────────────────────────────────────────────────────────
alias gst='git status'
alias gfp='git fetch && git pull'
alias gp='git pull'
alias gcm='git co main'          # needs git alias: git config --global alias.co checkout
alias gpo='git push origin'
alias gcb='git co -b'            # needs git alias: git config --global alias.co checkout
alias gs='git stash'
alias gsp='git stash pop'

# ── Kubernetes ───────────────────────────────────────────────────────────────
alias kgp='kubectl get pods'
alias kl='kubectl logs'
alias kgs='kubectl get svc'
alias kd='kubectl describe'
alias kpf='kubectl port-forward'
alias kc='kubectx'              # dependency: kubectx
alias kn='kubens'              # dependency: kubens

# ── Helm ─────────────────────────────────────────────────────────────────────
alias helmlogin='gcloud auth print-access-token | helm registry login -u oauth2accesstoken --password-stdin us-east1-docker.pkg.dev'

# ── Fun ──────────────────────────────────────────────────────────────────────
alias LetsHaveFunJarvis="echo 'At your service, sir.' && claude --dangerously-skip-permissions"
