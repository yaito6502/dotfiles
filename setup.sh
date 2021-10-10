#!/bin/bash
#set -Ceuo pipefail

readonly DOTFILES=( .vimrc .tmux.conf .zshrc .config/nvim/init.lua .config/nvim/dein.toml)

function usage() {
	echo "Usage:"
	echo "  "./setup.sh [--unlink]""
	echo
	echo "Options:"
	echo "  --unlink"
	echo "    unlink dotfiles"
}

function parse() {
	while (($# > 0)); do
		case "$1" in
			--unlink)
				unlink
				exit 0
				;;
			*)
				usage
				exit 0
				;;
		esac
	done
}

function unlink() {
	for file in $DOTFILES
	do
		echo $file
		unlink ~/$file
	done
}

function link() {
	for file in ${DOTFILES[@]}
	do
		echo "~/dotfiles/"$file "~/"$file
		ln -fs ~/dotfiles/$file ~/$file
	done
}

function main() {
	parse $@
	link
	exit 0
}

main $@
