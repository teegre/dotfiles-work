#
# ~/.bash_profile
#

[[ -d ~/.local/bin ]] && PATH=$PATH:~/.local/bin
[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="/home/stephane/.jenv/shims:${PATH}"
export NVIMRC="/home/stephane/.config/nvim/init.vim"

export JENV_SHELL=bash
export JENV_LOADED=1
unset JAVA_HOME
unset JDK_HOME

jenv rehash 2>/dev/null
jenv refresh-plugins

jenv() {
  type typeset &> /dev/null && typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

source /usr/share/bash-completion/completions/gradle
