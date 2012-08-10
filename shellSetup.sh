#!/bin/sh
mkdir -p ~/tmp
mkdir -p ~/tmp/.vim/
mkdir -p ~/.git
mkdir -p ~/.kde/share/apps
#rm -rf ~/.kde/share/apps/konsole/
ln -s -f ~/Kallinux/.bash_aliases ~/.bash_aliases
ln -s -f ~/Kallinux/.bash_logout ~/.bash_logout
ln -s -f ~/Kallinux/.bash_profile ~/.bash_profile
ln -s -f ~/Kallinux/.bashrc ~/.bashrc
ln -s -f ~/Kallinux/.emacs ~/.emacs
ln -s -f ~/Kallinux/.gitconfig ~/.gitconfig
ln -s -f ~/Kallinux/.gitk ~/.gitk
ln -s -f ~/Kallinux/.gvimrc ~/.gvimrc
ln -s -f ~/Kallinux/.vimrc ~/.vimrc
ln -s -f ~/Kallinux/.zshrc ~/.zshrc
ln -s -f ~/Kallinux/.zshenv ~/.zshenv
ln -s -f ~/Kallinux/.tmux.conf ~/.tmux.conf
ln -s -f ~/Kallinux/konsole/ ~/.kde/share/apps
ln -s -f ~/Kallinux/shellConfs/ ~/
git clone https://github.com/kallivis/oh-my-zsh.git ~/.oh-my-zsh
zsh
name=`whoami`
sudo sed -i "s/\(^${name}.*\)\/bin\/.*$/\1\/bin\/bash/" /etc/passwd
source ~/.zshrc

