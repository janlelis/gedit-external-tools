#!/usr/bin/env ruby
# [Gedit Tool]
# Name=[selection] crypto hash
# Shortcut=<Control><Alt>x
# Applicability=all
# Output=replace-selection
# Input=selection
# Save-files=nothing


# Replaces selected text with a sha/md5 hash value of it
#  (depends on: ruby, zenity)
#
# Save:   Nothing
# Input:  Current selection
# Output: Replace current selection

require 'digest'

list =
"SHA2\n256\n
SHA2\n384\n
SHA2\n512\n
SHA1\n(160)\n
MD5\n(128)\n"

params = `echo "#{list}" | zenity --list --title='create cryptographic hash' --text='What kind of hash do you want to create? (editable, but press enter after edit!)' --height=210 --column="algorithm" --column="length" --column='salt' --editable --print-column='ALL'`.chop

gets

if params =~ /^(SHA2|SHA1|MD5)\|(.*?)\|(.*)$/ # calculate hash if possible
  print eval "(Digest::#$1.new(#{$2.to_i if $1 == 'SHA2'}) << '#$_' + '#$3').to_s"
else # or don't change input
  print
end
