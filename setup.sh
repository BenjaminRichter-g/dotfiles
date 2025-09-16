#!/bin/bash

# Create symlinks for dotfiles

ln -sf ~/workspace/dotfiles/.config ~/.config
ln -sf ~/workspace/dotfiles/.zshrc ~/.zshrc
ln -sf ~/workspace/dotfiles/.zshenv ~/.zshenv
ln -sf ~/workspace/dotfiles/.vim ~/.vim
ln -sf ~/workspace/dotfiles/.zprofile ~/.zprofile


echo "Dotfiles setup complete!"
