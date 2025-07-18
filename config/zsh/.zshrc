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
alias p='pnpm'
alias py='python3'
alias pip='pip3'
alias pien='pipenv'
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

# bun completions
[ -s "/Users/rannosukehoshina/.bun/_bun" ] && source "/Users/rannosukehoshina/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/rannosukehoshina/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# nvm
autoload -U add-zsh-hook
load-nvmrc() {
    local nvmrc_path
    nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version
        nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

        if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
        elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
            nvm use
        fi
    elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
        echo "Reverting to nvm default version"
        nvm use default
    fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
