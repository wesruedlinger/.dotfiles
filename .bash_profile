#!/bin/bash

# Load dotfiles:
for file in ~/.{aliases,private}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done; 
unset file;

# Bash Title Function
function title {
  if [ -z "$1" ]
  then
    title=${PWD##*/} # current directory
  else
    title=$1 # first param
  fi
  echo -n -e "\033]0;$title\007"
}

#Git auto-complete
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

#Prompt Settings
export PS1="\n\[$(tput sgr0)\]\[\033[38;5;33m\]\u\[$(tput sgr0)\]@[\[$(tput sgr0)\]\[\033[38;5;46m\]\w\[$(tput sgr0)\]]\n\[$(tput sgr0)\]\[\033[38;5;27m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"

#Set Path to include Python3.8 && PIP3
export PATH="/usr/local/opt/python@3/bin:/usr/local/opt/python@3/bin/pip3:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"

#Remove ZSH message
export BASH_SILENCE_DEPRECATION_WARNING=1

#Remove MOTD
mkdir ~/.hushlogin