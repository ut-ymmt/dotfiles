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
git
wget
curl
tmux
tree
openssl
z
colordiff
awscli
jq
binwalk
python3 #vim luaのために必要
imagemagic
reattach-to-user-namespace
lua
"vim --with-lua"
p7zip
pyenv
pyenv-virtualenv
zsh
zsh-completions
zplug
mysql
sqlite
node
yarn
)

"brew tap..."
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew tap homebrew/apache
brew tap sanemat/font

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
  brew install $formula || brew upgrade $formula
done

casks=(
dropbox
evernote
skitch
bettertouchtool
google-chrome
google-japanese-ime
slack
alfred
iterm2
libreoffice
cyberduck
vlc
atom
docker
virtualbox
vagrant
vagrant-manager
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
  brew cask install $cask
done


brew cleanup
brew cask cleanup


# python pyenv anaconda
pyenv install anaconda3-4.2.0
pyenv global anaconda3-4.2.0

# javascript library
yarns=(
aws-sdk
)

echo "start brew cask install apps..."
for yarn in "${yarns[@]}"; do
  yarn add $yarn
done

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

                            END
