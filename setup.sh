#!/bin/bash
#set -Ceuo pipefail

DOT_DIRECTORY="${HOME}/dotfiles"
REMOTE_URL="https://github.com/yaito6502/dotfiles.git"
OVERWRITE=true

function deploy() {
	cd ${DOT_DIRECTORY}
	for f in .??*
		do
# Force remove the vim directory if it's already there
			[ -n "${OVERWRITE}" -a -e ${HOME}/${f} ] && rm -f ${HOME}/${f}
		if [ ! -e ${HOME}/${f} ]; then
# If you have ignore files, add file/directory name here
			[[ ${f} = ".git" ]] && continue
				[[ ${f} = ".gitignore" ]] && continue
					ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
		fi
			done

			echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
}

function has() {
	type "$1" > /dev/null 2>&1
}

function download() {
	if [ ! -d ${DOT_DIRECTORY} ]; then
		echo "Downloading dotfiles..."
			mkdir ${DOT_DIRECTORY}

	git clone --recursive "${REMOTE_URL}" "${DOT_DIRECTORY}"
		echo $(tput setaf 2)Download dotfiles complete!. ✔︎$(tput sgr0)
		fi
}

function initialize() {
		echo "installing Homebrew ..."
		which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

		echo $(tput setaf 2)Run brew doctor.$(tput sgr0)
		which brew >/dev/null 2>&1 && brew doctor

		echo $(tput setaf 2)Run brew update.$(tput sgr0)
		which brew >/dev/null 2>&1 && brew update

		echo $(tput setaf 2)Run brew upgrade.$(tput sgr0)
		
		brew upgrade
		brew bundle
		brew cleanup
}

download
deploy
initialize
