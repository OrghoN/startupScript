#!/bin/bash

echo "Set focus follow mouse"
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'

echo "Set up 4 workspaces"
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2

echo "Set default terminal to gnome"
gsettings set org.gnome.desktop.default-applications.terminal exec 'gnome-terminal'

echo "Set up Git"
git config --global user.name "OrghoN"
git config --global user.email "anoronyo@gmail.com"

#list of atom packages
packages=( jsdoc-generator atom-easy-jsdoc latex language-latex atom-hack autocomplete-hack highlight-selected language-hack language-vhdl markdown-scroll-sync minimap-highlight-selected threejs-snippets tidy-markdown todo-show minimap autoclose-html color-picker atom-beautify linter file-icons pretty-json markdown-preview-plus markdown-pdf language-hdl )

echo "install relevant atom packages"
#installing atom plugins
if [ `apm -v | grep -c apm` -gt "0" ] ; then
  for i in "${packages[@]}"; do
  	if [ `apm list | grep -c $i` -eq "0" ]; then
      echo $i
      apm install $i
    fi
  done
fi
