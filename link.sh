#!/bin/sh
DIR=$(cd $(dirname $0) && pwd)
ln -sf $DIR/.zshrc ~/.zshrc
ln -sf $DIR/.zprofile ~/.zprofile
ln -sf $DIR/.vimrc ~/.vimrc
ln -sf $DIR/.dircolors ~/.dircolors
mkdir -p ~/.config/fontconfig
ln -sf $DIR/fonts.conf ~/.config/fontconfig/fonts.conf
