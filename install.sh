#!/usr/bin/zsh

# update Systems
bash bin/update

# Install plugins

## install dein for nvim
mkdir -p ~/.cache/dein
cd ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
zsh ./installer.sh ~/.cache/dein


## install zinit for zsh
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

## install Rust for *nix
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rls rust-analysis rust-src
rustup component add rustfmt

## install sdk system 
 curl -s "https://get.sdkman.io" | bash
 source ~/.sdkman/bin/sdkman-init.sh
 sdk install java 14.0.2.j9-adpt
 sdk install gradle
 sdk install kotlin

## install nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts
nvm use --lts
node -v

## install Ruby
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv --version
exec $SHELL -l
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 2.7.2
rbenv global 2.7.2

##swich to zsh
chsh -s /bin/zsh
exec zsh

## some plugins for nvim CocInstall
nvim -c "source ~/.bin/cocplugins"

