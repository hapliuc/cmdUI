#!/bin/sh
# cmdUI v0.0.3
# Module: cmdMenu
# Author: C.A. Hapliuc

cmdMenu(){
  p="$1"; shift
  x="$#"
  for _ in $(seq "$(($#/3))"); do
    cmdItem "$1" "$2" "\033[0;00m" "$3"
    shift 3
  done
  cmdItem -n "$(cmdAnsi -r)" "$p [1-$((x/3))]: "
  read -r _optMenu
}