This is a modified version of the setup repo for the Stanford
Startup Engineering class.  

The original repo is at: https://github.com/startup-class/setup

The setup.sh script in this repository contains useful 
commands for configuring some basic things in Ubuntu Linux.

If you want to use the script, you don't need the whole
repository.  Just download the file setup.sh (e.g. with github's 
RAW button), and then do

  chmod a+x setup.sh

  ./setup.sh

The script will grab what it needs.  In particular, it will
install the following:

1. nvm: node-version manager

2. git and curl.

3. jshint (for checking JS code in emacs)

4. rlwrap (for libreadline features of node)
(See: http://nodejs.org/api/repl.html#repl_repl)

5. emacs24

6. custom versions of config files, including:
.bashrc, .bashrc_custom, .bash_profile, .bash_aliases, .profile
.emacs, and a few others.



