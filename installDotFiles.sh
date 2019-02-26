#!/usr/bin/env bash

#
# INSTALLS:
#
# - i3			window manager
# - i3blocks		status bar for i3
# - git
# - tig			visual git
# - tmux		terminal multiplexer
# - ruby		ruby is required for tmuxinator
# - ranger		visual directory navigation in the terminal
# - rofi		application launcher/ephemeral terminal
# - compton		window transitions and other visual niceties
# - lxappearance	gtk theme selector
# - curl
# - rxvt-unicode-color	extensible terminal emulator
# - vim			gotta have vim
# - zsh
# - stow		dotfiles manager
# - xclip		clipboard manager we need for tmux

sudo apt install -y \
	i3 i3blocks \
	git tig \
	tmux \
	ruby \
	ranger \
	rofi \
	compton lxappearance \
	curl \
	rxvt-unicode-256color \
	vim \
	zsh \
	stow \
	xclip

# We'll use GNU Stow to manage the installation of our dotfiles
# https://www.gnu.org/software/stow/
# If you're just peeking and wondering what is going on:
# stow creates symlinks to our dotfiles relative to the directory passed as an argument
# e.g. user@host: ~/.dotfiles/ $ stow bash
# creates:
#   ~/.bashrc -> ~/.dotfiles/bash/.bashrc
#   ~/.bash_aliases -> ~/.dotfiles/bash/.bash_aliases
#   ~/.inputrc -> ~/.dotfiles/bash/.inputrc

# .fonts
# - SourceCodePro		github.com/adobe-fonts/source-code-pro
# - Anonymous Pro		www.marksimonson.com/fonts/view/anonymous-pro
# - Font-Awesome		github.com/FortAwesome/Font-Awesome
# all fonts included are under the Open Font Licence (OFL).
# if you already have some custom fonts installed here, you may want to reconsider this.
stow --verbose=2 fonts

# bash config
rm -f ~/.bashrc
rm -f ~/.bash_aliases
rm -f ~/.inputrc
stow --verbose=2 bash

# tmux config
# clone the tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# link to our tmux.conf
stow --verbose=2 tmux

# i3 config
stow --verbose=2 i3

# urxvt + rofi config
stow --verbose=2 Xresources

# vim config
stow --verbose=2 vim

# setup zsh+zprezto
git submodule update --init --recursive
stow --verbose=2 zsh

# tig config
stow --verbose=2 tig

# themes
stow --verbose=2 themes

