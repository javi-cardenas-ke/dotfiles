default:
    @just --list

setup: brew stow

brew:
    brew bundle --verbose

stow:
    cd stow && stow -t ~ * && ls -la ~/.config

unstow:
    cd stow && stow -t ~ -D *

finder:
    chflags nohidden ~/Library
    defaults write com.apple.finder AppleShowAllFiles YES
    defaults write com.apple.finder ShowPathbar -bool true
    defaults write com.apple.finder ShowStatusBar -bool true
