#!/bin/bash

set -e

DOTFILES="$HOME/repos/dotfiles"

echo "→ Installing dotfiles from $DOTFILES"

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
  echo "→ Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install packages from Brewfile
echo "→ Installing packages from Brewfile..."
brew bundle install --file="$DOTFILES/Brewfile"

# Create necessary directories
mkdir -p ~/.config/ghostty

# Symlink configs
echo "→ Creating symlinks..."

ln -sf "$DOTFILES/ghostty/config" ~/.config/ghostty/config
echo "  ✓ ghostty"

ln -sf "$DOTFILES/starship/starship.toml" ~/.config/starship.toml
echo "  ✓ starship"

ln -sf "$DOTFILES/zsh/.zshrc" ~/.zshrc
echo "  ✓ zshrc"

# Add starship to zshrc if not already there
if ! grep -q "starship init zsh" ~/.zshrc; then
  echo 'eval "$(starship init zsh)"' >> ~/.zshrc
  echo "  ✓ starship init added to zshrc"
fi

echo ""
echo "✓ Done. Restart your terminal or run: source ~/.zshrc"
