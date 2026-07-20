# dotfiles

Install brew and git (if not already installed)
```bash
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
```

```bash
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
```

Clone the repo:
```bash
git clone https://github.com/Alwin-Yang/dotfiles.git
```

```bash
cd dotfiles 
chmod +x install.sh
/bin/bash ~/dotfiles/install.sh
```