#!/bin/sh

. ../cmdUI.sh

menuExample(){
  cmdItem "$(cmdAnsi -c)$(cmdAnsi n F c)" "󰍜  Example Menu" "$(cmdAnsi d f k)" " (x to exit)"
  cmdMenu "Select an item" \
    "$(cmdAnsi b f b)" " [] " "Social Media" \
    "$(cmdAnsi b f g)" " [] " "Operating Systems" \
    "$(cmdAnsi b f y)" " [] " "Linux Distributions"
  case "$_optMenu" in
    1)
    cmdItem "$(cmdAnsi b f w)" "Option selected:" "$(cmdAnsi b f b)" "  " "" "Social Media" 
    cmdItem -n "$(cmdAnsi d f k)" "(enter to continue)"
    read -r _
    ;;
    2)
    cmdItem "$(cmdAnsi b f w)" "Option selected:" "$(cmdAnsi b f g)" "  " "" "Operating Systems"
    cmdItem -n "$(cmdAnsi d f k)" "(enter to continue)"
    read -r _
    ;;
    3)
    cmdItem "$(cmdAnsi b f w)" "Option selected:" "$(cmdAnsi b f y)" "  " "" "Linux Distributions"
    cmdItem -n "$(cmdAnsi d f k)" "(enter to continue)"
    read -r _
    ;;
    x) exit ;;
  esac
  menuExample
}
menuExample
