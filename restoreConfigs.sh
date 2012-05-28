#!/bin/bash
mkdir ~/tmp
mkdir ~/tmp/.vim/
ln -s -f ~/mySync/.bash_aliases ~/.bash_aliases
ln -s -f ~/mySync/.bash_logout ~/.bash_logout
ln -s -f ~/mySync/.bash_profile ~/.bash_profile
ln -s -f ~/mySync/.bashrc ~/.bashrc
ln -s -f ~/mySync/.emacs ~/.emacs
ln -s -f ~/mySync/.gitconfig ~/gitconfig
ln -s -f ~/mySync/.gitk ~/.gik
ln -s -f ~/mySync/.gvimrc ~/.gvimrc
ln -s -f ~/mySync/.vimrc ~/.vimrc
ln -s -f ~/mySync/.zshrc ~/.zshrc
ln -s -f ~/mySync/.zshenv ~/.zshenv
ln -s -f ~/mySync/.zlogin ~/.zlogin
source ~/.bashrc
source ~/.zshrc

