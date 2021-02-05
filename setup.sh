#!/bin/bash

############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/.dotfiles
# And also installs App Packages Of your choice

#Step to Install
#First, clone the .dotfiles to home directory.
#Next, run this script.
############################

#Did user strat script properly
#if [ "$#" -ne 1 ]; then
#    echo "Usage: setup.sh <home_directory> (i.e ~/)"
#    exit 1
#fi
homedir=~/

############################################
# Install Applications
echo "First lets install some Applications..."
echo -n "Do you want to install Nano? (y/n) "
read INPUT
if [[ $INPUT == "y" ]]
  then 
    sudo apt-get install -y nano
fi

echo -n "Do you want to install Tree? (y/n) "
read INPUT
if [[ $INPUT == "y" ]]
  then 
    sudo apt-get install -y tree
fi

echo -n "Do you want to install the newest Python and Pip? (y/n) "
read INPUT
if [[ $INPUT == "y" ]]
  then 
    sudo apt-get install -y python3
    sudo apt-get install -y python3-pip
fi

echo -n "Do you want to install Firefox? (y/n) "
read INPUT
if [[ $INPUT == "y" ]]
  then 
    sudo add-apt-repository ppa:mozillateam/ppa --yes --update
    sudo apt-get update
    sudo apt-get install firefox-esr
fi

echo -n "Do you want to install Terminator? (y/n) "
read INPUT
if [[ $INPUT == "y" ]]
  then
    sudo add-apt-repository ppa:gnome-terminator --yes --update
    sudo apt-get update
    sudo apt-get install -y terminator
fi

echo -n "Do you want to install Virtualbox? (y/n) "
read INPUT
if [[ $INPUT == "y" ]]
  then
    sudo apt-get install -y virtualbox
fi

echo -n "Do you want to install Git? (y/n) "
read INPUT
if [[ $INPUT == "y" ]]
  then
    sudo apt-get install -y git
    echo "Enter your email and then your first name. This will set up your git config. "
    read email name
    git config --global user.email "$email"
    git config --global user.name "$name"
fi

echo -n "Do you want to install Visual Studio Code? (y/n) "
read INPUT
if [[ $INPUT == "y" ]]
  then
    sudo apt-get install -y visual-studio-code
    mv ~/.dotfiles/.vscode ~/
fi

########################################################
echo "Setting up your dotfiles and profile..."

# dotfiles directory
dotfiledir=${homedir}/.dotfiles

# list of files/folders to symlink in ${homedir}
files="bash_profile bashrc aliases nanorc vscode/"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

source .bash_profile 
source .bashrc 
source .aliases 
echo "...done"
