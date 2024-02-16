#!/bin/bash

# "This application requires the 'zoxide' command to be installed.
# Please visit https://github.com/ajeetdsouza/zoxide to install zoxide.
# ALARM: Make sure you have installed 'zoxide' command 

xcd(){
 dir=$(eza -D1 `pwd` | sort | egrep -i "$1\w+|$1")
 if [[ $1 == ".." ]]; then
  cd ..
 elif [ -s "$dir" ]; then
  cd `pwd`/"$dir"
  # echo `pwd`/"$dir"
 elif [ -z "$dir" ]; then
   # echo ">--zoxide--<"
   mpath=$(zoxide query $1)
   cd $mpath
  fi
}
alias x="xcd"
