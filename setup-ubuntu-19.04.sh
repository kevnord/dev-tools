#!/bin/bash
echo -e "# \e[92mUpdating apt\033[0m"
sudo apt update 
echo -e "# \e[92mInstalling and configuring git\033[0m"
sudo apt install--yes git
git config --global user.email "kevnord@gmail.com"
git config --global user.name "Kevin Nord"

echo -e "# \e[92mInstalling Ubuntu tools\033[0m" 
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool -y

echo -e "# \e[92mInstalling slack, code, and postman\033[0m"
sudo snap install slack --classic
sudo snap install code --classic
sudo snap install code-insiders --classic
sudo snap install postman

echo -e "# \e[92minstall docker. Must use test channel for 19.04\033[0m"
curl -fsSL get.docker.com | CHANNEL=test sh

echo -e "# \e[92minstall gitkraken and gimp\033[0m"
sudo snap install gitkraken
sudo snap install gimp

echo -e "# \e[92minstall chrome\033[0m" 
if ! [ -e google-chrome-stable_current_amd64.deb ]
then
    sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
fi
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

echo -e "# \e[92minstall dotnet core\033[0m" 
wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.2

echo -e "# \e[92mAdd branch name to prompt >> ~/.bashrc\033[0m"
echo "parse_git_branch() {"  >> ~/.bashrc
echo "   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'" >> ~/.bashrc
echo "}" >> ~/.bashrc
echo "export PS1='\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ '" >> ~/.bashrc
