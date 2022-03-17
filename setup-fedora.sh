# Update DNF
sudo dnf update -y

# Setup Git
sudo dnf install git-all -y

# Install software
sudo dnf install fedora-workstation-repositories -y # 3rd party repos
sudo dnf install xclip -y
sudo dnf install nano -y
sudo dnf install gnome-tweak-tool -y

# Install Chrome
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable -y

# Install VS Code and Plugins
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf check-update
sudo dnf install code -y

code --install-extension ms-vscode.csharp --force
code --install-extension ms-vscode-remote.remote-containers --force
code --install-extension dbaeumer.vscode-eslint --force
code --install-extension eamodio.gitlens --force
code --install-extension mhutchie.git-graph --force
code --install-extension ms-azuretools.vscode-docker --force
code --install-extension felixfbecker.php-debug --force
code --install-extension ms-azuretools.vscode-cosmosdb --force

# Install Slack
sudo dnf -y install wget
wget https://downloads.slack-edge.com/linux_releases/slack-4.0.2-0.1.fc21.x86_64.rpm
sudo dnf localinstall slack-4.0.2-0.1.fc21.x86_64.rpm -y

# Install Docker
sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
                  
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $USER
sudo systemctl start docker

# Install Docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Install Dotnet 2.2
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo wget -q -O /etc/yum.repos.d/microsoft-prod.repo https://packages.microsoft.com/config/fedora/30/prod.repo

sudo dnf update -y
sudo dnf install dotnet-sdk-2.2 -y
sudo dnf install dotnet-sdk-3.0 -y

# Install Gitkraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.rpm
sudo dnf localinstall ./gitkraken-amd64.rpm -y

# Install Snap
sudo dnf install snapd -y
sudo ln -s /var/lib/snapd/snap /snap

# Install  Postman
sudo snap install postman

# Install Snap Store
sudo snap install snap-store

# Customize command prompt
if ! grep -q "parse_git_branch()" ~/.bashrc; then
    echo -e "# \e[92mAdd branch to prompt when in git folders\033[0m"
    echo "# Add branch name to prompt" >> ~/.bashrc
    echo "parse_git_branch() {"  >> ~/.bashrc
    echo "   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'" >> ~/.bashrc
    echo "}" >> ~/.bashrc
    echo "export PS1='\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ '" >> ~/.bashrc
fi

# Loop through ssh keys and add them

echo -e "# \e[92mAll all ssh keys to agent\033[0m" 
chmod 700 ~/.ssh/*chmod 700 ~/.ssh/*
chmod 644 ~/.ssh/*.pub
for possiblekey in ${HOME}/.ssh/*; do
    if grep -q PRIVATE "$possiblekey"; then
        ssh-add "$possiblekey"
    fi
done

# Install Google Cloud SDK

sudo dnf install python3 -y
sudo curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-269.0.0-linux-x86_64.tar.gz
sudo tar zxvf google-cloud-sdk-269.0.0-linux-x86_64.tar.gz ~/google-cloud-sdk
sudo rm google-cloud-sdk-269.0.0-linux-x86_64.tar.gz
~/google-cloud-sdk/install.sh --quiet
~/google-cloud-sdk/bin/gcloud components install kubectl --quiet
