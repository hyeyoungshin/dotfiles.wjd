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
dotfiles_path=$HOME'/.dotfiles.wjd'
if [ -d $dotfiles_path/ ]; then
    echo 'Directory '$dotfiles_path' already exists...'
    read -p 'Rename it? [Y/n]' -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
	echo $(date +'%Y%m%d:%H:%m')
	mv $dotfiles_path $dotfiles_path'_backup_'$(date +'%Y%m%d:%H:%M')
    else
	echo 'Aborting setup. (Please rename '$dotfiles_path' and try again.)'
	exit
    fi
fi
# Temporarily move pre-existing dotfiles.wjd out of the way:
if [ -d $HOME'/dotfiles.wjd' ]; then
    mv $HOME'/dotfiles.wjd' $HOME'/dotfiles.wjd.tmp'
fi
# Get the dotfiles.wjd repository:
git clone https://github.com/williamdemeo/dotfiles.wjd.git
mv dotfiles.wjd .dotfiles.wjd # renaming it to keep $HOME looking cleaner.

# Restore pre-existing dotfiles.wjd out of the way:
if [ -d $HOME'/dotfiles.wjd.tmp' ]; then
    mv $HOME'/dotfiles.wjd.tmp' $HOME'/dotfiles.wjd'
fi

# Create the required links.
# (If a file or link of that name exists, rename it with .orig extension.)
ln -sb --suffix='.orig' ~/.dotfiles.wjd/screenrc ~/.screenrc
ln -sb --suffix='.orig' ~/.dotfiles.wjd/bashrc.wjd ~/.bashrc
ln -sb --suffix='.orig' ~/.dotfiles.wjd/bashrc_custom.wjd ~/.bashrc_custom
ln -sb --suffix='.orig' ~/.dotfiles.wjd/bash_profile.wjd ~/.bash_profile
ln -sb --suffix='.orig' ~/.dotfiles.wjd/bash_aliases.wjd ~/.bash_aliases
ln -sb --suffix='.orig' ~/.dotfiles.wjd/profile.wjd ~/.profile
ln -sb --suffix='.orig' ~/.dotfiles.wjd/emacs.d.wjd ~/.emacs.d
ln -sb --suffix='.orig' ~/.dotfiles.wjd/emacs.d.wjd/init.el ~/.emacs

echo
echo
echo '  Configuration is complete.'
echo 
echo '  You may now delete setup.sh.'
echo
echo '  The dotfiles.wjd repository has been cloned in ~/.dotfiles.wjd'
echo '  (and a setup.sh file is there if you ever need to run it again).'
echo
echo '  If you want to use Magit in Emacs, there are some instructions at'
echo '  the bottom of the file ~/dotfiles.wjd/README.md.'
echo   
echo '  You can post comments, questions, or feedback in a comment box at:'
echo '  http://williamdemeo.org.'
echo

