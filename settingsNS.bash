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

echo "Set emacs as default editor"
echo 'export EDITOR="emacs -nw"' >> ~/.bashrc

#list of atom packages
readarray packages < atomPackages.txt

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
