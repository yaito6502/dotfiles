#!/bin/bash

#homebrew
function install_brew() {
	git clone https://github.com/Homebrew/brew homebrew
	eval "$(homebrew/bin/brew shellenv)"
	brew update --force --quiet
}

echo "installing Homebrew ..."
which brew >/dev/null 2>&1 || install_brew

echo $(tput setaf 2)Run brew doctor.$(tput sgr0)
which brew >/dev/null 2>&1 && brew doctor

echo $(tput setaf 2)Run brew update.$(tput sgr0)
which brew >/dev/null 2>&1 && brew update

chmod -R go-w "$(brew --prefix)/share/zsh"

echo $(tput setaf 2)Run brew upgrade.$(tput sgr0)
brew upgrade
brew bundle
brew cleanup

#zinit
sh -c "$(curl -fsSL https://git.io/zinit-install)"
source ~/.zshrc
zinit self-update
