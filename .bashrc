#
# ~/.bashrc
#

neofetch

# remap caps lock to escape
setxkbmap -option caps:escape

# can't live without these
alias ll="ls -lh"
alias la="ls -lah"
alias c="clear"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"
