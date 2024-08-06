#!/bin/sh
# cmdUI v0.0.3
# Module: cmdAnsi
# Author: C.A. Hapliuc

cmdAnsi(){
  if [ "$1" = "-c" ]; then
    f="\033c"
  elif [ "$1" = "-r" ]; then
    f="\033[0;00m"
  else
    case "$1" in
      n) s="0;";; 
      b) s="1;";; 
      d) s="2;";;
    esac
    case "$2" in
      f) c1="3";;
      b) c1="4";;
      F) c1="9";;
      B) c1="10";;
    esac
    case "$3" in
      k) c2="0m";;
      r) c2="1m";;
      g) c2="2m";;
      y) c2="3m";;
      b) c2="4m";;
      m) c2="5m";;
      c) c2="6m";;
      w) c2="7m";;
    esac
    f="\033[$s$c1$c2"
  fi
  printf "%s" "$f"
}