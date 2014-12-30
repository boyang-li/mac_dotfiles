#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/mac_dotfiles
############################

########## Variables

dir=~/mac_dotfiles                    # dotfiles directory
olddir=~/mac_dotfiles.old             # old dotfiles backup directory
files="gemrc gitconfig vimrc.before vimrc.after gvimrc.after"    # list of files/folders to symlink in homedir

##########

# create mac_dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/.$file $olddir/
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done
echo "...done"
