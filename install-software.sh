#!/bin/bash
sudo apt install git
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
