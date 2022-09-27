#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERMINAL=sakura
export EDITOR=nvim
export BROWSER=firefox

function _prompt() {
    PS1="\[\e[0;32m\]$(set_venv)\[\e[0m\]$(set_git_prompt)\[\e[1;36m\]\W\[\e[0m\]$(set_jobs_prompt) > "
    export PS1
}

set_git_prompt() {
  local output status prompt
  output="$(git status --short 2> /dev/null)"
  prompt="$(git branch 2> /dev/null | grep '*') " || unset prompt

  [[ $output ]] && {
    [[ $(echo "$output" | grep -c "^.*A.*\s.*$")  -gt 0 ]] && status+="a"
    [[ $(echo "$output" | grep -c "^.*C.*\s.*$")  -gt 0 ]] && status+="c"
    [[ $(echo "$output" | grep -c "^.*D.*\s.*$")  -gt 0 ]] && status+="d"
    [[ $(echo "$output" | grep -c "^.*M.*\s.*$")  -gt 0 ]] && status+="m"
    [[ $(echo "$output" | grep -c "^.*R.*\s.*$")  -gt 0 ]] && status+="r"
    [[ $(echo "$output" | grep -c "^.*U.*\s.*$")  -gt 0 ]] && status+="u"
    [[ $(echo "$output" | grep -c "^.*??.*\s.*$") -gt 0 ]] && status+="?"

    [[ $status ]] && prompt+="(${status}) "
  }

  [[ $prompt ]] && echo -n "$prompt"
}

set_jobs_prompt() {
  local JOBS
  JOBS="$(jobs | wc  -l)"
  ((JOBS > 0)) && echo -n " [${JOBS}]"
}

set_venv() {
 [[ $VIRTUAL_ENV ]] &&
   echo "$(basename "$VIRTUAL_ENV") > "
}

PROMPT_COMMAND=_prompt

alias ls='ls --color=auto'


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
