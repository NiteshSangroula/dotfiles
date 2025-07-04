#!/bin/bash

echo "[*] Setting up dotfiles..."

# Home directory shortcuts
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"
LOCAL_BIN="$HOME/.local/bin"

# Create config directories
mkdir -p "$CONFIG_DIR/alacritty"
mkdir -p "$CONFIG_DIR/bspwm"
mkdir -p "$CONFIG_DIR/sxhkd"
mkdir -p "$CONFIG_DIR/picom"
mkdir -p "$CONFIG_DIR/polybar"
mkdir -p "$LOCAL_BIN"

# Symlinks
ln -sf "$DOTFILES_DIR/alacritty/alacritty.toml" "$CONFIG_DIR/alacritty/alacritty.toml"
ln -sf "$DOTFILES_DIR/bspwm/bspwmrc" "$CONFIG_DIR/bspwm/bspwmrc"
ln -sf "$DOTFILES_DIR/sxhkd/sxhkdrc" "$CONFIG_DIR/sxhkd/sxhkdrc"
ln -sf "$DOTFILES_DIR/picom/picom.conf" "$CONFIG_DIR/picom/picom.conf"
ln -sf "$DOTFILES_DIR/polybar/config.ini" "$CONFIG_DIR/polybar/config.ini"
ln -sf "$DOTFILES_DIR/polybar/launch.sh" "$CONFIG_DIR/polybar/launch.sh"
ln -sf "$DOTFILES_DIR/autostart.sh" "$LOCAL_BIN/autostart.sh"

# Set executable permissions
chmod +x "$CONFIG_DIR/bspwm/bspwmrc"
chmod +x "$CONFIG_DIR/sxhkd/sxhkdrc"
chmod +x "$CONFIG_DIR/polybar/launch.sh"
chmod +x "$LOCAL_BIN/autostart.sh"

echo "[✓] All symlinks and permissions set."
