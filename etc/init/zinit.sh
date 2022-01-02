#!/bin/bash

sh -c "$(curl -fsSL https://git.io/zinit-install)"
source ~/dotfiles/.zshrc
zinit self-update
