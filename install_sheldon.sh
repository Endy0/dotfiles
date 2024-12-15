#!/bin/bash

# zshのパッケージマネージャ
# https://github.com/rossmacarthur/sheldon
curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
  | bash -s -- --repo rossmacarthur/sheldon --to ./bin
