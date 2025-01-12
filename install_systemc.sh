#!/bin/bash

REPO="accellera-official/systemc"
ASSET_PATTERN="peco_linux_amd64.tar.gz"

# jqがインストールされているか確認
if ! which jq > /dev/null 2>&1; then
  echo "Error: jq is not installed. Please install it first."
  echo "sudo apt install jq"
  exit 1
fi

# doxygen/graphvizがインストールされているか確認(document生成に必要)
if ! which doxygen > /dev/null 2>&1; then
  echo "Error: doxygen is not installed. Please install it first."
  echo "sudo apt install doxygen"
  exit 1
fi
if ! which dot > /dev/null 2>&1; then
  echo "Error: graphviz(command: dot) is not installed. Please install it first."
  echo "sudo apt install graphviz"
  exit 1
fi

# tagリストを取得
TAG_LIST=($(curl -s "https://api.github.com/repos/$REPO/tags" | jq -r '.[].name'))

# バージョン指定がされていないならtagリストをechoして終了
if [ $# -eq 0 ]; then
  echo "You should specify install version as argument:"
  for tag in ${TAG_LIST[@]}; do
    echo $tag
  done
  exit 1
fi

# 指定されたバージョンが存在するか確認
TAG=""
for tag in ${TAG_LIST[@]}; do
  if [ $1 == $tag ]; then
    TAG=$1
    break
  fi
done

if [ -z $TAG ]; then
  echo "Specified version doesn't exist"
  exit 1
fi

# ダウンロードしていないならダウンロード
ASSET_URL=https://github.com/$REPO/archive/refs/tags/$TAG.zip
INST_DIR=${XDG_DATA_HOME:=$HOME/.local/share}/systemc
if [ -r $INST_DIR/$TAG.zip ]; then
  echo "Specified version already exist: $INST_DIR/$TAG.zip"
else
  mkdir -p $INST_DIR
  echo "Downloading asset: $ASSET_URL"
  curl -L $ASSET_URL -o "$INST_DIR/$TAG.zip"
fi

# インストールのためにはコンパイラ指定(CXX)とそのオプション(CXXFLAGS)が必要
if [[ -z ${CXX} || -z ${CXXFLAGS} ]]; then
  echo "You need to specify CXX/CXXFLAGS as environment variable to install SystemC"
  exit 1
fi

# インストールのために移動
echo "Move to $INST_DIR to install"
pushd $INST_DIR > /dev/null

# 展開
SYSTEMC_HOME="$INST_DIR/systemc-$TAG"
rm -rf $SYSTEMC_HOME
unzip $TAG.zip > /dev/null

# インストール
cd $SYSTEMC_HOME
mkdir objdir
cd objdir
../configure
make
make check
make install

# doxygenでドキュメント生成
cd docs
make doxygen

echo "Install completed."
echo "You need to specify the following to use SystemC:"
echo "$SYSTEMC_HOME/include as include directory"
echo "$SYSTEMC_HOME/lib-linux64 as library directory"
popd > /dev/null
