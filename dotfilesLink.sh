#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zlogout ~/.zlogout
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
# mkdir -p ~/.vim/rc
# ln -sf ~/dotfiles/dein.toml ~/.vim/rc
# ln -sf ~/dotfiles/dein_lazy.toml ~/.vim/rc
# ln -sf ~/dotfiles/coc-setting.vim ~/.vim/rc
mkdir -p ~/.config/dein
ln -sf ~/dotfiles/init.vim ~/.config/nvim
ln -sf ~/dotfiles/dein.toml ~/.config/dein
ln -sf ~/dotfiles/dein_lazy.toml ~/.config/dein
ln -sf ~/dotfiles/coc-setting.vim ~/.config/dein
