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
