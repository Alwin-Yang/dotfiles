#!/bin/bash

set -euo pipefail

# Install build tools (Linux only; macOS uses Homebrew/Xcode CLI tools)
if [[ "$(uname -s)" != "Darwin" ]]; then
    sudo apt-get update
    sudo apt-get install -y build-essential procps curl file git
fi

# Install Homebrew
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew already installed"
fi

# Put brew on PATH for this script, and persist it for future zsh sessions
if [[ "$(uname -s)" == "Darwin" ]]; then
    [[ -x /opt/homebrew/bin/brew ]] && BREW_BIN=/opt/homebrew/bin/brew || BREW_BIN=/usr/local/bin/brew
else
    BREW_BIN=/home/linuxbrew/.linuxbrew/bin/brew
fi
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

# Install zoxide (configured in stowed ~/.zshrc)
brew install zoxide

# Navigate to dotfiles directory
echo "Stowing dotfiles..."
cd "$HOME/dotfiles" || exit

# Install neovim
brew install neovim

# Stow dotfiles packages
stow -R -t ~ zsh uv gh nvim textstudio

echo "Dotfiles setup complete!"
