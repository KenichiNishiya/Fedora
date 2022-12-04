#!bin/bash

day=$(date +"%Y-%m-%dT%H%M%S")

cp ~/.config/alacritty/alacritty.yml ~/.config/bakap/alacritty/alacritty.yml-$day
cp ~/.config/bspwm/bspwmrc ~/.config/bakap/bspwm/bspwmrc-$day
cp ~/.config/dunst/dunstrc ~/.config/bakap/dunst/dunstrc-$day
cp ~/.config/polybar/config ~/.config/bakap/polybar/config-$day
cp ~/.config/polybar/launch.sh ~/.config/bakap/polybar/launch.sh-$day
cp ~/.config/rofi/config.rasi ~/.config/bakap/rofi/config.rasi-$day
cp ~/.config/sxhkd/sxhkdrc ~/.config/bakap/sxhkd/sxhkdrc-$day
cp ~/.config/nvim/init.vim ~/.config/bakap/nvim/init.vim-$day
cp ~/.zsh_aliases ~/.config/bakap/zsh_aliases/zsh_aliases-$day
cp ~/.profile ~/.config/bakap/profile/profile-$day
cp ~/.zshrc ~/.config/bakap/zshrc/zshrc-$day
cp ~/Documents/fedora.sh ~/.config/bakap/fedora/fedora.sh-$day
#cp ~/.config/compton.conf ~/.config/bakap/compton-$day
echo "Bakad up dot flies"

