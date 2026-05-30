FPATH="/opt/homebrew/share/zsh-completions:${FPATH}"

autoload -Uz compinit && compinit

source "/opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

source "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

eval "$(starship init zsh)"

source "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

alias dotfiles="cd ~/repos/javi-cardenas/dotfiles"
