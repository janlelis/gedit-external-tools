#!/usr/bin/env ruby
# [Gedit Tool]
# Name=[create] save tabs as tgz
# Shortcut=<Control><Alt>z
# Applicability=titled
# Input=nothing
# Output=nothing
# Save-files=all


# Saves all tabs, then creates a tgz archive of them
#  (depends on tar, ruby, zenity)
#
# Save:   All documents
# Input:  Nothing
# Output: Nothing
#
# by Jan Lelis (mail@janlelis.de), edited by (you?)

save_at = `zenity --file-selection --save --title='Please select the location where the archive should be stored' --filename="$GEDIT_CURRENT_DOCUMENT_DIR/archive.tgz"`.chomp

if save_at && !save_at.empty?
  cmd = 'tar czf ' + save_at + ENV['GEDIT_DOCUMENTS_PATH'].split.map{ |doc|
  " -C #{File.dirname doc} #{File.basename doc}"
  }.join

  `#{cmd} && zenity --info --text='#{save_at}\n...has been successfully created.'`
end
