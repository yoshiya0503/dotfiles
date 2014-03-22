#!/bin/bash

update () {
    git pull
    cp ./.vimrc $HOME
}

setup () {
    mkdir -p ~/.vim/bundle
    git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    git pull
    cp ./.vimrc $HOME
}
