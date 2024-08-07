#!/bin/bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ ! -d "$HOME/.config/nvim" ]; then
  rm $HOME/.config/nvim
  mkdir $HOME/.config/nvim
fi

cp -r $script_dir/nvim/init.vim $HOME/.config/nvim
echo "copied new init.vim file"
cp -r $script_dir/nvim/lua $HOME/.config/nvim
echo "copied nvim configuration directory"

