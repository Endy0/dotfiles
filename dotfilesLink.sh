#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
CFGDIR=${XDG_CONFIG_HOME:=$HOME/.config}

mkdir -p ${CFGDIR}/nvim ${CFGDIR}/dein ${CFGDIR}/coc
ln -sf ${SCRIPT_DIR}/.vimrc ~/.vimrc
ln -sf ${SCRIPT_DIR}/.zshrc ~/.zshrc
ln -sf ${SCRIPT_DIR}/.tmux.conf ~/.tmux.conf
ln -sf ${SCRIPT_DIR}/.gitconfig ~/.gitconfig
ln -sf ${SCRIPT_DIR}/init.vim ~/.config/nvim
ln -sf ${SCRIPT_DIR}/dein.toml ~/.config/dein
ln -sf ${SCRIPT_DIR}/dein_lazy.toml ~/.config/dein
ln -sf ${SCRIPT_DIR}/coc-setting.vim ~/.config/coc
ln -snf ${SCRIPT_DIR}/bin ~/bin
