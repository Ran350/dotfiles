#      __               __
#     / /_  ____ ______/ /_
#    / __ \/ __ `/ ___/ __ \
#   / /_/ / /_/ (__  ) / / /
#  /_.___/\__,_/____/_/ /_/

#--------------------------------------------------------------#
##        source starship                                     ##
#--------------------------------------------------------------#
eval "$(starship init bash)"
export BASH_SILENCE_DEPRECATION_WARNING=1

[ -f ~/dotfiles/local/local.conf ] && source ~/dotfiles/local/local.conf

#--------------------------------------------------------------#
##        環境変数                                            ##
#--------------------------------------------------------------#

export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

export EDITOR='code'
export VISUAL='code'
export PAGER='less'

# rust
export PATH=$PATH:$HOME/.cargo/bin
# local bin
export PATH=$PATH:$HOME/.local/bin
# dotfiles bin
export PATH=$PATH:$HOME/dotfiles/bin
