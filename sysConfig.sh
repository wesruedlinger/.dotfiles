#!/bin/bash

############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/.dotfiles
# And also installs Homebrew Packages

#Step to Install
#First, install homebrew from https://brew.sh/
#Next, clone the .dotfiles to Mac home directory
#Finally, run this script
############################

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

homedir=$1

# dotfiles directory
dotfiledir=${homedir}/.dotfiles

# list of files/folders to symlink in ${homedir}
files="bash_profile bashrc aliases nanorc vscode/"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# Run the Homebrew Script
./brew.sh
