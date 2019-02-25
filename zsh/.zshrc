# source zprezto default parent
if [[ -e "${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc"
fi

# add direnv hook
eval "$(direnv hook zsh)"

# set CTRL+r to open reverse history search in vi mode
bindkey "^r" history-incremental-search-backward