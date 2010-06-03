#!/bin/sh
# [Gedit Tool]
# Input=selection-document
# Output=nothing
# Name=[selection] speak
# Applicability=all
# Save-files=nothing


# Speaks the selected text (or the whole document)
#  (depends on: espeak)
#
# Save:   Nothing
# Input:  Current selection (default to document)
# Output: Nothing
#
# by Jan Lelis (mail@janlelis.de), edited by (you?)

espeak
# or:
# festival --tts
