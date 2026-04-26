#!/usr/bin/env bash

CODE_DIR="$HOME/code"

selected=$(
  find "$CODE_DIR" -mindepth 2 -maxdepth 2 \( -type d -o -type l \) \
  | awk -F/ '{print $(NF-1) "/" $NF "|" $0}' \
  | fzf --delimiter="|" --with-nth=1 --preview 'ls {2}' \
  | cut -d"|" -f2
)

[ -z "$selected" ] && exit 0

session_name=$(basename "$selected" | tr . _)

tmux has-session -t "$session_name" 2>/dev/null

if [ $? -ne 0 ]; then
    tmux new-session -ds "$session_name" -c "$selected"
fi

if [ -n "$TMUX" ]; then
    tmux switch-client -t "$session_name"
else
    tmux attach -t "$session_name"
fi
