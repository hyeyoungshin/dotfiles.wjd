#!/bin/bash

# Make sure git is installed:
sudo apt-get install -y git-core

# Backup any previous versions:
cd $HOME
if [ -d ./dotfiles.wjd/ ]; then
    mv dotfiles.wjd dotfiles.wjd.old
fi

# Get the dotfiles.wjd repository:
git clone https://github.com/williamdemeo/dotfiles.wjd.git

# Create the required links:
ln -sb --suffix='.orig' ~/dotfiles.wjd/bashrc.wjd ~/.bashrc
ln -sb --suffix='.orig' ~/dotfiles.wjd/bashrc_custom.wjd ~/.bashrc_custom
ln -sb --suffix='.orig' ~/dotfiles.wjd/bash_profile.wjd ~/.bash_profile
ln -sb --suffix='.orig' ~/dotfiles.wjd/bash_aliases.wjd ~/.bash_aliases
ln -sb --suffix='.orig' ~/dotfiles.wjd/profile.wjd ~/.profile

