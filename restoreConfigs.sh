#!/bin/zsh
mkdir -p ~/tmp
mkdir -p ~/tmp/.vim/
mkdir -p ~/.git
#mkdir -p ~/.kde/share/apps
#rm -rf ~/.kde/share/apps/konsole/
ln -s -f ~/mySync/.bash_aliases ~/.bash_aliases
ln -s -f ~/mySync/.bash_logout ~/.bash_logout
ln -s -f ~/mySync/.bash_profile ~/.bash_profile
ln -s -f ~/mySync/.bash_profile ~/.profile
ln -s -f ~/mySync/.bashrc ~/.bashrc
ln -s -f ~/mySync/.emacs ~/.emacs
ln -s -f ~/mySync/.gitconfig ~/.gitconfig
ln -s -f ~/mySync/.gitk ~/.gitk
ln -s -f ~/mySync/.gvimrc ~/.gvimrc
ln -s -f ~/mySync/.vimrc ~/.vimrc
ln -s -f ~/mySync/.zshrc ~/.zshrc
ln -s -f ~/mySync/.zshenv ~/.zshenv
ln -s -f ~/mySync/.tmux.conf ~/.tmux.conf
ln -s -f ~/mySync/konsole/ ~/.kde/share/apps
ln -s -f ~/mySync/.oh-my-zsh/ ~/
ln -s -f ~/mySync/shellConfs/ ~/
source ~/.zshrc
