# source zprezto default parent
if [[ -e "${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc"
fi

# add direnv hook
eval "$(direnv hook zsh)"
