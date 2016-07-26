#!/bin/sh
apt-get update && apt-get -y install zsh vim vim-gtk tmux kdiff3 git git-core git-gui git-doc gitk tilda npm
sudo apt-get update
sudo apt-get install -y python-software-properties software-properties-common
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install -y tmux=2.0-1~ppa1~t
sudo npm install bower -g
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
nvm install 5.0
nvm use 5.0
nvm alias default node


