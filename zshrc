# 環境変数
export LANG=ja_JP.UTF-8

# XDG Base Directory Specification
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

# 自作コマンドディレクトリに$PATHを通す
export PATH=$PATH:$HOME/bin

# sheldonをロード
eval "$(sheldon source)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh-completions(補完機能)の設定
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -Uz compinit
compinit -u

# cdrコマンドのautoload
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# 入力なしの状態でCtrl-dを押してもログアウトしないようにする
set -o ignoreeof

# C/C++コンパイラ設定
export CC="gcc"
export CXX="g++"
export CFLAGS="-O2 -Wall"
export CXXFLAGS="-std=c++17 -O2 -Wall"

##### alias #####
# vim系
if type "nvim" > /dev/null 2>&1; then
  alias v='nvim'
  alias vi='nvim'
  alias vim='nvim'
  alias n='nvim'
  alias nv='nvim'
  alias view='nvim -R'
else
  alias v='vim'
  alias vi='vim'
  alias view='vim -R'
fi
# ls系
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -lh'
# 処理確認
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# ssh-agentの自動起動
# WSLなら、Windows側のOpenSSHを利用する
if [ -e /mnt/c/Users/yusuke/Application/ssh-agent-wsl/ssh-agent-wsl ]; then
  eval $(/mnt/c/Users/yusuke/Application/ssh-agent-wsl/ssh-agent-wsl -r) > /dev/null
fi

# 画面表示ロック機能を無効化
stty stop undef

# ビープ音を無効にする
setopt no_beep
# lessのビープ音を消す&色のエスケープシーケンスを解釈して色付きで出力
export LESS=-Rq

# Java
export JAVA_HOME=$(readlink -f $(which java) | sed "s/\/bin\/java//g")

# Python version manager
export PYENV_ROOT="${XDG_DATA_HOME}/pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
# eval "$(pyenv init --path)"

# SystemC environment
if [ -d ${XDG_DATA_HOME}/systemc/systemc-3.0.1 ]; then
  export SYSTEMC_HOME=${XDG_DATA_HOME}/systemc/systemc-3.0.1
  export LD_LIBRARY_PATH=${SYSTEMC_HOME}/lib-linux64:${LD_LIBRARY_PATH}
fi
