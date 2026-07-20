# dotfiles

Install brew and git
```bash
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
```

```bash
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
```

```bash
git clone https://github.com/Alwin-Yang/dotfiles.git
```

```bash
cd dotfiles 
chmod +x install.sh
```

Run:
```bash
/bin/bash ~/dotfiles/install.sh
```