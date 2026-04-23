#!/usr/bin/env bash

CODE_DIRS=(
    "$HOME/code"
)

# 1. find projects (2 levels deep so main/lab works)
selected=$(find "${CODE_DIRS[@]}" -mindepth 1 -maxdepth 2 -type d | fzf)

# exit if nothing selected
[ -z "$selected" ] && exit 0

# 2. create session name (safe format)
session_name=$(basename "$selected" | tr . _)

# 3. check if session exists
tmux has-session -t "$session_name" 2>/dev/null

if [ $? -ne 0 ]; then
    # 4. create session in background
    tmux new-session -ds "$session_name" -c "$selected"
fi

# 5. attach or switch
if [ -n "$TMUX" ]; then
    tmux switch-client -t "$session_name"
else
    tmux attach -t "$session_name"
fi

