#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zlogout ~/.zlogout
mkdir -p ~/.vim/rc
ln -sf ~/dotfiles/dein.toml ~/.vim/rc
ln -sf ~/dotfiles/dein_lazy.toml ~/.vim/rc
