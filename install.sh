#!/bin/sh
apt-get update && apt-get -y install zsh vim vim-gtk tmux kdiff3 git git-core git-gui git-doc gitk tilda
sudo apt-get update
sudo apt-get install -y python-software-properties software-properties-common
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install -y tmux=2.0-1~ppa1~t
