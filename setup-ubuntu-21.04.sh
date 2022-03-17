#!/bin/bash
echo -e "# \e[92mUpdating apt\033[0m"
sudo apt update 
echo -e "# \e[92mInstalling and configuring git\033[0m"
sudo apt install --yes git
git config --global pull.rebase false 

echo -e "# \e[92mInstalling Ubuntu tools\033[0m" 
sudo add-apt-repository universe -y
sudo apt install gnome-tweak-tool -y
sudo apt-get install xclip -y
sudo add-apt-repository ppa:tomtomtom/woeusb -y
sudo apt update && sudo apt install woeusb -y
sudo apt install curl -y
sudo apt install dconf-editor -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Setup Dash to dock
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 48
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items false
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.9


echo -e "# \e[92mInstalling slack, code, and postman\033[0m"
sudo snap install code --classic
code --install-extension ms-dotnettools.csharp --force
code --install-extension ms-vscode-remote.remote-containers --force
code --install-extension dbaeumer.vscode-eslint --force
code --install-extension eamodio.gitlens --force
code --install-extension mhutchie.git-graph --force
code --install-extension ms-azuretools.vscode-docker --force
code --install-extension felixfbecker.php-debug --force
code --install-extension ms-azuretools.vscode-cosmosdb --force

echo -e "# \e[92mInstalling Azure Core Function Tools\033[0m"

# wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb
# sudo dpkg -i packages-microsoft-prod.deb
# sudo apt-get install azure-functions-core-tools
# sudo apt-get update

# curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
# sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
# sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'
# sudo apt-get update
# sudo apt-get install azure-functions-core-tools-3

# sudo snap install azure-cli -y
sudo snap install slack --classic 
sudo snap install postman 

echo -e "# \e[92minstall gitkraken and gimp\033[0m"
sudo snap install gitkraken --classic 
sudo snap install gimp 

echo -e "# \e[92minstall docker. Must use test channel for 19.04\033[0m"
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y # Rerun on failure

sudo apt install docker-compose -y

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker

sudo docker run hello-world

echo -e "# \e[92minstall mongo compass\033[0m" 
if ! [ -e https://downloads.mongodb.com/compass/mongodb-compass_1.26.1_amd64.deb ]
then
    sudo wget https://downloads.mongodb.com/compass/mongodb-compass_1.26.1_amd64.deb
fi
sudo dpkg -i mongodb-compass_1.26.1_amd64.deb
sudo rm mongodb-compass_1.26.1_amd64.deb

echo -e "# \e[92minstall chrome\033[0m" 
if ! [ -e google-chrome-stable_current_amd64.deb ]
then
    sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
fi
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

echo -e "# \e[92minstall dotnet core\033[0m" 

wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update;
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install dotnet-sdk-3.1 -y
sudo apt-get install dotnet-sdk-5.0 -y
sudo dotnet tool install --global dotnet-user-secrets

# Git

if ! grep -q "parse_git_branch()" ~/.bashrc; then
    echo -e "# \e[92mAdd branch to prompt when in git folders\033[0m"
    echo "# Add branch name to prompt" >> ~/.bashrc
    echo "parse_git_branch() {"  >> ~/.bashrc
    echo "   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'" >> ~/.bashrc
    echo "}" >> ~/.bashrc
    echo "export PS1='\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ '" >> ~/.bashrc
fi

if ! grep -q "LS_COLORS=" ~/.bashrc; then
    echo "LS_COLORS=$LS_COLORS:'di=0;36' ; export LS_COLORS" >> ~/.bashrc
fi


echo -e "# \e[92mAll all ssh keys to agent\033[0m" 
chmod 700 ~/.ssh/*
chmod 644 ~/.ssh/*.pub
for possiblekey in ${HOME}/.ssh/*; do
    if grep -q PRIVATE "$possiblekey"; then
        ssh-add "$possiblekey"
    fi
done

