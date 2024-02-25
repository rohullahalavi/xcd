#!/bin/bash

# "This application requires the 'zoxide' command to be installed.
# Please visit https://github.com/ajeetdsouza/zoxide to install zoxide.
# ALARM: Make sure you have installed 'zoxide' command 

xcd(){
if [[ $1 == "b" || $1 == "." || $1 == "-" ]]; then
  cd "$OLDPWD"
elif ! [[ $1 == "" ]]; then
  dir=$(eza -D1 `pwd` | sort | egrep -i "$1\w+|$1")
  if [[ $1 == ".." ]]; then
    cd ..
  elif [ -s "$dir" ]; then
    cd `pwd`/"$dir"
  elif [ -z "$dir" ]; then
    mpath=$(zoxide query $1)
    cd $mpath
  fi
else
  cd "$HOME/"
fi

}
alias x="xcd"

