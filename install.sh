#!/usr/bin/env bash

set -e

TARGET_DIR=$HOME/.config/nvim

REPO_FOLDER="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")"
SOURCE_DIR="${REPO_FOLDER}nvim"

if [ -d  $TARGET_DIR ]; then
  TIMESTAMP=$(date +%Y%m%d-%H%m)
  BACKUP_DIR="${TARGET_DIR}-${TIMESTAMP}"
  mv $TARGET_DIR $BACKUP_DIR
  echo "Your config was backed up in ${BACKUP_DIR}"
fi

ln -sf $SOURCE_DIR $TARGET_DIR
