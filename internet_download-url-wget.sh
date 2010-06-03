#!/bin/sh
# [Gedit Tool]
# Name=[internet] download url (wget)
# Shortcut=<Control><Alt>w
# Applicability=all
# Output=new-document
# Input=nothing
# Save-files=nothing


# Creates a new document and downloads the entered URL (if valid)
#  (depends on wget, zenity)
#
# Save:   Nothing
# Input:  Nothing
# Output: Create new document
#
# by Jan Lelis (mail@janlelis.de), edited by (you?)

url=`zenity --entry --title='Download' --text='URL:'`

if [ ! -z "$url" ]; then
  wget -qO- "$url"
fi
