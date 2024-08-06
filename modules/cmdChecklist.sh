#!/bin/sh
# cmdUI v0.0.3
# Module: cmdChecklist
# Author: C.A. Hapliuc

cmdChecklist(){
  if [ ! -f "$1" ]; then
    touch "$1"
  fi
  l=$(wc -l < "$1")
  for i in $(seq "$l"); do
    case $(awk -v i="$i" 'NR==i {print $1}' "$1") in
      0) c="$2"; b="$3";;
      1) c="$4"; b="$5";;
    esac
    s=$(awk -v i="$i" 'NR==i {$1=$2=""; print substr($0,3)}' "$1")
    cmdItem "$c" "$b" "\033[0m" "$s"
  done
  cmdItem -n "$(cmdAnsi -r)" "Command: "
  read -r _optChecklist
  case "$_optChecklist" in
    a)
      cmdItem -n "$(cmdAnsi -r)" "Name: "
      read -r itemName
      echo "0 0 $itemName" >> "$1"
      ;;
    d)
      cmdItem -n "$(cmdAnsi -r)" "Select [1-$l]: "
      read -r item
      sed -i "${item}d" "$1"
      ;;
    c)
      cmdItem -n "$(cmdAnsi -r)" "Select [1-$l]: "
      read -r item
      if [ "$(awk -v i="$item" 'NR==i {print $1}' "$1")" = "0"  ]; then
        state="1"
      else
        state="0"
      fi
      awk -v i="$item" -v s="$state" 'NR==i {$1=s; print}' "$1" > tmp_checklist
      sed -i "${item}d" "$1"
      cat tmp_checklist >> "$1"
      rm tmp_checklist
      ;;
  esac
}