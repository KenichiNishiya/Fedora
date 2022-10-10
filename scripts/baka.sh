#!bin/bash

day=$(date +"%Y-%m-%dT%H%M%S")

cp ~/.config/alacritty/alacritty.yml ~/Documents/dotfiles/alacritty/alacritty.yml-$day
cp ~/.config/bspwm/bspwmrc ~/Documents/dotfiles/bspwm/bspwmrc-$day
cp ~/.config/dunst/dunstrc ~/Documents/dotfiles/dunst/dunstrc-$day
cp ~/.config/picom/picom.conf ~/Documents/dotfiles/picom/picom.conf-$day
cp ~/.config/polybar/config ~/Documents/dotfiles/polybar/config-$day
cp ~/.config/polybar/launch.sh ~/Documents/dotfiles/polybar/lauch.sh-$day
cp ~/.config/rofi/config.rasi ~/Documents/dotfiles/rofi/config.rasi-$day
cp ~/.config/sxhkd/sxhkdrc ~/Documents/dotfiles/sxhkd/sxhkdrc-$day
cp ~/.vimrc ~/Documents/dotfiles/vim/vimrc-$day
cp ~/.zsh_aliases ~/Documents/dotfiles/zsh_aliases/zsh_aliases-$day
cp ~/.profile ~/Documents/dotfiles/profile/profile-$day
cp ~/.zshrc ~/Documents/dotfiles/zshrc/zshrc-$day
cp ~/Documents/arsh.sh ~/Documents/dotfiles/arsh/arsh-$day
echo "Bakad up dot flies"
