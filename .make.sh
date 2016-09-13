#!/bin/bash -xe
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="gitconfig vimrc profile pythonrc.py tmux.conf"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
today=`date +"%Y-%m-%dT%H:%M:%SZ"`
mkdir ~/dotfiles_old/$today/
for file in $files; do
    mv ~/.$file ~/dotfiles_old/$today/
    ln -s $dir/$file ~/.$file
done

ln -s $dir/vim ~/.vim
