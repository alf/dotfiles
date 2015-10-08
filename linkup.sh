#!/bin/sh

link() {
    ln -sf "$PWD/$1" "$HOME/$2"
}

link zshrc .zshrc
link gitconfig .gitconfig
link hgrc .hgrc
link vimrc .vimrc
link pylintrc .pylintrc
link zshenv .zshenv
link screenrc .screenrc
link gitglobalignore .gitglobalignore
