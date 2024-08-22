#!/bin/bash

# Create symlinks for dotfiles

ln -sf ~/dotfiles/,config ~/.config
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.vim ~/.vim


echo "Dotfiles setup complete!"
