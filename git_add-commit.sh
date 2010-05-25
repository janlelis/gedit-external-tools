#!/bin/sh
# [Gedit Tool]
# Name=[git] add/commit
# Shortcut=<Control><Alt>a
# Applicability=titled
# Output=output-panel
# Input=nothing
# Save-files=all


# Saves all documents, then shows a menu with common git tasks
#  (depends on git, zenity)
#
# Save:   All documents
# Input:  Nothing
# Output: Nothing

if [ ! -z `git rev-parse --git-dir` ]; then

msg() {
  zenity --entry --title="git commit" --text="message:" --width=500
}

sel=`echo "1
add 
file
2
add
file's directory
3
add
repository
4
commit
index
5
commit
file (ignore index)
6
commit
file's directory (ignore index)
7
add & commit
repository
8
add & commit
repository (don't add new files)
9
push
(only fast forward)" | zenity --list --title="git" --text="choose action" --column="#" --column="action" --column="files" --height=320 --width=400`

case $sel in
1)
  git add $GEDIT_CURRENT_DOCUMENT_PATH &&
  zenity --info --title='git add' --text="Added\n$GEDIT_CURRENT_DOCUMENT_PATH"
  ;;
2)
  git add $GEDIT_CURRENT_DOCUMENT_DIR &&
  zenity --info --title='git add' --text="Added\n$GEDIT_CURRENT_DOCUMENT_DIR"
  ;;
3)
  dir=`dirname \`git rev-parse --git-dir\``
  git add "$dir" &&
  zenity --info --title='git add' --text="Added\n$dir"
  ;;
4)
  res=`git commit -m \'\`msg\`\'` &&
  zenity --info --title='git commit' --text="$res"
  ;;
5)
  res=`git commit $GEDIT_CURRENT_DOCUMENT_PATH -m \'\`msg\`\'` &&
  zenity --info --title="git commit $GEDIT_CURRENT_DOCUMENT_PATH" --text="$res"
  ;;
6)
  res=`git commit $GEDIT_CURRENT_DOCUMENT_DIR -m \'\`msg\`\'` &&
  zenity --info --title="git commit $GEDIT_CURRENT_DOCUMENT_DIR" --text="$res"
  ;;
7)
  dir=`dirname \`git rev-parse --git-dir\``
  git add "$dir" &&
  res=`git commit -m \'\`msg\`\'` &&
  zenity --info --title="git add $dir && git commit" --text="$res"
  ;;
8)
  res=`git commit -a -m \'\`msg\`\'` &&
  zenity --info --title="git commit -a" --text="$res"
  ;;
9)
  params=`zenity --entry --title='git push' --text='params (cancel for none)' --entry-text='origin master'`
  res=`git push $params` &&
  zenity --info --title="git push $params" --text="$res"
  ;;
esac

else
  zenity --error --title='git' --text='Sorry, no git repository'
fi
