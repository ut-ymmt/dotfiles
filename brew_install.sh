#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade --all

formulas=(
awscli
binwalk
colordiff
curl
dive
docker-compose
kubectx
kustomize
kubetail
goenv
ghkw
git
imagemagic
jq
lua
mysql
node
openssl
p7zip
pyenv
pyenv-virtualenv
python3 # vim luaのために必要
"vim --with-lua"
rbenv
reattach-to-user-namespace
rsync
terraform
terminal-notifier
tmux
tree
wget
yarn
z
starship
zplug
zsh
zsh-completions
)

"brew tap..."
brew tap sanemat/font
brew tap johanhaleby/kubetail

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
  brew install $formula || brew upgrade $formula
done

# docker-completions
mkdir ~/.zsh/completions
ln -s /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion ~/.zsh/completions/_docker
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion ~/.zsh/completions/_docker-compose

casks=(
bettertouchtool
cyberduck
docker
dropbox
google-chrome
google-cloud-sdk
google-japanese-ime
iterm2
slack
vagrant
vagrant-manager
virtualbox
google-cloud-sdk
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
  brew cask install $cask
done

brew cleanup
brew cask cleanup

# node.js tools
yarns=(
serverless
netlify-cli
)

echo "start brew cask install apps..."
for yarn in "${yarns[@]}"; do
  yarn global add $yarn
done

# kubectl install
gcloud init
gcloud components update
gcloud components install kubectl

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
