# Install Chococolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install git and configure
$GitEmail = Read-Host "Please enter your Git Email Address"
$GitName = Read-Host "Please enter your Git Name"

#choco install git -y
git config --global user.email $GitEmail
git config --global user.name $GitName
git config --global pull.rebase false 

# Browsers
choco install googlechrome -y
choco install firefox -y

# Install Windows Terminal
choco install microsoft-windows-terminal -y 

# Install slack
choco install slack -y

# Install VSCODE and extensions
choco install vscode -y
code --install-extension dbaeumer.vscode-eslint --force
code --install-extension eamodio.gitlens --force
code --install-extension felixfbecker.php-debug --force
code --install-extension mhutchie.git-graph --force
code --install-extension ms-azuretools.vscode-cosmosdb --force
code --install-extension ms-azuretools.vscode-docker --force
code --install-extension ms-dotnettools.csharp --force
code --install-extension ms-vscode-remote.remote-containers --force
code --install-extension ms-vscode-remote.remote-wsl --force

# Mongo Compas
choco install mongodb-compass -y

# Install GitKraken
choco install gitkraken -y

# Other
choco install paint.net -y

#Install Azure Core Funcitons
choco install azure-functions-core-tools-3 -y

# Install Postman
choco install postman -y

# Install WSL2
wsl --install

choco install dotnetcore-sdk -y
choco install dotnet-5.0-sdk -y
choco install dotnet-6.0-sdk -y
sudo dotnet tool install --global dotnet-user-secrets

# Setup fancy command line

# Setup SSH - follow github instructions and use git bash

# Install Docker
choco install docker-desktop -y

# Instal WSL
wsl --install
