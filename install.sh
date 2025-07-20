#!/bin/sh

mkdir -p .config

function link() {
    TARGET=$HOME/$1
	echo "Creating symlink $(pwd)/$1 -> $TARGET"
    if [ -f $TARGET ] || [ -d $TARGET ] || [ -L $TARGET ]; then
        echo "Link $TARGET exists"
    else
        ln -s $(pwd)/$1 $TARGET
    fi
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
link .config/wofi
link .config/waybar

