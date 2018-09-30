#!/bin/bash

yum upgrade --all

formulas=(
git
wget
curl
tmux
tree
awscli
jq
tree
)

echo "start yum install apps..."
for formula in "${formulas[@]}"; do
  yum install $formula || yum upgrade $formula
done

# dein install
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
sh /tmp/installer.sh ~/.vim/dein

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

                            END
