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

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

                            END
