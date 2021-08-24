#!/usr/bin/env bash

set -ev

if [[ ! -d "~/.apps" ]]; then
  mkdir -p ~/.apps
fi

# Not sure if this works in Linux as well
if [[ ! -d ~/.local/share/nvim/packer.nvim ]]; then
  git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/packer.nvim
fi

if [[ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]]; then
  git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

TARGET_DIR=$HOME/.config/nvim

REPO_FOLDER="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")"
SOURCE_DIR="${REPO_FOLDER}nvim"

if [ -d  $TARGET_DIR ]; then
  TIMESTAMP=$(date +%Y%m%d-%H%m%s)
  BACKUP_DIR="${TARGET_DIR}-${TMESTAMP}"
  mv $TARGET_DIR $BACKUP_DIR
  echo "Your config was backed up in ${BACKUP_DIR}"
fi

# Install lua language server
# https://github.com//wiki/Build-and-Run-(Standalone)

ln -sf $SOURCE_DIR $TARGET_DIR
nvim +PackerInstall +q

npm i -g bash-language-server
