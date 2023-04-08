#!/bin/sh
current_dir=$(cd "$(dirname "$0")" && pwd)

mkdir -p ~/.config

ln -sf "$current_dir/.zshrc" ~/.zshrc
ln -sf "$current_dir/.config/starship.toml" ~/.config/starship.toml

# TODO: 整理する。
# ln -sf "$current_dir/.zprofile" ~/.zprofile
# ln -sf "$current_dir/.vimrc" ~/.vimrc
# ln -sf "$current_dir/.dircolors" ~/.dircolors
# mkdir -p ~/.config/fontconfig
# ln -sf "$current_dir/fonts.conf" ~/.config/fontconfig/fonts.conf
