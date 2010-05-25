#!/usr/bin/env ruby
# [Gedit Tool]
# Name=[create] export to syntax highlighted html
# Shortcut=<Control><Alt>h
# Applicability=all
# Input=document
# Output=nothing
# Save-files=nothing


# Exports the current file to syntax highlighted html using coderay
#  (depends on ruby, coderay gem, zenity)
#
# Save:   Nothing
# Input:  Current document
# Output: Nothing

require 'rubygems'
require 'coderay'

supported = {
'application/x-ruby' => 'ruby',
'text/html'          => 'html',
'text/rhtml'         => 'rhtml',
'text/css'           => 'css',
'text/javascript'    => 'java_script',
'application/xml'    => 'xml',
'text/x-csrc'        => 'c',
'text/x-chdr'        => 'cplusplus',
'text/x-c++src'      => 'cplusplus',
'text/x-java'        => 'java',
'text/x-php'         => 'php',
'text/x-python'      => 'python',
'text/x-scheme'      => 'scheme',
'text/x-sql'         => 'sql'
 # ...
}

if lang = supported[ENV['GEDIT_CURRENT_DOCUMENT_TYPE']]
  html = CodeRay::Duo[lang, :page].highlight gets(nil)
  path = `zenity --file-selection --save --title='Please select the location where the syntax html file should be stored' --filename="$GEDIT_CURRENT_DOCUMENT_PATH.html"`
  unless path.empty?
    File.open(path, 'w').puts html
  end
else
  `zenity --error --text='Sorry, language not supported'`
end
