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
tree
openssl
z
colordiff
awscli
jq
node
pyenv
"--without-etcdir zsh"
zsh-completions
"--with-cocoa --srgb emacs"
cask
hub
tig
node
python3
lua
"vim --with-lua"
mysql
sqlite
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


# dotfiles関係
set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update

echo "start setup..."
for f in .??*; do
  ln -snfv ~/dotfiles/"$f" ~/
done

bin=(
get_ssid
battery
)

for f in "${bin[@]}"; do
  ln -snfv ~/dotfiles/bin/"$f" /usr/local/bin/"$f"
  chmod 755 /usr/local/bin/"$f"
done

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

                            END
