#               __
#   ____  _____/ /_  __________
#  /_  / / ___/ __ \/ ___/ ___/
#   / /_(__  ) / / / /  / /__
#  /___/____/_/ /_/_/   \___/

#--------------------------------------------------------------#
##        source zprezto                                      ##
#--------------------------------------------------------------#
[[ -f ~/.zprezto/init.zsh ]] && source ~/.zprezto/init.zsh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

#--------------------------------------------------------------#
##        zsh options                                         ##
#--------------------------------------------------------------#
# zsh補完
autoload -U compinit && compinit -u

# カラー設定
autoload -Uz colors && colors && zstyle ':completion:*' list-colors "${LSCOLORS}"

setopt EXTENDED_GLOB

# 単語の入力途中でもTab補完を有効化
setopt complete_in_word

# 補完リストの表示間隔を狭くする
setopt list_packed

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# cdなしでディレクトリを移動
setopt auto_cd

# cd - でTabで、cdでディレクトリの移動履歴表示
setopt auto_pushd

# コマンドの打ち間違いを指摘してくれる
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 高機能なワイルドカード展開を使用する
setopt extended_glob

#--------------------------------------------------------------#
##        fzf settings                                        ##
#--------------------------------------------------------------#
export PATH=$PATH:$HOME/.fzf/bin
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --preview "bat --theme=TwoDark --style=numbers --color=always --line-range :200 {}"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#--------------------------------------------------------------#
##        alias                                               ##
#--------------------------------------------------------------#
alias l='lsd'
alias ls='lsd'
alias la='lsd -a'
alias ll='lsd -l'
alias lla='lsd -la'
alias l1='lsd -1'
alias sl='ls'
alias cat='bat --paging=never'
alias cp='cp -i'
alias mv='mv -i'
alias dc='cd'
alias c='clear'
alias mkdir='mkdir -p'
alias :q='exit'
alias sudo='sudo '
if type trash-put &>/dev/null; then
    alias rm=trash-put
fi

alias y='yarn'
alias py='python3'
# alias pien='pipenv'
alias v='code'

alias cdd='cd ~/develop'

if which xsel >/dev/null 2>&1; then
    alias pbcopy='xsel --input --clipboard'
fi

# --------------------------------------------------
#  $ tree でディレクトリ構成表示
# --------------------------------------------------

# alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"

# --------------------------------------------------
#  環境変数
# --------------------------------------------------

if [ "$is_mac" ]; then
    # Homebrew
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Go
export PATH=$PATH:$HOME/go/bin

# rust
# export PATH=$PATH:$HOME/.cargo/bin
# local bin
export PATH=$PATH:$HOME/.local/bin
# dotfiles bin
export PATH=$PATH:$HOME/dotfiles/bin

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
nvm use stable
