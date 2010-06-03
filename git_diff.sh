#!/bin/sh
# [Gedit Tool]
# Name=[git] diff
# Shortcut=<Control><Alt>f
# Applicability=titled
# Output=nothing
# Input=nothing
# Save-files=document


# Saves the current file and shows it differences from current HEAD
#  (depends on git, zenity)
#
# Save:   Current document
# Input:  Nothing
# Output: Nothing
#
# by Jan Lelis (mail@janlelis.de), edited by (you?)

if [ ! -z `git rev-parse --git-dir` ]; then
  diff=`git diff $GEDIT_CURRENT_DOCUMENT_PATH` &&
  if [ -z "$diff" ]; then
    zenity --info --title="git diff" --text='File has not changed.'
  else
    echo "$diff" | zenity --text-info --title="git diff $GEDIT_CURRENT_DOCUMENT_PATH" --width=1000 --height=700 
  fi
else
  zenity --error --title='git diff' --text='Sorry, not a git repository'
fi
