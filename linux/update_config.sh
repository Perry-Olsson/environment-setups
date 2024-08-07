#!/bin/bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# copy x11 config
cp $script_dir/x11/.xinitrc $HOME/.xinitrc 
cp $script_dir/x11/.xprofile $HOME/.xprofile

# copy kitty conf
cp -a $script_dir/kitty/kitty.conf $HOME/.config/kitty/kitty.conf

# copy qtile
sudo cp $script_dir/qtile/qtile.desktop /usr/share/xsessions/
cp -a $script_dir/qtile/*.py $HOME/.config/qtile/
cp -a $script_dir/qtile/icons/ $HOME/.config/

# copy zsh mixin
cp $script_dir/.zsh_mixin $HOME/
