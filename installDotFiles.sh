#!/usr/bin/env bash

#
# INSTALLS:
# 
# - i3			window manager
# - i3blocks		status bar for i3
# - git
# - tig			visual git
# - tmux		terminal multiplexer
# - ranger		visual directory navigation in the terminal
# - rofi		application launcher/ephemeral terminal
# - compton		window transitions and other visual niceties
# - lxappearance	gtk theme selector
# - curl
# - rxvt-unicode-color	extensible terminal emulator
# - vim			gotta have vim

sudo apt install -y i3 i3blocks git tig tmux ranger rofi compton lxappearance curl rxvt-unicode-256color vim


# Making links interactively and noisily
# If you're just peeking and wondering what is going on:
# ln creates links. -siv creates symoblic links (-s) interactively (-i) and prints the result verbosely (-v)
# this way, we can update the .dotfiles files, and keep all our machines up to date easily via git.

# .fonts
# - SourceCodePro		github.com/adobe-fonts/source-code-pro
# - Anonymous Pro		www.marksimonson.com/fonts/view/anonymous-pro
# - Font-Awesome		github.com/FortAwesome/Font-Awesome
# all fonts included are under the Open Font Licence (OFL).
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

# .bashrc - a shell script run when bash is executed used to modify the bash environment.
cat << 'EOF' >> ~/.bashrc

for DOTFILE in `find ~/.dotfiles/bash/sources`
do
	[ -f "$DOTFILE" ] && source "$DOTFILE"
done

EOF


# tmux config
# clone the tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# link to our tmux.conf
ln -siv ~/.dotfiles/config/.tmux.conf ~

# i3 config
rm -r ~/.dotfiles/config/i3
ln -siv ~/.dotfiles/config/i3 ~/.config/

# urxvt + rofi config
ln -siv ~/.dotfiles/config/.Xresources ~

# vim config
ln -siv ~/.dotfiles/config/.vimrc ~
ln -siv ~/.dotfiles/.vim ~
