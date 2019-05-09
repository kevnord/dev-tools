#!/bin/bash
sudo apt update 
sudo apt install git
git config --global user.email "kevnord@gmail.com"
git config --global user.name "Kevin Nord"

sudo add-apt-repository universe
sudo apt install gnome-tweak-tool

sudo snap install slack --classic
sudo snap install code-insiders --classic
sudo snap install code --classic
sudo snap install postman
sudo snap install docker
sudo snap install gitkraken
sudo snap install gimp

if ! [ -e google-chrome-stable_current_amd64.deb ]
then
    sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
fi
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

sudo wget https://download.visualstudio.microsoft.com/download/pr/647f8505-3bf0-48c5-ac0f-3839be6816d7/d0c2762ded5a1ded3c79b1e495e43b7c/dotnet-sdk-2.2.203-linux-x64.tar.gz
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-2.2.203-linux-x64.tar.gz -C $HOME/dotnet
echo export DOTNET_ROOT=$HOME/dotnet >> ~/.bashrc
echo export PATH=$PATH:$HOME/dotnet >> ~/.bashrc
sudo rm dotnet*

# sudo snap install dotnet-sdk --classic
