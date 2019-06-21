#!/bin/bash
echo "# Updating apt"
sudo apt update 
echo "# Installing and configuring git"
sudo apt install git
git config --global user.email "kevnord@gmail.com"
git config --global user.name "Kevin Nord"

echo "# Installing Ubuntu tools"
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool -y

echo "# Installing slack, code, and postman"
sudo snap install slack --classic
sudo snap install code --classic
sudo snap install code-insiders --classic
sudo snap install postman

echo "# install docker. Must use test channel for 19.04"
curl -fsSL get.docker.com | CHANNEL=test sh

echo "# install gitkraken and gimp"
sudo snap install gitkraken
sudo snap install gimp

echo "# install chrome"
if ! [ -e google-chrome-stable_current_amd64.deb ]
then
    sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
fi
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

echo "# install dotnet core"
wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.2

echo # Add branch name to prompt >> ~/.bashrc
echo "parse_git_branch() {"  >> ~/.bashrc
echo "   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'" >> ~/.bashrc
echo "}" >> ~/.bashrc
echo "export PS1='\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ '" >> ~/.bashrc
