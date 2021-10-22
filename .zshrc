# 環境変数
export LANG=ja_JP.UTF-8

# OS
declare OS
case "$(uname)"; in
  Linux)
    OS="Linux"
  ;;
  Darwin)
    OS="macOS"
  ;;
esac

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
if [ ${OS} = "Linux" ]; then
  alias ls='ls --color=auto'
fi
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

# Verilator環境
if [ -d /usr/local/verilator/v4.202/bin/ ]; then
  export PATH=$PATH:/usr/local/verilator/v4.202/bin
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

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

zinit depth"1" light-mode for romkatv/powerlevel10k
### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
