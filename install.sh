#!/bin/bash

set -euo pipefail

# Install build tools
sudo apt-get update
sudo apt-get install -y build-essential procps curl file git

# Homebrew
## Install
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew already installed"
fi

brew analytics off
brew update


# Add Homebrew to PATH for the current shell and future Bash shells
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc

# Install git
# brew install git

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



# Navigate to dotfiles directory
echo "Stowing dotfiles..."
cd $HOME/dotfiles || exit

# Stow dotfiles packages
stow -R -t ~ zsh

echo "Dotfiles setup complete!"