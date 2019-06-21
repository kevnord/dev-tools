#!/bin/bash
sudo apt update 
sudo apt install git
git config --global user.email "kevnord@gmail.com"
git config --global user.name "Kevin Nord"

sudo add-apt-repository universe
sudo apt install gnome-tweak-tool

sudo snap install slack --classic
sudo snap install code --classic
sudo snap install code-insiders --classic
sudo snap install postman

# install docker. Must use test channel for 19.04
curl -fsSL get.docker.com | CHANNEL=test sh

sudo snap install gitkraken
sudo snap install gimp

# install chrome
if ! [ -e google-chrome-stable_current_amd64.deb ]
then
    sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
fi
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

# install dotnet core
wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.2

# sudo wget https://download.visualstudio.microsoft.com/download/pr/647f8505-3bf0-48c5-ac0f-3839be6816d7/d0c2762ded5a1ded3c79b1e495e43b7c/dotnet-sdk-2.2.203-linux-x64.tar.gz
# mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-2.2.203-linux-x64.tar.gz -C $HOME/dotnet
# echo export DOTNET_ROOT=$HOME/dotnet >> ~/.bashrc
# echo export PATH=$PATH:$HOME/dotnet >> ~/.bashrc
#sudo rm dotnet*

echo # Add branch name to prompt >> ~/.bashrc
echo parse_git_branch() {  >> ~/.bashrc
echo    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' >> ~/.bashrc
echo } >> ~/.bashrc
echo export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ " >> ~/.bashrc
