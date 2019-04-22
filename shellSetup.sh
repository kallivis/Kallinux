#!/bin/sh
mkdir -p ~/tmp
mkdir -p ~/tmp/.vim/
mkdir -p ~/.git
ln -s -f ~/Kallinux/.bash_aliases ~/.bash_aliases
ln -s -f ~/Kallinux/.bash_logout ~/.bash_logout
ln -s -f ~/Kallinux/.bash_profile ~/.bash_profile
ln -s -f ~/Kallinux/.bashrc ~/.bashrc
ln -s -f ~/Kallinux/.gitk ~/.gitk
ln -s -f ~/Kallinux/.gvimrc ~/.gvimrc
ln -s -f ~/Kallinux/.vimrc ~/.vimrc
ln -s -f ~/Kallinux/.zshrc ~/.zshrc
ln -s -f ~/Kallinux/.zshenv ~/.zshenv
ln -s -f ~/Kallinux/.tmux.conf ~/.tmux.conf
ln -s -f ~/Kallinux/shellConfs/ ~/shellConfs
ln -s -f ~/Kallinux/.vim/ ~/.vim
ln -s -f ~/Kallinux/.tmux/ ~/.tmux

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
echo "Info for .gitconfig file"
echo "Name: "
read gitname
echo "Email: "
read gitemail
cp ~/Kallinux/.gitconfigtemplate ~/.gitconfig
sed -i "s/var1/${gitname}/" ~/.gitconfig
sed -i "s/var2/${gitemail}/" ~/.gitconfig
zsh
name=`whoami`
sudo sed -i "s/\(^${name}.*\)\/bin\/.*$/\1\/bin\/zsh/" /etc/passwd
source ~/.zshrc

