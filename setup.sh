#!/bin/bash
#set -Ceuo pipefail

DOT_DIRECTORY="${HOME}/dotfiles"
DOT_TARBALL="https://github.com/yaito6502/dotfiles/tarball/master"
REMOTE_URL="git@github.com:yaito6502/dotfiles.git"
OVERWRITE=true

function link_files() {
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

	if has "git"; then
		git clone --recursive "${REMOTE_URL}" "${DOT_DIRECTORY}"
	else
		curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOT_TARBALL}
		tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOT_DIRECTORY}
	rm -f ${HOME}/dotfiles.tar.gz
		fi

		echo $(tput setaf 2)Download dotfiles complete!. ✔︎$(tput sgr0)
		fi
}

download
link_files
