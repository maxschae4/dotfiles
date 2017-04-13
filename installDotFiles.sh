#!/usr/bin/env bash

# Making links interactively and noisily
# If you're just peeking and wondering what is going on:
# ln creates links. -siv creates symoblic links (-s) interactively (-i) and prints the result verbosely (-v)
# this way, we can update the .dotfiles files, and keep all our machines up to date easily via git.

# fonts - sure, it's better/correct to download and install them, but this is so easy.
# all fonts included are under the Open Font Licence (OFL).
# .fonts contains fonts we've installed (and use) in this case, I have 2 nice (open/free licensed) monospace fonts.
# if you already have some custom fonts installed here, you may want to reconsider this.
ln -siv ~/.dotfiles/.fonts ~

# .inputrc - this, this is glorious. it makes using bash so much happier.
# tl;dr: this controls how bash responds to keyboard inputs
# (it goes deeper. see the file comments)
ln -siv ~/.dotfiles/bash/.inputrc ~

# .bash_profile - login shell config
# we're only going to do one thing in there, source ~/.bashrc
# if bash_profile exists, .bashrc doesn't get loaded, and we can't have that.
# ln -siv ~/.dotfiles/bash/.bash_profile ~
cat <<EOF >> ~/.bash_profile

source ~/.bashrc

EOF

# .bashrc - a shell script run when bash is executed.
# we'll source our dotfiles here!
# cat reads standard input to standard output. We take advantage of this.
# <<EOF signifies our terminator (where we stop reading)
# >> ~/.bashrc signifies that we're reading into this file.
# everything we type until EOF is written to the file!
# try it out with this: 
#   make a file:
#   touch blah.txt 
#   cat <<EOF >> blah.txt
#   press enter, you'll note you have a '>' prompt now
#   type a few lines, then when you're ready, on a new line type EOF and hit enter
#   now cat blah.txt (or open it in your favorite editor)
cat <<EOF >> ~/.bashrc

for DOTFILE in `find ~/.dotfiles/bash/sources`
do
	[ -f "$DOTFILE" ] && source "$DOTFILE"
done

EOF

# program installs:

# tig - beautiful git trees and navigating diffs.
sudo apt-get -y install git tig tmux 

# .tmux.conf
# clone the tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# link to our tmux.conf
ln -siv ~/.dotfiles/config/.tmux.conf ~

