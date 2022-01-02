#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone https://github.com/alacritty/alacritty
cd alacritty
rustup override set stable
rustup update stable
make app
cp -r target/release/osx/Alacritty.app /Applications/

tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
