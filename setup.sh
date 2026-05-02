#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install Homebrew if not installed
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install oh-my-zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Create symlinks for dotfiles
ln -sf "$DOTFILES_DIR/.config" ~/.config
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/.zshenv" ~/.zshenv
ln -sf "$DOTFILES_DIR/.vim" ~/.vim
ln -sf "$DOTFILES_DIR/.zprofile" ~/.zprofile

# Make nvim socket scripts executable
chmod +x "$DOTFILES_DIR/nvim_scripts/next_socket.sh"
chmod +x "$DOTFILES_DIR/nvim_scripts/read_socket.sh"

# Install brew packages
brew install fzf the_silver_searcher

# Set up fzf key bindings (Ctrl+R history search, etc.)
$(brew --prefix)/opt/fzf/install --all --no-update-rc

# Install pip packages
pip3 install neovim-remote

echo "Dotfiles setup complete!"
