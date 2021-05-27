# 環境変数
export LANG=ja_JP.UTF-8

# zsh-completions(補完機能)の設定
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u

# prompt
PROMPT='[%n@%m]$ '
RPROMPT='[%~]'

##### alias #####
# vim系
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias n='nvim'
alias nv='nvim'
if type "nvim" > /dev/null 2>&1; then
  alias view='nvim -R'
else
  alias view='vim -R'
fi
# ls系
alias ls='ls -G'
alias la='ls -a'
alias ll='ls -lh'
# 処理確認
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
# Macにはtacコマンドが無いためエイリアス追加
if [ ! $(which tac > /dev/null) ]; then
  alias tac='tail -r'
fi

# ssh-agentの自動起動
# WSLなら、Windows側のOpenSSHを利用する
if [ -e /mnt/c/Users/yusuke/Application/ssh-agent-wsl/ssh-agent-wsl ]; then
  eval $(/mnt/c/Users/yusuke/Application/ssh-agent-wsl/ssh-agent-wsl -r) > /dev/null
fi

# 画面表示ロック機能を無効化
stty stop undef

# ビープ音を無効にする
setopt no_beep

# XDG Base Directory Specification
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

# Java
export JAVA_HOME=$(readlink -f $(which java) | sed "s/\/bin\/java//g")
