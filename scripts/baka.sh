#!bin/bash

day=$(date +"%Y-%m-%dT%H%M%S")

cp ~/.config/alacritty/alacritty.yml ~/Documents/bakap/alacritty/alacritty.yml-$day
cp ~/.config/bspwm/bspwmrc ~/Documents/bakap/bspwm/bspwmrc-$day
cp ~/.config/dunst/dunstrc ~/Documents/bakap/dunst/dunstrc-$day
cp ~/.config/polybar/config ~/Documents/bakap/polybar/config-$day
cp ~/.config/polybar/launch.sh ~/Documents/bakap/polybar/lauch.sh-$day
cp ~/.config/rofi/config.rasi ~/Documents/bakap/rofi/config.rasi-$day
cp ~/.config/sxhkd/sxhkdrc ~/Documents/bakap/sxhkd/sxhkdrc-$day
cp ~/.config/nvim/init.vim ~/Documents/bakap/nvim/init.vim-$day
cp ~/.zsh_aliases ~/Documents/bakap/zsh_aliases/zsh_aliases-$day
cp ~/.profile ~/Documents/bakap/profile/profile-$day
cp ~/.zshrc ~/Documents/bakap/zshrc/zshrc-$day
cp ~/Documents/fedora.sh ~/Documents/bakap/fedora/fedora.sh-$day
cp ~/.config/compton.conf ~/Documents/bakap/compton-$day
echo "Bakad up dot flies"
