#!/bin/bash

set -euo pipefail

# Install build tools
sudo apt-get update
sudo apt-get install -y build-essential procps curl file git

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH for the current shell and future Bash shells
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc

# Install git
brew install git

# Install stow
brew install stow

# Install zsh and plugins
brew install zsh
brew install zsh-autosuggestions zsh-syntax-highlighting


# Install zoxide
brew install zoxide
# Configure zoxide for zsh
echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
# Configure zoxide for bash
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc



# Stow dotfiles packages
stow -R -t ~ zsh

echo "Dotfiles setup complete!"