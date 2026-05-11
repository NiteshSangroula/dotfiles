#!/usr/bin/env bash
wallpaper=$(find ~/Pictures/Wallpapers -maxdepth 1 -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | shuf -n 1)
hyprctl hyprpaper wallpaper "eDP-1, $wallpaper, cover"
