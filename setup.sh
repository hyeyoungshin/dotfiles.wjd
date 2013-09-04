#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 
# Taken from the Stanford Startup course and then modified by
# William DeMeo <williamdemeo@gmail.com>
# Date: 2013.07.14

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# Backup any previous versions:
cd $HOME
if [ -d ./dotfiles.wjd/ ]; then
    echo 'ERROR: Directory dotfiles.wjd already exists...'
    echo 'ERROR:    ...please rename it and run setup.sh again.'
else
    # Get the dotfiles.wjd repository:
    git clone https://github.com/williamdemeo/dotfiles.wjd.git

    # Create the required links:
    ln -sb --suffix='.orig' ~/dotfiles.wjd/screenrc ~/.screenrc
    ln -sb --suffix='.orig' ~/dotfiles.wjd/bashrc.wjd ~/.bashrc
    ln -sb --suffix='.orig' ~/dotfiles.wjd/bashrc_custom.wjd ~/.bashrc_custom
    ln -sb --suffix='.orig' ~/dotfiles.wjd/bash_profile.wjd ~/.bash_profile
    ln -sb --suffix='.orig' ~/dotfiles.wjd/bash_aliases.wjd ~/.bash_aliases
    ln -sb --suffix='.orig' ~/dotfiles.wjd/profile.wjd ~/.profile
    ln -sb --suffix='.orig' ~/dotfiles.wjd/emacs.d.wjd ~/.emacs.d
    ln -sb --suffix='.orig' ~/dotfiles.wjd/emacs.d.wjd/init.el ~/.emacs
fi

