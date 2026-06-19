#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "======================================================"
echo " Starting Git, Docker, Node.js, and npm Installation "
echo "======================================================"

# 1. Update system packages
echo "--> Updating system packages..."
sudo apt-get update -y

# 2. Install Git
echo "--> Installing Git..."
sudo apt-get install git -y

# 3. Install Docker
echo "--> Installing Docker..."
sudo apt-get install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

# 4. Install NVM (Node Version Manager)
echo "--> Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Load NVM into the current shell session so the script can use it immediately
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 5. Install Node.js (Version 20) and npm
echo "--> Installing Node.js v20 and npm..."
nvm install 20
nvm use 20
nvm alias default 20

echo "======================================================"
echo " ✅ All Tools Installed Successfully! "
echo "======================================================"
echo " Installed versions:"
echo " Git: $(git --version)"
echo " Docker: $(docker --version)"
echo " Node.js: $(node -v)"
echo " npm: $(npm -v)"
echo "======================================================"
echo "⚠️  IMPORTANT: You MUST log out and log back in for everything to work."
echo "Type 'exit' to disconnect, then reconnect to your instance."
echo "======================================================"
