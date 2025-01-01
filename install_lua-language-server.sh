#!/bin/bash

REPO="LuaLS/lua-language-server"
REPO_BASE="$(basename $REPO)"
ASSET_PATTERN="\"^lua-language-server-[0-9]+(.[0-9]+)*-linux-x64.tar.gz$\""

# jqがインストールされているか確認
if ! which jq > /dev/null 2>&1; then
  echo "Error: jq is not installed. Please install it first."
  echo "sudo apt install jq"
  exit 1
fi

# latestのバージョンを確認
LATEST_URL=$(curl -sL -o /dev/null -w "%{url_effective}" "https://github.com/$REPO/releases/latest")
TAG=$(basename "$LATEST_URL")
echo "Latest version: $TAG"

# 現在のバージョンと比較
if which lua-language-server > /dev/null 2>&1; then
  CURRENT_VERSION=$(lua-language-server --version)
  if [[ $CURRENT_VERSION =~ ^[0-9]+(\.[0-9]+)*$ ]]; then
    if [ $CURRENT_VERSION = $TAG ]; then
      echo "Latest version is already installed. You can check the current lua-language-server version by executing 'lua-language-server --version'"
      exit 0
    fi
  else
    echo "Error: Current version cannot get. Please check 'lua-language-server --version' output"
    exit 1
  fi
fi

# APIのjsonデータを取得
RELEASE_JSON=$(curl -sL "https://api.github.com/repos/$REPO/releases/tags/$TAG")
# echo $RELEASE_JSON | jq > release.json

# URLを取得
ASSET_URL=$(echo "$RELEASE_JSON" | jq '.assets[] | {name:.name, url:.browser_download_url}' | jq "select(.name | test($ASSET_PATTERN))" | jq -r '.url')
# echo $ASSET_URL

if [ -z "$ASSET_URL" ]; then
  echo "Error: No matching asset found for pattern '$ASSET_PATTERN'."
  exit 1
fi

# ダウンロード/インストール
echo "Downloading asset: $ASSET_URL"
ASSET_NAME=$(basename $ASSET_URL)
echo $ASSET_NAME

TEMP_DIR="./${REPO_BASE}_dir"
rm -rf $TEMP_DIR
mkdir -p $TEMP_DIR/lua-language-server-env
curl -L "$ASSET_URL" -o "$TEMP_DIR/$ASSET_NAME"
tar -xzf "$TEMP_DIR/$ASSET_NAME" -C "$TEMP_DIR/lua-language-server-env"
cp -r "$TEMP_DIR/lua-language-server-env" ./bin/

rm -rf "$TEMP_DIR"
