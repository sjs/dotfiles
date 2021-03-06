# ~/.bash_profile: executed by bash(1) for login shells.

alias ls='ls --color'
alias ll='ls -l --color'
alias wg='wget -U AGENT'
alias free='free -m'
alias home='cd $HOME_DIR'
alias v='vim'
alias vi='vim'

source ~/.git-completion.bash
alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias gc="git commit"
alias gp="git push"
alias gu="git gui"

export PYTHONPATH=~/lib/python/

export EDITOR=/usr/bin/vim

MAILCHECK=-1

HISTCONTROL=ignoreboth
HISTSIZE=100

bind "\C-e":clear-screen # bind ^e to clear
alias cds="cd;clear"

# Extends use of 'cd'
# cd ...       # cd ../..
# cd ....      # cd ../../..
# cd ...../foo # cd ../../../../foo

function cd () {
  local -ri n=${#*};
  if [ $n -eq 0 -o -d "${!n}" -o "${!n}" == "-" ]; then
    builtin cd "$@";
  else
    local e="s:\.\.\.:../..:g";
    builtin cd "${@:1:$n-1}" $(sed -e$e -e$e -e$e <<< "${!n}");
  fi
}

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1      ;;
      *.tar.gz)   tar xzf $1      ;;
      *.bz2)      bunzip2 $1      ;;
      *.rar)      rar x $1        ;;
      *.gz)       gunzip $1       ;;
      *.tar)      tar xf $1       ;;
      *.tbz2)     tar xjf $1      ;;
      *.tgz)      tar xzf $1      ;;
      *.zip)      unzip $1        ;;
      *.Z)        uncompress $1   ;;
      *)          echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/'
}
 
PS1='\[\033[01;32m\]\u@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(parse_git_branch)\$ '

#source ~/.bashrc.local
