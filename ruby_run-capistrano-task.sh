#!/bin/sh
# [Gedit Tool]
# Name=[ruby] run capistrano task
# Shortcut=<Control><Alt>c
# Applicability=all
# Output=output-panel
# Input=nothing
# Save-files=nothing


# Shows a list with available capistrano tasks and executes the selected one in the bottom pane
#  (depends on ruby, capistrano gem, zenity)
#
# Save:   Nothing
# Input:  Nothing
# Output: Display in bottom pane

export RUBYOPT=rubygems
cmd=`cap -qvT | ruby -ne 'puts $1 if ~/^cap (\S*).*$/' | zenity --list --text='Select the task to run' --title='capistrano' --column='cap --verbose --tasks'`
if [ ! -z "$cmd" ]; then
  echo "cap $cmd"
  cap $cmd
fi
