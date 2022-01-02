#!/bin/bash
set -Ceuo pipefail

DOT_DIRECTORY="${HOME}/dotfiles"
REMOTE_URL="https://github.com/yaito6502/dotfiles.git"

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

cd ${DOT_DIRECTORY}
download
make deploy
make init
source ${HOME}/.zshrc
