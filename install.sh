#!/bin/bash

echo "removing old configs"
rm -rf \
  ~/.config/starship.toml \
  ~/.config/tmux/tmux.conf

cd "$REPO_NAME"

# Make backup of bashrc first
mkdir -p "${HOME}/.backup"
cp "${HOME}/.bashrc" "${HOME}/.backup/.bashrc.$(date +%s).bak"
rm "${HOME}/.bashrc"

stow bash
# stop ghostty
stow gitconfig
# stow mako
# stow nom
# stow pip
stow starship
# stow sway
# stow swaylock
stow tmux
# stop waybar
# stop zsh
