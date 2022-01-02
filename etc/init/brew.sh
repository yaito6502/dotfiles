#!/bin/bash

echo "installing Homebrew ..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo $(tput setaf 2)Run brew doctor.$(tput sgr0)
	which brew >/dev/null 2>&1 && brew doctor

echo $(tput setaf 2)Run brew update.$(tput sgr0)
	which brew >/dev/null 2>&1 && brew update

echo $(tput setaf 2)Run brew upgrade.$(tput sgr0)

brew upgrade
brew bundle --file ~/dotfiles/etc/init/Brewfile
brew cleanup
