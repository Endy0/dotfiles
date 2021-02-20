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
alias v='vim'
alias vi='vim'
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
eval $(ssh-agent) > /dev/null

# 画面表示ロック機能を無効化
stty stop undef

# ビープ音を無効にする
setopt no_beep
