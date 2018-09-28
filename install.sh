# dotfiles関係
set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update

echo "start setup..."

# fzf install
cd $THIS_DIR
git clone --depth 1 https://github.com/junegunn/fzf.git $THIS_DIR/.fzf
$THIS_DIR/.fzf/install

for f in .??*; do
  if [ $f != '.git'  -a $f != '.gitignore' ] ; then
    ln -snfv $THIS_DIR/"$f" ~/
  fi
done

bin=(
get_ssid
battery
show-ip
tar-help
address
)

for f in "${bin[@]}"; do
  ln -snfv $THIS_DIR/bin/"$f" /usr/local/bin/"$f"
  chmod 755 /usr/local/bin/"$f"
done

# dein install
cd $THIS_DIR/.vim/dein
git clone https://github.com/Shougo/dein.vim.git



cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

                            END
