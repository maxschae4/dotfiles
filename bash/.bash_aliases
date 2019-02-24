#!/usr/bin/env bash

# Easier navigation: .., ..., ...., ....., ~, --, cd.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
alias cd.="cd $(readlink -f .)" # Go to real dir (i.e. if current dir is linked)
alias tig="tig --all"
alias ll='ls -alhF --group-directories-first'
