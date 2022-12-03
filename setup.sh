# update and install some things we should probably have
apt-get update
apt-get install -y \
  curl \
  git \
  gnupg2 \
  jq \
  sudo \
  zsh

# setup git
git config --global user.name "piercypixel"
git config --global user.email "piercypixel@gmail.com"
git config --global url."ssh://".insteadOf git://
git config --global rerere.enabled true
git config --global pull.ff only
git config --global alias.fixup = $(echo "(){ git fetch origin ${1:-main} && git rebase -i --autosquash HEAD~$(git cherry -v origin/${1:-main} | wc -l | tr -d '[:space:]'); } f")
git config --global core.editor "code --wait"
git config --global difftool.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'
git config --global diff.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'
git config --global merge.tool vscode

# install oh-my-zsh and plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i -e 's/^\(plugins=(.*\)\()\s*$\)/\1\n\tgit\n\tzsh-autosuggestions\n\tzsh-syntax-highlighting\n)/g' $HOME/.zshrc

# persist shell history
echo "export PROMPT_COMMAND='history -a'" >>"$HOME/.zshrc"
echo "export HISTFILE=/commandhistory/.zsh_history" >>"$HOME/.zshrc"
echo "\n" >>"$HOME/.zshrc"

# setup shell
echo 'export PATH=$HOME/bin:/usr/local/bin:$PATH' >>"$HOME/.zshrc"
echo 'export ZSH="$HOME/.oh-my-zsh"' >>"$HOME/.zshrc"
echo "\n" >>"$HOME/.zshrc"

echo 'ZSH_THEME="robbyrussell"' >>"$HOME/.zshrc"
echo 'ENABLE_CORRECTION="true"' >>"$HOME/.zshrc"
echo 'COMPLETION_WAITING_DOTS="true"' >>"$HOME/.zshrc"
echo 'ZSH_DISABLE_COMPFIX="true"' >>"$HOME/.zshrc"
echo "\n" >>"$HOME/.zshrc"

echo 'source $ZSH/oh-my-zsh.sh' >>"$HOME/.zshrc"
echo "\n" >>"$HOME/.zshrc"

# setup and install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

echo 'export NVM_DIR="$HOME/.nvm"' >>"$HOME/.zshrc"
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >>"$HOME/.zshrc"
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >>"$HOME/.zshrc"
echo "\n" >>"$HOME/.zshrc"
