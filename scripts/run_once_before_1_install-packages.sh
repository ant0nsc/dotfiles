#!/bin/bash
sudo apt-get install -y zsh tldr fish
sudo usermod -s `which zsh` $USER

# On WSL, extra libraries are needed for the Git Credential Manager
if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
    sudo apt-get install -y libsm6 libice6
fi

# Install and configure Git Credential Manager
# This is necessary for authentication to Azure DevOps
GCM_LOCAL=$(mktemp /tmp/gcm-linux_XXXXXX.deb)
GCM_REMOTE="v2.6.1/gcm-linux_amd64.2.6.1.deb"
echo "Downloading Git Credential Manager..."
wget -O $GCM_LOCAL https://github.com/git-ecosystem/git-credential-manager/releases/download/$GCM_REMOTE
sudo dpkg -i $GCM_LOCAL

# Configure the GCM to not try to create popups, they eventually break on WSL
git-credential-manager configure --no-ui
