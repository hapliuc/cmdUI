#!/bin/sh

. ../cmdUI.sh

checklistTodo(){
  cmdItem "$(cmdAnsi -c)$(cmdAnsi n F g)" "󰍜 󰅎 To-Do List" "$(cmdAnsi d f k)" " (x to exit)"
  cmdChecklist "checklist" "$(cmdAnsi b f k)" " [ ] " "$(cmdAnsi b f g)" " [󰸞] "
  if [ "$_optChecklist" = "x" ]; then
    return
  else
    checklistTodo
  fi
}
checklistTodo