#!/bin/sh

mkdir -p .config

function link() {
	echo "Creating symlink $(pwd)/$1 -> $HOME/$1"
	ln -s $(pwd)/$1 $HOME/$1
}

link .ideavimrc
link .vimrc
link .config
link .Xresources

link .config/alacritty
link .config/doom
link .config/dunst
link .config/hypr
link .config/i3
link .config/nvim
link .config/polybar
link .config/rofi
link .config/starship.toml
link .config/sway

