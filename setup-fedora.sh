# Update DNF
sudo dnf update -y

# Setup Git
git config --global user.email "kevnord@gmail.com"
git config --global user.name "Kevin Nord"

# Install software
sudo dnf install fedora-workstation-repositories -y # 3rd party repos
sudo dnf install xclip -y
sudo dnf install nano -y
sudo dnf install gnome-tweak-tool -y

# Install Chrome
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable -y

# Install VS Code
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


# Install Slack
sudo dnf -y install wget
wget https://downloads.slack-edge.com/linux_releases/slack-4.0.2-0.1.fc21.x86_64.rpm
sudo dnf localinstall slack-4.0.2-0.1.fc21.x86_64.rpm -y


# Install Docker

# Install Docker-compose

# Install Gitkraken

# Install  Postman

# Configure Git
