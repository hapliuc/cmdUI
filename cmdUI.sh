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

