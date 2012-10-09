#!/bin/bash
# [Gedit Tool]
# Name=rgrep
# Shortcut=F2
# Applicability=all
# Output=output-panel
# Input=nothing
# Save-files=nothing


title="Grep Recursively"

text=`zenity --entry --title="$title" --text="Text to search for" --entry-text="$GEDIT_CURRENT_WORD"`

[ -n "$text" ] || exit

dir=`zenity --file-selection --directory --title="$title" --text="What directory?" --filename="$GEDIT_CURRENT_DOCUMENT_DIR"`

[ -n "$dir" ] || exit

selection=$(grep -RIsin $text $dir | zenity --width=800 --height=500 --list --title="$title" --text "Which match would you like to view?" --column="Matches" --hide-header)

[ -n "$selection" ] || exit

echo $selection | perl -lne 'm/^([^:]+):(\d+):.*$/ && system("gedit", "$1", "+$2")'
