#!/usr/bin/env bash

set -ev

mkdir -p ~/.config/nvim
stow -t ~/.config/nvim nvim -v 2
