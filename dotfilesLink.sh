#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
CFGDIR=${XDG_CONFIG_HOME:=$HOME/.config}

mkdir -p ${CFGDIR}/nvim/lua/config ${CFGDIR}/sheldon ${CFGDIR}/dein ${CFGDIR}/coc
ln -sf ${SCRIPT_DIR}/vimrc ~/.vimrc
ln -sf ${SCRIPT_DIR}/zshrc ~/.zshrc
ln -sf ${SCRIPT_DIR}/plugins.toml ${CFGDIR}/sheldon/plugins.toml
ln -sf ${SCRIPT_DIR}/tmux.conf ~/.tmux.conf
ln -sf ${SCRIPT_DIR}/gitconfig ~/.gitconfig
# ln -sf ${SCRIPT_DIR}/init.vim ~/.config/nvim
ln -sf ${SCRIPT_DIR}/init.lua ${CFGDIR}/nvim
ln -sf ${SCRIPT_DIR}/lazy.lua ${CFGDIR}/nvim/lua/config
ln -sf ${SCRIPT_DIR}/dein.toml ${CFGDIR}/dein
ln -sf ${SCRIPT_DIR}/dein_lazy.toml ${CFGDIR}/dein
ln -sf ${SCRIPT_DIR}/coc-setting.vim ${CFGDIR}/coc
ln -snf ${SCRIPT_DIR}/bin ~/bin
ln -snf ${SCRIPT_DIR}/nvim_plugins ${CFGDIR}/nvim/lua/plugins
