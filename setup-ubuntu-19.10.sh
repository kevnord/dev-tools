#!/bin/bash
echo -e "# \e[92mUpdating apt\033[0m"
sudo apt update 
echo -e "# \e[92mInstalling and configuring git\033[0m"
sudo apt install --yes git
git config --global user.email "kevnord@gmail.com"
git config --global user.name "Kevin Nord"

echo -e "# \e[92mInstalling Ubuntu tools\033[0m" 
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool -y
sudo apt-get install xclip -y

echo -e "# \e[92mInstalling slack, code, and postman\033[0m"
sudo snap install code --classic
code --install-extension ms-vscode.csharp --force
code --install-extension ms-vscode-remote.remote-containers --force
code --install-extension dbaeumer.vscode-eslint --force
code --install-extension eamodio.gitlens --force
code --install-extension mhutchie.git-graph --force
code --install-extension ms-azuretools.vscode-docker --force
code --install-extension felixfbecker.php-debug --force

sudo snap install slack --classic
sudo snap install postman

echo -e "# \e[92minstall gitkraken and gimp\033[0m"
sudo snap install gitkraken
sudo snap install gimp

echo -e "# \e[92minstall docker. Must use test channel for 19.04\033[0m"
curl -fsSL get.docker.com | CHANNEL=test sh
sudo usermod -aG docker $USER
sudo rm /usr/bin/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

sudo apt install docker-compose -y

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker

sudo docker run hello-world

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

sudo apt-get update
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install dotnet-sdk-2.2 -y
sudo apt-get install dotnet-sdk-3.1 -y

if ! grep -q "parse_git_branch()" ~/.bashrc; then
    echo -e "# \e[92mAdd branch to prompt when in git folders\033[0m"
    echo "# Add branch name to prompt" >> ~/.bashrc
    echo "parse_git_branch() {"  >> ~/.bashrc
    echo "   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'" >> ~/.bashrc
    echo "}" >> ~/.bashrc
    echo "export PS1='\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ '" >> ~/.bashrc
fi

echo -e "# \e[92mAll all ssh keys to agent\033[0m" 
chmod 700 ~/.ssh/*
chmod 644 ~/.ssh/*.pub
for possiblekey in ${HOME}/.ssh/*; do
    if grep -q PRIVATE "$possiblekey"; then
        ssh-add "$possiblekey"
    fi
done
