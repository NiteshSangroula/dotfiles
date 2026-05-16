# ~/.bashrc

# =========================================================
# BASIC SETTINGS
# =========================================================

# History
HISTSIZE=5000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
shopt -s checkwinsize

# Better history search behavior
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Reload bashrc quickly
alias brc='source ~/.bashrc'

# =========================================================
# ENVIRONMENT
# =========================================================

export LANG=en_US.UTF-8
export EDITOR='nvim'

# Java
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH="$JAVA_HOME/bin:$PATH"

# Custom paths
export PATH="$HOME/.local/share/nvim/lsp_servers/lua_ls/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"

# =========================================================
# NVM (lazy-loaded)
# =========================================================

export NVM_DIR="$HOME/.nvm"

nvm() {
    unset -f nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    nvm "$@"
}

# =========================================================
# FZF
# =========================================================

# Use ripgrep for file search
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# Better CTRL+R history search
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:wrap"

# Load fzf keybindings/completion
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash

# =========================================================
# ZOXIDE
# =========================================================

eval "$(zoxide init bash)"

# =========================================================
# TMUX SESSIONIZER
# =========================================================

bind -x '"\C-@": tmux-sessionizer.sh'

alias tmuxdir='tmux new -s "$(basename "$PWD")"'

# =========================================================
# ALIASES
# =========================================================

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'

# Better tools
alias ls='eza --icons'
alias ll='eza -lh --icons'
alias la='eza -lah --icons'

alias cat='bat'

# Safer operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Disk usage
alias du='du -h'
alias df='df -h'

# Trash instead of delete
alias trash='trash-put'

# Git
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias ga='git add'
alias gc='git commit -m'

# =========================================================
# STARSHIP PROMPT
# =========================================================

eval "$(starship init bash)"
