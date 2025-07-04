#!/bin/bash

echo "🔧 Starting dotfiles installation..."

# === BASIC PACKAGES (pacman) ===
BASE_PKGS=(
  zsh
  bspwm
  sxhkd
  picom
  polybar
  alacritty
  feh
  git
  neovim
  unzip
  curl
  wget
  tmux
)

echo "📦 Installing base packages with pacman..."
sudo pacman -Syu --needed --noconfirm "${BASE_PKGS[@]}"

# === INSTALL YAY IF MISSING ===
if ! command -v yay &>/dev/null; then
  echo "🚀 yay not found. Installing yay..."
  cd /tmp || exit 1
  git clone https://aur.archlinux.org/yay.git
  cd yay || exit 1
  makepkg -si --noconfirm
fi

# === AUR PACKAGES (zsh plugins, fonts, etc.) ===
AUR_PKGS=(
  ttf-jetbrains-mono
  zsh-autosuggestions
  zsh-syntax-highlighting
  ttf-hack-nerd
)

echo "📦 Installing AUR packages with yay..."
yay -S --needed --noconfirm "${AUR_PKGS[@]}"

# === INSTALL OH MY ZSH ===
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🎩 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# === INSTALL TPM (Tmux Plugin Manager) ===
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "📦 Installing Tmux Plugin Manager (TPM)..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# === CHANGE DEFAULT SHELL TO ZSH ===
if [ "$SHELL" != "/bin/zsh" ]; then
  echo "⚙️ Changing default shell to zsh..."
  chsh -s /bin/zsh
fi

# === RUN DOTFILES SETUP SCRIPT ===
DOTFILES_DIR="$HOME/dotfiles"

if [ -f "$DOTFILES_DIR/setup.sh" ]; then
  echo "🔗 Running setup.sh to create symlinks..."
  bash "$DOTFILES_DIR/setup.sh"
else
  echo "❌ setup.sh not found in $DOTFILES_DIR"
  exit 1
fi

echo "✅ Dotfiles installation complete."
echo "📌 TIP: Launch tmux and press Prefix + I to install plugins."
