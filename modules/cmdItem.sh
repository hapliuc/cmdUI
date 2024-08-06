#!/bin/sh
# cmdUI v0.0.3
# Module: cmdItem
# Author: C.A. Hapliuc

cmdItem(){
  if [ "$1" = "-n" ]; then
    n=0; shift;
  else
    n=1;
  fi
  for _ in $(seq "$(($#/2))"); do
    printf "$1%s\033[m" "$2" 
    shift 2
  done
  if [ "$n" = 1 ]; then
    printf '\n'
  fi
}