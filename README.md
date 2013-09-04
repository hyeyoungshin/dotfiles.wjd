Introduction
============

This is a modified version of the setup used in the Stanford
Startup Engineering class.

The original repo is at: https://github.com/startup-class/setup

The setup.sh script in this repository contains some useful
commands for configuring some basic things in Ubuntu Linux.

If you want to use the script, you don't need the whole repository.
You can just download the file setup.sh at

    https://raw.github.com/williamdemeo/dotfiles.wjd/master/setup.sh

then do

    chmod a+x setup.sh

    ./setup.sh

The script will grab what it needs.  In particular, it will
install the following:

1.  nvm: node-version manager

2.  git and curl.

3.  jshint (for checking JS code in emacs)

4.  rlwrap (for libreadline features of node)
    (See: http://nodejs.org/api/repl.html#repl_repl)

5.  emacs24

6.  custom versions of config files, including:
    .bashrc, .bashrc_custom, .bash_profile, .bash_aliases, .profile
    .emacs, .screenrc, and a few others.


Notes on Cofiguring/Using Magit
===============================

Installing Magit
----------------

a.  Add a few lines to the bottom of your ~/.emacs.d/init.el file.
    (This was done for you if you ran the setup.sh script as described above.)

        (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

b.  Start emacs and do `M-x package-install`  (no quotes)
    when it prompts you with "Install package:", enter magit.

Using Magit
-----------

Follow the directions here:

    http://magit.github.io/magit/magit.html

You may find them a little confusing at first, but here's a quick and dirty
example to get you started:

a.  Stage a modified file for commit.

    After you've edited a file, say, textfile.txt, using emacs, enter M-x
    magit-status to open the magit status buffer.

    Switch to that buffer (Ctrl+x o), and move the cursor to the line
    where textfile.txt is listed.  Type s to stage that file for commit.

b.  Commit changes.

    Type c, which will bring up a new buffer. Write your commit comments
    there, then type Ctrl+c Ctrl+c to commit the change.

    The first two steps above are covered here:

        http://magit.github.io/magit/magit.html#Staging-and-Committing

c.  Push to github.

    Type  P P  (capitals!)

    This will push everything that is listed under "Unpushed"

    See also:

        http://magit.github.io/magit/magit.html#Pushing-and-Pulling

