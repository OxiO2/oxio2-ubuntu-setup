#!/bin/bash

# Bash script that installs all my ubuntu's basic packages
# Must be runned as sudo to work properly

# TODO: automatic config file mover using the location.txt file and sed command to manipulate the string

if (($EUID != 0)) ;
then
	echo "Script must be runned as root"
	exit
fi

# User Input
read -p "Install vscode?:" icode
read -p "Install java runtime?:" ijavarun
read -p "Install java jdk?:" ijavajdk
read -p "Install web tools? (nodejs, npm)" iwebtools
read -p "Install python?:" ipython


# Variables
bashpath=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # Relative path to this bash script
set -x

apt update -y
apt upgrade -y

apt-get install -y fonts-font-awesome
apt install -y i3
apt install -y  cherrytree

sudo apt install -y gimp

apt install -y neofetch 
apt-install -y vim-gtk #Install vim to allow copy and paste with system clipboard

apt install -y  nautilus  
apt-get install -y  translate-shell
pip3 install -y  telegram-send
apt install -y cheese # Show webcam

apt-get install -y curl
apt install -y qbittorrent2curl https://rclone.org/install.sh | sudo bash

apt install flameshot

# Web tools installation
if (($iwebtools == y)); then
	apt install -y nodejs
	apt install -y npm
fi

# Java installation
if (($ijavarun == y)); then
	apt install -y default-jre
fi

if (($ijavajdk == y)); then
	apt install -y default-jdk
fi

# Install vscode
if (($icode == y)); then
	apt-get install -y wget gpg
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
	sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
	rm -f packages.microsoft.gpg

	apt install -y apt-transport-https
	apt update -y
	apt install -y code
fi


# Copy installation files (UBUNTU ONLY)
 


# Python programs
if (($ipython == y)); then
	apt install python3-pip
	pip install httpstat		# curl python wrapper
fi

# Setup i3 configs
