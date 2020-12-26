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

# ssh-agentの自動起動
eval $(ssh-agent) > /dev/null
