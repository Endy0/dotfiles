#!/bin/bash

REPO="peco/peco"
ASSET_PATTERN="peco_linux_amd64.tar.gz"

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
if which peco > /dev/null 2>&1; then
  CURRENT_VERSION=$(peco --version | awk '{print $3}')
  if [[ $CURRENT_VERSION =~ ^v[0-9]+(\.[0-9]+)*$ ]]; then
    if [ $CURRENT_VERSION = $TAG ]; then
      echo "Latest version is already installed. You can check the current peco version by executing 'peco --version'"
      exit 0
    fi
  else
    echo "Error: Current version cannot awked. Please check 'peco --version' output"
    exit 1
  fi
fi

# APIのjsonデータを取得
RELEASE_JSON=$(curl -sL "https://api.github.com/repos/$REPO/releases/tags/$TAG")
# echo $RELEASE_JSON | jq > release.json

# URLを取得
ASSET_URL=$(echo "$RELEASE_JSON" | jq '.assets[] | {name:.name, url:.browser_download_url}' | jq "select(.name == \"${ASSET_PATTERN}\")" | jq -r '.url')
# echo $ASSET_URL

if [ -z "$ASSET_URL" ]; then
  echo "Error: No matching asset found for pattern '$ASSET_PATTERN'."
  exit 1
fi

# ダウンロード/インストール
echo "Downloading asset: $ASSET_URL"

TEMP_DIR="./peco_temp_dir"
mkdir $TEMP_DIR
curl -L "$ASSET_URL" -o "$TEMP_DIR/$ASSET_PATTERN"
tar -xzf "$TEMP_DIR/$ASSET_PATTERN" -C "$TEMP_DIR"
cp "$TEMP_DIR/$(basename $ASSET_PATTERN .tar.gz)/peco" ./bin

rm -rf "$TEMP_DIR"
