#!/bin/sh
# cmdUI v0.0.3
# Utility: cmdHelp
# Author: C.A. Hapliuc

_infoPath="$(dirname "$0")/../info/"
case "$1" in
  cmdAnsi)
    less ${_infoPath}/info_cmdAnsi.txt
    ;;
    cmdItem)
    less ${_infoPath}/info_cmdItem.txt
    ;;
    cmdMenu)
    less ${_infoPath}/info_cmdItem.txt
    ;;
    cmdChecklist)
    less ${_infoPath}/info_cmdChecklist.txt
    ;;
esac 