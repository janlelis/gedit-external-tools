#!/bin/sh
# [Gedit Tool]
# Name=[internet] curl
# Applicability=all
# Output=nothing
# Input=nothing
# Save-files=nothing


# Creates a new document and downloads the entered URL (if valid)
#  (depends on curl, zenity)
#
# Save:   Nothing
# Input:  Nothing
# Output: Nothing
#
# by Jan Lelis (mail@janlelis.de), edited by (you?)

params=`zenity --entry --title='curl' --text='params:' --width=500`

if [ ! -z "$params" ]; then
  curl "$params" | zenity --text-info --title="curl $params" --width=1000 --height=700
fi
