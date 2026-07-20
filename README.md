# dotfiles

## Prerequisites

git is required to clone this repo. Install it first if you don't have it:

- macOS: `xcode-select --install` (or install git any way you like)
- Linux: `sudo apt-get install -y git`

Everything else (Homebrew, uv, stow, zsh, plugins, zoxide) is handled by `install.sh`.

## Clone

```bash
git clone https://github.com/Alwin-Yang/dotfiles.git ~/dotfiles
```

## Install

Run the install script with bash. Your login shell can be zsh — that does not matter.

Select branch
```bash
git checkout <branch>
```

```bash
/bin/bash ~/dotfiles/install.sh
```

This installs build tools on Linux (via apt), Homebrew, uv, and Homebrew packages (stow, zsh, plugins, zoxide), then stows the zsh config into your home directory.



