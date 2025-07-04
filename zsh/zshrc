# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"  # You can switch to "powerlevel10k/powerlevel10k" if you install it

# Plugins
plugins=(
  git
  z
  sudo
  colored-man-pages
  history-substring-search
  command-not-found
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Preferred PATH (put custom bins before system ones)
export PATH="$HOME/.local/share/nvim/lsp_servers/lua_ls/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"

# History search with up/down arrows
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Useful aliases
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'

# Tmux session named after current directory
alias tmuxdir='tmux new -s "$(basename "$PWD")"'

# Safer file operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Git shortcuts
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias ga='git add'
alias gc='git commit -m'

# Edit and reload .zshrc
alias zrc='nvim ~/.zshrc && source ~/.zshrc'

# Language / Locale (optional but good to set)
export LANG=en_US.UTF-8

# Uncomment if using terminal with Nerd Font
# export POWERLEVEL9K_MODE='nerdfont-complete'

# Optional: Editor setting
export EDITOR='nvim'

# Enable command auto-correction
ENABLE_CORRECTION="true"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
