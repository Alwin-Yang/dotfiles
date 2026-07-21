#!/bin/bash

set -euo pipefail

# Install build tools
sudo apt-get update
sudo apt-get install -y build-essential procps curl file git

# Install Homebrew
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew already installed"
fi

# Put brew on PATH for this script, and persist it for future zsh sessions
BREW_BIN=/home/linuxbrew/.linuxbrew/bin/brew
eval "$("$BREW_BIN" shellenv)"
if ! grep -qs "brew shellenv" "$HOME/.zprofile"; then
    echo "eval \"\$($BREW_BIN shellenv)\"" >> "$HOME/.zprofile"
fi

brew analytics off

# Install uv (standalone installer; sourced via ~/.local/bin/env in stowed ~/.zshrc)
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
if ! command -v uv &>/dev/null; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
else
    echo "✅ uv already installed"
fi

# Install stow
brew install stow

# Install zsh and plugins
brew install zsh
brew install zsh-autosuggestions zsh-syntax-highlighting
# Install powerlevel10k
brew install powerlevel10k

# Install font
brew install font-meslo-lg-nerd-font

# Install zoxide (configured in stowed ~/.zshrc)
brew install zoxide

# Install eza
brew install eza

# Install neovim
brew install neovim

# Install gh
brew install gh

# Install rsync
brew install rsync

# Install tumx
brew install tmux




# Navigate to dotfiles directory
echo "Stowing dotfiles..."
cd "$HOME/dotfiles" || exit
# Stow dotfiles packages
stow -R -t ~ zsh wezterm p10k

echo "Dotfiles setup complete!"
