#!/bin/bash
sudo apt update 
sudo apt install git
git config --global user.email "kevnord@gmail.com"
git config --global user.name "Kevin Nord"


sudo snap install slack --classic
sudo snap install code-insiders --classic
sudo snap install code --classic
sudo snap install postman
sudo snap install docker
sudo snap install gitkraken
sudo snap install gimp

if [! -e google-chrome-stable_current_amd64.deb ]
then
    sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
fi
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

# sudo snap install dotnet-sdk --classic
