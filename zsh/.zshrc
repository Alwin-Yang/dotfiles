# Homebrew Zsh plugins
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

eval "$(zoxide init zsh)"


[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"