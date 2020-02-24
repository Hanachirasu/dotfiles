#!/bin/sh
current_dir=$(cd "$(dirname "$0")" && pwd)
ln -sf "$current_dir/.zshrc" ~/.zshrc
ln -sf "$current_dir/.zprofile" ~/.zprofile
ln -sf "$current_dir/.vimrc" ~/.vimrc
ln -sf "$current_dir/.dircolors" ~/.dircolors
mkdir -p ~/.config/fontconfig
ln -sf "$current_dir/fonts.conf" ~/.config/fontconfig/fonts.conf
