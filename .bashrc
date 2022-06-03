#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERMINAL=sakura
export EDITOR=nvim
export BROWSER=firefox
export SECRET_KEY=""

alias ls='ls --color=auto'
PS1='\W > '

[[ -z $DISPLAY ]] && [[ $XDG_VTNR -eq 1 ]] && {
  startx > .Xoutput 2>&1
  logout
}

if [[ -z "$DISPLAY" ]] && [[ -n "$XDG_VTNR" ]] && [[ "$XDG_VTNR" -gt 1 ]]; then
  wal -Rq
  clear; neofetch
else
  wal -Rteq
fi
  
