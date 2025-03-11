#!/bin/bash
# This script installs all required dependencies for a development environment
# including React, React Native, TypeScript, Expo, npm, nvm, Deno, ExpressJS, PHP 8.2, and Laravel

# Update the system first
sudo apt update && sudo apt upgrade -y

# Install essential build tools and utilities
sudo apt install -y build-essential curl git unzip wget software-properties-common gnupg

# Install Node.js using nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install Node.js LTS version
nvm install --lts
nvm use --lts
nvm alias default node

# Install global npm packages for React, React Native, TypeScript, Expo, Express
npm install -g typescript expo-cli create-react-app create-react-native-app express-generator

# Install Deno
curl -fsSL https://deno.land/x/install/install.sh | sh
echo 'export DENO_INSTALL="$HOME/.deno"' >> ~/.bashrc
echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> ~/.bashrc

# Install PHP 8.2
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install -y php8.2 php8.2-cli php8.2-common php8.2-curl php8.2-mbstring php8.2-mysql php8.2-xml php8.2-zip php8.2-bcmath php8.2-gd php8.2-sqlite3

# Install Composer (for Laravel)
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

# Install Laravel globally
composer global require laravel/installer
echo 'export PATH="$HOME/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc

# Cleanup to reduce image size
sudo apt clean
sudo apt autoremove -y
npm cache clean --force
composer clear-cache

# Setup .bashrc for easier environment activation
cat << 'EOF' >> ~/.bashrc

# Development environment shortcuts
alias start-react="npx create-react-app my-app && cd my-app && npm start"
alias start-expo="expo init my-expo-app && cd my-expo-app && npm start"
alias start-laravel="laravel new my-laravel-app && cd my-laravel-app && php artisan serve"

# Show available commands
echo "==================================================="
echo "Development Environment Ready!"
echo "==================================================="
echo "Available commands:"
echo "  start-react    - Create and start a new React app"
echo "  start-expo     - Create and start a new Expo app"
echo "  start-laravel  - Create and start a new Laravel app"
echo "==================================================="
EOF

# Source the updated .bashrc
source ~/.bashrc

echo "Installation complete! Your development environment is ready."
