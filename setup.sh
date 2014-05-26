#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 
# Taken from the Stanford Startup course and then modified by
# William DeMeo <williamdemeo@gmail.com>
# Date: 2013.07.14

echo
echo 'This script will install/configure some useful tools on a Ubuntu Linux machine.'
echo
echo 'Here is a summary of what will be installed:'
echo
echo '    1.  git-core (main components required to use Git version control software)'
echo '    2.  node (server side JavaScript), and the node version manager (nvm)'
echo '    3.  jshint (allows checking JS code within emacs; see http://jshint.com/)'
echo '    4.  rlwrap (libreadline features for node; see: http://nodejs.org/api/repl.html)'
echo '    5.  emacs24 (a recent release of Emacs) and emacs-goodies-el'
echo '    6.  dotfiles.wjd (configuration files; see: https://github.com/williamdemeo/dotfiles.wjd'
echo '            Specifically, .profile, .bashrc, .bash_aliases, .bash_profile, .bashrc_custom,'
echo '            .screenrc, .emacs.  These files alter the behavior of the Linux command line,'
echo '            emacs, and the screen program. Your original versions will not be deleted.'
echo
read -p 'Abort this setup script? [Y/n]' -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]] 
then
    echo
    echo 'Setup aborted.'
    echo
    exit
fi
echo

###############################################################################
echo
echo '    1.  git-core (main components required to use Git version control software)'
echo
sudo apt-get install -y git-core

###############################################################################
echo
echo '    2.  node (server side JavaScript), and the node version manager (nvm)'
echo
# Install nvm: node-version manager
# https://github.com/creationix/nvm
git clone https://github.com/creationix/nvm.git ~/.nvm
echo
# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

###############################################################################
echo
echo '    3.  jshint (allows checking JS code within emacs; see http://jshint.com/)'
echo
# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

###############################################################################
echo
echo '    4.  rlwrap (libreadline features for node; see: http://nodejs.org/api/repl.html)'
echo
# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

###############################################################################
echo
echo '    5.  emacs24 (a recent release of Emacs) and emacs-goodies-el'
echo
# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg
sudo apt-get install emacs-goodies-el

###############################################################################
echo
echo '    6.  dotfiles.wjd (configuration files; see: https://github.com/williamdemeo/dotfiles.wjd'
echo
cd $HOME
dotfiles_path=$HOME'/.dotfiles.wjd'

# Check for pre-existing .dotfiles.wjd directory
# If one exists, ask whether to rename it and continue. (Otherwise, abort.)
if [ -d $dotfiles_path/ ]; then
    echo
    echo '    Directory '$dotfiles_path' already exists...'
    read -p '    Rename it? [Y/n]' -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
	mv $dotfiles_path $dotfiles_path'_backup_'$(date +'%Y%m%d:%H:%M')
    else
	echo
	echo '    Aborting setup. (Please rename '$dotfiles_path' and try again.)'
	echo
	exit
    fi
fi

echo

# Also move pre-existing dotfiles.wjd out of the way:
if [ -d $HOME'/dotfiles.wjd' ]; then
    mv $HOME'/dotfiles.wjd' $HOME'/dotfiles.wjd.tmp'
fi

# Get the dotfiles.wjd repository, then rename it to keep $HOME looking cleaner:
git clone https://github.com/williamdemeo/dotfiles.wjd.git
cd dotfiles.wjd
git remote set-url origin git@github.com:williamdemeo/dotfiles.wjd.git
cd 
mv dotfiles.wjd .dotfiles.wjd 

# Restore possibly pre-existing dotfiles.wjd:
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

# Don't do the same for directory links as it might cause infinite link loops.
# Instead, do:
if [ -h $HOME'/.emacs.d' ]; then
    mv $HOME'/.emacs.d' $HOME'/.emacs.d.orig'
fi
ln -s ~/.dotfiles.wjd/emacs.d.wjd ~/.emacs.d
ln -sb --suffix='.orig' ~/.dotfiles.wjd/emacs.d.wjd/init.el ~/.emacs

echo
echo
echo '    Configuration is complete.'
echo
echo '    Assuming all went well, the dotfiles.wjd repository has been cloned and'
echo '    saved at ~/.dotfiles.wjd (and your dot files now link to that directory).'
echo
echo '    If you want to use Magit in Emacs, see the instructions at the bottom of'
echo '    the file ~/.dotfiles.wjd/README.md.'
echo   
echo '    You can post comments, questions, or feedback in a comment box at:'
echo '    http://williamdemeo.org.'
echo

