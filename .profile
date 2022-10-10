#lightdm SOURCES THIS FILE
export WINIT_X11_SCALE_FACTOR=1
export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR=vim
export MANGOHUD=0
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export PATH=/home/teruyo/.cargo/bin:/sbin:/usr/libexec:$PATH
#export PATH=/home/teruyo/.cargo/bin:$PATH

#export PULSE_LATENCY_MSEC=80
#export XDG_DATA_DIRS=/home/teruyo/.local/share/flatpak/exports/share
# export _JAVA_AWT_WM_NONREPARENTING=1

# Blue light filter
redshift -P -O 3550

# Start programs
sxhkd &
#picom --experimental-backend -b &
nm-applet &
fcitx5 &
megasync & #xdotool search --name 'MEGAsync' windowclose
# kdeconnect-indicator &
dunst &
xfce4-power-manager &
mpd &
#qlipper &
#qbittorrent & # xdotool search --name "qBittorrent v4.4.3.1" windowminimize
xfce-polkit &
nitrogen --restore

#xbindkeys -f ~/.config/xbindkeys/.xbindkeysrc &
#easyeffects --gapplication-service &

# Minimize app
#sleep 1; xdotool search --name 'MEGAsync' windowclose
