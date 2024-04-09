#--------------------------------------------------------------#
##        set unicode                                         ##
#--------------------------------------------------------------#
export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

#--------------------------------------------------------------#
##        editor                                              ##
#--------------------------------------------------------------#
export EDITOR='code'
export VISUAL='code'
export PAGER='less'

#--------------------------------------------------------------#
##        PATH                                                ##
#--------------------------------------------------------------#
# rust
export PATH=$PATH:$HOME/.cargo/bin
# homebrew
export PATH=$PATH:/opt/homebrew/bin
# Cursor
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"
# Go
export PATH=$PATH:$HOME/go/bin
# rust
export PATH=$PATH:$HOME/.cargo/bin
# pnpm
export PATH=$PATH:$HOME/Library/pnpm
# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
nvm use stable
# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin

# dotfiles bin
export PATH=$PATH:$HOME/dotfiles/bin
eval "$(pyenv init --path)"
# local bin
export PATH=$PATH:$HOME/.local/bin
