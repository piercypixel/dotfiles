export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/$USER/.oh-my-zsh"

ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
ZSH_DISABLE_COMPFIX="true"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
