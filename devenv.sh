#!/bin/bash

#TODO:
# 1. add utils to $PATH

cd ~
git clone https://github.com/eyonggu/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
#ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update

cd ~
git clone https://github.com/eyonggu/utils.git  ~/utils
ln -s ~/utils/gitconfig ~/.gitconfig
