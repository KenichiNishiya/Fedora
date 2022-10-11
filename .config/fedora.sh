#! FEDORA

acpi
alacritty
AtomicParsley
ark
bleachbit
brightnessctl
dolphin
fcitx5
ffmpeg
ffmpegthumbnailer
ffmpegthumbs
htop
lutris
megasync
mpc
mpd
ncdu
ncmpcpp
network-manager-applet
nm-connection-editor
obs-studio
okular
pavucontrol
perl-File-MimeInfo
qbittorrent
ranger
redshift
rofi
spectacle
speedtest-cli
steam
timeshift
unrar
xfce4-power-manager
xclip
xsel
yt-dlp
zsh

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! JOURNALCTL ERRORS

'chronyd[837]: Could not add source 200.20.186.76'
sudo systemctl disable chronyd
# Seems to be a program to sync the clock
#
'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! DNF CONFIGURATION

sudo vim /etc/dnf/dnf.conf
# Add these to the file:
fastestmirror=True
max_parallel_downloads=20
defaultyes=Yes

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
# RPM
# https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/

# If using zsh it may occour an error, so try with bash
bash
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Media codec
# https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

sudo dnf install lame\* --exclude=lame-devel

sudo dnf group upgrade --with-optional Multimedia

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! ENABLE TRIM FOR SSD (BETTER PERFORMANCE AND SSD LIFETIME)

sudo systemctl enable fstrim.timer

# ADJUST SWAPPINESS
sysctl vm.swappiness
sudo vim /etc/sysctl.d/99-swappiness.conf
# Add the following line:
vm.swappiness=10

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! RENAME PC / CHANGE HOSTNAME

hostnamectl set-hostname newname
# To confirm it worked:
hostname

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! FONTS

# Download these:
# https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Sans/complete/Noto%20Sans%20Medium%20Nerd%20Font%20Complete.ttf
# https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip

sudo mkdir /usr/share/fonts/jetbrain-mono-fonts
cp -r ~/Downloads/JetBrainsMono /usr/share/fonts/jetbrains-mono-fonts
sudo chown yori:yori /usr/share/fonts/jetbrains-mono-fonts/JetBrainsMono

sudo mkdir /usr/share/fonts/noto-nerd-font
cp ~/Downloads/Downloads/Noto\ Sans\ Medium\ Nerd\ Font\ Complete.ttf /usr/share/fonts/noto-nerd-font

sudo dnf install google-noto-sans-jp-fonts
# Reload the fonts
fc-cache -f -v

# You can check all fonts installed with
fc-list

# You can search with
fc-match FontName

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! INSTALLING BSPWM AND OTHER THINGS
sudo dnf install git bspwm rofi nitrogen sxhkd polybar dunst libnotify lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
sudo systemctl enable lightdm
cd /opt
sudo git clone https://github.com/KenichiNishiya/ArchLinux.git

mkdir ~/.config/bspwm
cp /opt/ArchLinux/.config/bspwm/bspwmrc /home/yori/.config/bspwm/
sudo chmod +x /home/yori/.config/bspwm/bspwmrc

mkdir ~/.config/rofi
cp /opt/ArchLinux/.config/rofi/config.rasi /home/yori/.config/rofi/

mkdir ~/.config/rofi/shared
vim ~/.config/rofi/shared/colors.rasi
# Paste the following for the Dracula theme:
* {
background:     #1E1F29FF;
background-alt: #282A36FF;
foreground:     #FFFFFFFF;
selected:       #BD93F9FF;
active:         #50FA7BFF;
urgent:         #FF5555FF;
}
# Other color schemes you can find here:
# https://github.com/adi1090x/rofi/tree/master/files/colors

mkdir ~/.config/sxhkd
cp /opt/ArchLinux/.config/sxhkd/sxhkdrc /home/yori/.config/sxhkd/

mkdir ~/.config/polybar
cp /opt/ArchLinux/.config/polybar/* /home/yori/.config/polybar/
sudo chmod +x /home/yori/.config/polybar/launch.sh

mkdir ~/.config/picom
cp /opt/ArchLinux/.config/picom/picom.conf /home/yori/.config/picom/

mkdir .config/dunst
cp /opt/ArchLinux/.config/dunst/dunstrc ~/.config/dunst/
# You can test with 
notify-send Title Message

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! ALACRITTY TERMINAL

sudo dnf install alacritty
mkdir ~/.config/alacritty
cp /opt/ArchLinux/.config/alacritty/alacritty.yml ~/.config/alacritty/

# If you use multi monitor with different sizes, do the following to fix (if broken )the font:
vim .profile
# Paste the following command:
export WINIT_X11_SCALE_FACTOR=1

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'

#! SET ZSH
# https://www.sitepoint.com/zsh-tips-tricks/

sudo dnf install zsh
# Make zsh the default shell
chsh -s $(which zsh)
reboot

# Install Oh My Zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Plugin: autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Plugin: syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Search for the line with plugins=(git) and replace it for:
vim ~/.zshrc
plugins=(zsh-autosuggestions colored-man-pages zsh-syntax-highlighting)

# Set PS1 to show full path:
vim .oh-my-zsh/themes/robbyrussell.zsh-theme
# Change the %c% from the second line to %~%
# Source or reopen the terminal

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! CONFIGURE THEME GTK AND QT

sudo dnf install lxappearance qt5ct kvantum

mkdir ~/.themes
cd ~/.themes
git clone https://github.com/dracula/gtk.git
# There is also a Kvantum theme inside gtk/kde/kvantum/
mv gtk dracula

mkdir ~/.icons
cd ~/.icons
git clone https://github.com/m4thewz/dracula-icons

# For the cursor we need to something different:
# https://www.gnome-look.org/p/1669262
# It needs to be in tar.gz format
mv ~/.themes/dracula/kde/cursors/Dracula-cursors ~/.themes
cd ~/.themes
tar -cvzf Dracula-cursors.tar.gz Dracula-cursors
# Place it anywhere, I usually leave on the .themes folder

lxappearance

sudo cp -r ~/.themes/dracula /usr/share/themes/
sudo cp -r ~/.icons/dracula-icons /usr/share/icons/
sudo cp -r ~/.themes/Dracula-cursors.tar.gz /usr/share/themes/

sudo lxappearance

# Cursor theme on Desktop screen and other things idk
sudo vim /usr/share/icons/default/index.theme
sudo vim /usr/share/gtk-2.0/gtkrc

# Also change the lightdm
sudo cp ~/Pictures/.sysimg/ayy.jpg /usr/share/backgrounds
sudo lightdm-gtk-greeter-settings

# Now for the qt stuff
kvantum
# Install/Update Theme > Select a Kvantum theme folder > /home/yori/.themes/dracula/kde/kvantum/Dracula-purple-solid > Choose > Install this theme
# Change/Delete Theme > Select a theme: > Dracula-purple-solid > Use this theme
qt5ct
# Appearance > Style: > kvantum > Apply
# Icon Theme > Dracula > Apply

vim .profile
# Paste the following line:
export QT_QPA_PLATFORMTHEME=qt5ct

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! CUSTOMIZE FIREFOX CSS

# Find the firefox profile you are using and cd to it
cd .mozilla/firefox/paufwehashu.default-release
mkdir chrome
vim userChrome.css
# Inside firefox, go to about:config and turn true the following:
# toolkit.legacyUserProfileCustomizations.stylesheets

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'

#! JAPANESE KEYBOARD INPUT
# https://www.youtube.com/watch?v=lJoXhS4EUJs

sudo dnf install fcitx5 fcitx5-mozc fcitx5-configtool fcitx5-gtk fcitx5-qt

sudo vim ~/.profile
# Paste the following somewhere in the file
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Make it auto start on a startup file
fcitx5 &

# fctix5-configtool
# On the menu click the + button and deselect the box, then add mozc

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! PULSEMIXER TO CONTROL SOUND VOLUME
cd /opt
sudo chown yori:yori /opt
curl https://raw.githubusercontent.com/GeorgeFilipkin/pulsemixer/master/pulsemixer > pulsemixer && chmod +x ./pulsemixer
# To use it you will have to type it's full path (/opt/pulsemixer)

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! POWER SAVING

sudo dnf install xfce4-power-manager
# This is a GUI app for power management

#- auto-cpufreq
# This shit is broken on Fedora, unless you use snap
sudo dnf install snapd
sudo snap install auto-cpufreq
sudo snap run auto-cpufreq --install

#- thermald
sudo dnf install thermald
sudo systemctl enable --now thermald

#- powertop
sudo dnf install powertop
# You can make it auto run on startup:
sudo vim /etc/systemd/system/powertop.service
# Paste the following content
'
[Unit]
Description=Powertop tunings

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/powertop --auto-tune

[Install]
WantedBy=multi-user.target
'
sudo systemctl enable --now powertop

# Or you can use the powertop2tuned utility:
# sudo dnf install tuned-utils
# sudo systemctl enable --now tuned
# sudo powertop2tuned -e profile_name
# sudo tuned-adm profile profile_name

# Another thing is 
sudo dnf install power-profiles-daemon
sudo systemctl enable power-profiles-daemon

#- cpu governor / frequency
sudo dnf install kernel-tools
# Check the cpu frequency with
cpupower frequency-info
# Change the governor with
sudo cpupower frequency-set --governor powersave
# This is the default governor and probably the best one.
# But may need to change the max frequency with
sudo cpupower frequency-set --max 3.5GHz

# If you use Intel cpu with TurboBoost, check if it's enabled with 
cat /sys/devices/system/cpu/intel_pstate/no_turbo
# It's a double negative, so 0 means that it's ACTIVE
# If you want to change it to 0 do:
echo "0" | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo

# You can see the stats with this
lscpu |egrep "Model name|MHz"

# Check CPU frequency in rt
watch -n1 "grep \"^[c]pu MHz\" /proc/cpuinfo"

# GUI for CPU frequency
sudo dnf install cpu-x

# Test with
sudo dnf install stress
stress --cpu 4

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! FLATPAK INSTALLATION AND THEMEING

sudo dnf install flatpak

# Add flathub
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# GTK theme
sudo flatpak override --filesystem=$HOME/.themes
# May not work with themes outside the home directory
sudo flatpak override --env=GTK_THEME=dracula
# Might need to reboot
reboot

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! RUN GUI PROGRAMS WHICH REQUIRES SUDO/ROOT
# https://wiki.archlinux.org/title/Polkit#Configuration

sudo dnf install polkit xfce-polkit

# You need to set it to auto start on .profile
xfce-polkit &

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! WINE AND WINE DEPENDENCIES
# https://wiki.winehq.org/Fedora

# Remember to change for your fedora version
sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/36/winehq.repo
sudo dnf install winehq-devel

sudo dnf install alsa-plugins-pulseaudio.i686 glibc-devel.i686 glibc-devel libgcc.i686 libX11-devel.i686 freetype-devel.i686 libXcursor-devel.i686 libXi-devel.i686 libXext-devel.i686 libXxf86vm-devel.i686 libXrandr-devel.i686 libXinerama-devel.i686 mesa-libGLU-devel.i686 mesa-libOSMesa-devel.i686 libXrender-devel.i686 libpcap-devel.i686 ncurses-devel.i686 libzip-devel.i686 lcms2-devel.i686 zlib-devel.i686 libv4l-devel.i686 libgphoto2-devel.i686  cups-devel.i686 libxml2-devel.i686 openldap-devel.i686 libxslt-devel.i686 gnutls-devel.i686 libpng-devel.i686 flac-libs.i686 json-c.i686 libICE.i686 libSM.i686 libXtst.i686 libasyncns.i686 libedit.i686 liberation-narrow-fonts.noarch libieee1284.i686 libogg.i686 libsndfile.i686 libuuid.i686 libva.i686 libvorbis.i686 libwayland-client.i686 libwayland-server.i686 llvm-libs.i686 mesa-dri-drivers.i686 mesa-filesystem.i686 mesa-libEGL.i686 mesa-libgbm.i686 nss-mdns.i686 ocl-icd.i686 pulseaudio-libs.i686  sane-backends-libs.i686 tcp_wrappers-libs.i686 unixODBC.i686 samba-common-tools.x86_64 samba-libs.x86_64 samba-winbind.x86_64 samba-winbind-clients.x86_64 samba-winbind-modules.x86_64 mesa-libGL-devel.i686 fontconfig-devel.i686 libXcomposite-devel.i686 libtiff-devel.i686 openal-soft-devel.i686 mesa-libOpenCL-devel.i686 opencl-utils-devel.i686 alsa-lib-devel.i686 gsm-devel.i686 libjpeg-turbo-devel.i686 pulseaudio-libs-devel.i686 pulseaudio-libs-devel gtk3-devel.i686 libattr-devel.i686 libva-devel.i686 libexif-devel.i686 libexif.i686 glib2-devel.i686 mpg123-devel.i686 mpg123-devel.x86_64 libcom_err-devel.i686 libcom_err-devel.x86_64 libFAudio-devel.i686 libFAudio-devel.x86_64

sudo dnf groupinstall "C Development Tools and Libraries"
sudo dnf groupinstall "Development Tools"

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! RUN A GAME ON LUTRIS / WINE WITH JAPANESE LOCALE

# WINE:
env LANG=ja_JP.UTF-8 wine Touhou.exe
# OR
env LC_ALL=ja_JP.UTF-8

# LUTRIS: Paste the command above on the arguments part of the app launch

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! WINE OPEN ON DEFAULT BROWSER
# http://www.webupd8.org/2010/03/how-to-make-wine-open-links-in-your.html

wine regedit
# Go to 'HKEY_CURRENT_USER > Software > Wine'
# Create a key named "WineBrowser" if it doesn't exist
# Paste the following as data
xdg-open,firefox,konqueror,mozilla,netscape,galeon,opera,dillo

# You may need to go to 'HKEY_CLASSES_ROOT > http > hell > open > command' and add the following to the line: '"%1"'

# Note: the single quotes don't enter in this, it's just for comment formatting.

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! MAKE A .desktop FILE FOR A LUTRIS GAME ENTRY FOR ROFI

# Package needed to call the game via CLI
sudo pacman -S python-magic

vim ~/.local/share/applications/NAMEOFTHEAPP.desktop

# For system wide apps, the path is /usr/share/applications
# Use the following template:
[Desktop Entry]
Type=Application
Name=Touhou
Icon=th
Exec=env LUTRIS_SKIP_INIT=1 lutris lutris:rungameid/9
Categories=Game
Keywords=Touhou, th

# Icon: You can put it on '~/.icons/' or in '/usr/share/pixmaps/' and must be a '.png' or other supported format, don't support '.jpg' nor '.jpeg'
# lutris/rungameid/9: Should correspond with the order that the games are added on Lutris, in this case, the game is the 9th
# You can, of course, create a .desktop file directly on Lutris by right clicking the game and selecting 'Create Application Menu Shortcut'

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! YOUTUBE-DLP (YT-DLP)

sudo pacman -S yt-dlp atomicparsley ffmpeg

# Wat
yt-dlp -o '~/Music/%(playlist_title)s/%(title)s.%(ext)s' -ciw -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 --add-metadata --cookies '~/Documents/ytdl/cookies-youtube-com.txt' --download-archive '~/Documents/ytdl/yt-dl_wat.txt' 'https://www.youtube.com/playlist?list=PLBYlt8Uh0EcxaT51BU5cyYxiGtN6JmoGL'

# Ongaku
yt-dlp -f bestaudio -ciw --newline -o '~/Music/%(playlist_title)s/%(title)s.%(ext)s' -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata -ciw --download-archive '~/Documents/ytdl/yt-dl_ongaku.txt' --cookies '~/Documents/ytdl/cookies-youtube-com.txt' 'https://www.youtube.com/playlist?list=PLBYlt8Uh0EcwSftTxeFaI3-6cqcQImKPZ'

# Video with subtitles and description on a separate folder
yt-dlp -o '/media/sf_Music/youtube-dl/%(playlist_title)s/%(title)s/%(title)s.%(ext)s' -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 --add-metadata --audio-quality 0 --embed-thumbnail -ciw --all-subs --write-description --download-archive '/media/sf_Music/youtube-dl/yt-dl.txt --cookies /home/teruyoh/Desktop/cookies-youtube-com.txt' 'https://www.youtube.com/playlist?list=PLBYlt8Uh0EcwSftTxeFaI3-6cqcQImKPZ'

# Generic video
yy-dlp -o '/media/sf_Music/youtube-dl/%(playlist_title)s/%(title)s.%(ext)s' -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 --add-metadata --cookies '/home/teruyoh/Desktop/cookies-youtube-com.txt' --download-archive yt-dl_video.txt ''

# Generic audio only
yt-dlp -f bestaudio -o '/media/sf_Music/youtube-dl/%(playlist_title)s/%(title)s.%(ext)s' -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata -ciw --download-archive yt-dl_audio.txt --cookies '/home/teruyoh/Desktop/cookies-youtube-com.txt' 'https://www.youtube.com/playlist?list=PLBYlt8Uh0EcwSftTxeFaI3-6cqcQImKPZ'

# until ;do sleep 5; done //set a 5 sec delay between donwloads

#'%(autonumber)s - %(title)s.%(ext)s'

#/home/teruyoh/youtube-dl/%(title)s.%(ext)s #directory to where it'll download, if don't exists it creates it, but need to use sudo and it'll be locked
#sudo chown -R $USER: $HOME
#to unlock

#--match-filter 'duration < 600' //only download videos shorter than 600 seconds

# Error: /usr/bin/env: ‘python’: No such file or directory
sudo ln -s /usr/bin/python3 /usr/bin/python

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! CHANGE DEFAULT APPLICATION TO OPEN A FILE TYPE
# https://wiki.archlinux.org/title/default_applications

sudo dnf install perl-File-MimeInfo

# Determine the extension of an specific file
mimetype file.extension

# Choose the default application to open that file type
mimeopen -d file.extension

# Type the number corresponding to the app

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! DOLPHIN NOT SHOWING VIDEO THUMBNAILS
# https://www.q4os.org/forum/viewtopic.php?id=3462

sudo dnf install ffmpegthumbs
# Go to 'Configure > Configure Dolphin > Previews
# Check the video option

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! MICROPHONE CONFIGURATION AND TROUBLESHOOTING

#- HEADPHONE MIC NOT BEING RECOGNIZED

sudo dnf install pavucontrol
# This is a GUI application to control sound

#- MIC IS BOOSTED / BAD

alsamixer
# Press 'F6'
# Select the device other than the (default)
# Navigate to the right and remove any of these:

Headphone Mic Boost
Headset Mic Boost
Internal Mic Boost

# Press 'Esc'

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SHUTDOWN (OR ANY) COMMAND NOT FOUND

# Maybe the /sbin is not on your $PATH 
# To add it, do:
export PATH=/usr/libexec:/sbin:$PATH
# You can put it on your .profile so it's persistent
'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'

#! RANGER CONFIGURATION
'INCOMPLETE'
sudo dnf install ranger

#- RANGER SHOW IMAGE AND VIDEO THUMBNAIL

sudo dnf copr enable tokiarew/ueberzug
sudo dnf install ffmpegthumbnailer dnf-plugins-core ueberzug

vim .config/ranger/rc.conf
# line 047 set set preview_script ~/.config/ranger/scope.sh
# line 074 set preview images true
# line 117 set preview_images_method ueberzug

vim .config/ranger/scope.sh
# line 157 video/*)
# line 158 ffmpegthumbnailer -i "${FILE_PATH}" -o "${IMAGE_CACHE_PATH}" -s 0 && exit 6

#- OPEN FILE EXTENSION WITH DEFAULT PROGRAM APPLICATION
# It's configured on the 'rifle.conf' file, if you don't have it, do
ranger copy-config=all

vim .config/ranger/rifle.conf
# Here we have a lot of different default applications to various file extensions, they will be read line by line, so the upper it is, the higher the priority


'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SET UP PRINTER EPSON

# You will need epson's generic drivers, which can be found here:
# https://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=EN&CN2=&DSCMI=134381&DSCCHK=9edfca27f0a940d9e3f3156a3d46047ffbfe6d79
yay -S epson-inkjet-printer-escpr epson-printer-utility cups-pdf print-manager cups ghostscript cups system-config-printer

# You need to start CUPS service, maybe enable it
sudo systemctl start cups
sudo systemctl enable cups

# Now to setup the printer go to
system-config-printer # Also know as "Print Settings" on rofi
# From here, click on:
"Add > Network Printer > Forward > Apply"

# CHANGE DEFAULT PAPER SIZE FOR PRINTING DOCUMENTS

# Open 'Print Settings' > Right click your printer > Properties > Printer Options > Media Size

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! INTERNET NOT WORKING AFTER PROTONVPN

# Probably an issue related to security, disable or remove it with the following
nmcli con down id pvpn-ipv6leak-protection
nmcli connection delete id pvpn-ipv6leak-protection

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! VIM COPY AND PASTE TO THE SYSTEM CLIPBOARD

# Best way to do it is by installing 'gvim' (even though we won't use it), on Arch you can't have both 'vim' and 'gvim' packages, however, by installing 'gvim' it will automatically install 'vim', so install the latter.
sudo pacman -S gvim

# On .vimrc, put the following line to remap the keybindings to copy and paste
vnoremap <C-y> "+y
map <C-p> "+p


'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SET EXTRA MOUSE BUTTONS
yay -S xvkbd xbindkeys

# To know the name of the button, run this
xev -event button | grep button
# click on the white window and click on the button, it will appear on the terminal 'button 8' or another number

# To know the name of the key, run this
xev -event keyboard | grep keycode

mkdir .config/xbindkeys
vim .config/xbindkeys/.xbindkeysrc
# Use the following as template:

# Button 8 Home
"xvkbd -text '\[Home]'"
 b:8

# For some keys, you may need to refer to this: http://xahlee.info/linux/linux_xvkbd_tutorial.html

# To make it autostart, put on your .profile the following:
xbindkeys -f ~/.config/xbindkeys/.xbindkeysrc &

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! THUNAR CONFIGURATIONS

# AUTOMOUNT USB DEVICES AND DRIVES
sudo pacman -S gvfs
# If it doesn't work, try to install this package
sudo pacman -S thunar-volman

# ACESS REMOTE FILES
sudo pacman -S gvfs-smb sshfs

# FRONT-END TO ARCHIVING TOOLS (ARK)
sudo pacman -S thunar-archive-plugin
# Program restart is needed

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! MAKE VIM WORK ON CRONTAB

vim ~/.vimrc
# Add the following:
set backupskip+=/var/spool/cron/*
'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! VULKAN NOT INSTALLED OR SUPPORTED ERROR
# May have different drivers installed

ls -l /usr/share/vulkan/icd.d/
# If there is like amd and intel drivers, just remove the unused one
# To make sure it worked, use this tool
sudo pacman -S vulkan-tools
vulkaninfo

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! FILE EXPLORER POPUP CRASHES WHEN TRY TO SORT AND DON'T USE THE GTK THEME

# If the popup window is 'xdg-desktop-portal-gnome', them
sudo pacman -Rns xdg-desktop-portal-gnome
reboot

# The system will use xdg-desktop-portal-gtk. If not:
sudo pacman -S xdg-desktop-portal-gtk

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! (wine?) Performance support disabled
sudo vim /etc/sysctl.d/60-mdapi.conf
# Paste the following
dev.i915.perf_stream_paranoid=0
'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! STUTTERING ON WINE AND PROTON AUDIO
# https://bbs.archlinux.org/viewtopic.php?id=276168
# May be caused by audio buffer underrun

vim ~/.config/pipewire/pipewire.conf
# If it doesn't exists, them:
mkdir ~/.config/pipewire
cp -r /usr/share/pipewire/* ~/.config/pipewire/

# Edit the values of lines 31 and 32 to these:
default.clock.quantum       = 1024
default.clock.min-quantum   = 1024
# You can regulate to see which is better. The higher the value, the higher the latency.
systemctl restart pipewire-pulse --user ; systemctl restart pipewire --user

# MAY BE WORTH TRYING IF THE PREVIOUS THING FAILED:
# On Proton add this on config to startup
PULSE_LATENCY_MSEC=60 %command%

# On Lutris add this at System Options' key
PULSE_LATENCY_MSEC
60 # This is the value

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SETTING UP A CRON JOB

# List crontab
crontab -l

# Edit crontab
crontab -e

# SYNTAX: m h d m w command, each can be * to say any
# Can be @hourly @daily @monthly @reboot @
59 23 * * 0 yay -Syu
# This makes a system update every sunday at 23:59

# You can run with other users, ex
sudo crontab -u root -l

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SHOW SYSTEMD PROCESSES AT BOOT / SHUTDOWN

sudo vim /etc/default/grub
# Go to the line with "GRUB_CMDLINE_LINUX_DEFAULT" and remove the following options:
"loglevel 3 quiet"

sudo grub-mkconfig -o /boot/grub/grub.cfg

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! RUN A COMMAND WITH SUDO WITHOUT PASSWORD

# Search where is all the command binary
type -a umount

sudo vim /etc/sudoers.d/filename
# It's recommended to put your username as the filename in order to better manage sudoers

# Paste the following, changing to your username and program binary location
teruyo ALL=(ALL) NOPASSWD:/usr/bin/umount,/bin/umount

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! EMOJIS
sudo pacman -S rofi-emoji noto-fonts-emoji xsel

vim ~/.config/rofi/config.rasi
# On line 6 (modi:) add 'emoji'

# Run with the following command:
rofi -show emoji

# Remember to set it to a hotkey on sxhkd

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! CREATE A HOTSPOT INTERNET CONNECTION (NOT THE BEST WAY, NEED TO BE CONNECTED TO ETHERNET)
# https://computingforgeeks.com/create-wi-fi-hotspot-on-ubuntu-debian-fedora-centos-arch/

ip link show
# There should be a network named 'wlp2s0' or something

# Set some environment variables to help create the hotspot
IFNAME="wlp2s0" # Replace this with your network
CON_NAME="Hostpot Name"
nmcli con add type wifi ifname $IFNAME con-name $CON_NAME autoconnect yes ssid $CON_NAME

# Set connection method
nmcli con modify $CON_NAME 802-11-wireless.mode ap 802-11-wireless.band bg ipv4.method shared

# Set Password
nmcli con modify $CON_NAME wifi-sec.key-mgmt wpa-psk
nmcli con modify $CON_NAME wifi-sec.psk "Password"

# Bring up the connection (deactivates wi-fi)
nmcli con up $CON_NAME

# Bring down the connection (reactivates wi-fi)
nmcli con down $CON_NAME

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! CREATE A HOTSPOT INTERNET CONNECTION (BEST WAY)
# https://wiki.archlinux.org/title/software_access_point#Tools

yay -S linux-wifi-hotspot

# There is a GUI, you can manually enter with:
wihotspot

# Wifi interface: wlp2s0
# Wifi interface: wlp2s0

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! TRACKPAD WITH WEIRD CONFIG

sudo pacman -S xf86-input-synaptics

# Create a conf file if don't exists
sudo vim /etc/X11/xorg.conf.d/70-synaptics.conf

# Paste the following:
Section "InputClass"
    Identifier "touchpad"
    Driver "synaptics"
    MatchIsTouchpad "on"
        Option "TapButton1" "1"
        Option "TapButton2" "3"
        Option "TapButton3" "2"
        Option "VertEdgeScroll" "on"
        Option "VertTwoFingerScroll" "on"
        Option "HorizEdgeScroll" "on"
        Option "HorizTwoFingerScroll" "on"
        Option "CircularScrolling" "on"
        Option "CircScrollTrigger" "2"
        Option "EmulateTwoFingerMinZ" "40"
        Option "EmulateTwoFingerMinW" "8"
        Option "CoastingSpeed" "0"
        Option "FingerLow" "20"
        Option "FingerHigh" "40"
        Option "MaxTapTime" "125"
        Option      "VertScrollDelta"          "-111"
        Option      "HorizScrollDelta"         "-111"
EndSection


'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! DISABLE MOUSE ACCELERATION
# https://wiki.archlinux.org/title/Mouse_acceleration#Disabling_mouse_acceleration

sudo vim /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
# Paste the following:
Section "InputClass"
	Identifier "My Mouse"
	Driver "libinput"
	MatchIsPointer "yes"
	Option "AccelProfile" "flat"
	Option "AccelSpeed" "0"
EndSection

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! JAVA APPLICATIONS GREY SCREEN
# https://wiki.archlinux.org/title/Bspwm#Problems_with_Java_applications

sudo pacman -S wmname
vim ~/.config/bspwm/bspwmrc
# Paste the following:
wmname LG3D

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! XAMPP / LAMPP / LAMP
# https://www.youtube.com/watch?v=Y_GS5OPnd7I

yay -S xampp
sudo chmod 777 /opt/lampp/htdocs -R
# To start, type 'xampp start'

# ERROR ABOUT NEEDING A 32-BIT SOMETHING TO RUN
sudo pacman -S libxcrypt-compat

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! BLUETOOTH

sudo pacman -S bluez bluez-utils blueman pulseaudio-bluetooth
lsmod | grep btsub
# If returns nothing, then:
modprobe btusb
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

# To make it auto start
sudo vim /etc/bluetooth/main.conf
# Near the end modify the following line
AutoEnable=true

# To run it CLI
bluetoothctl
power on
agent on
default-agent
scan on
trust # Insert the device's MAC address
pair # Same here
connect # Same here
scan off

#- BLUETOOTH SERVICE ERROR
# https://askubuntu.com/questions/1340713/bluetooth-service-failed-to-set-mode

sudo rfkill unblock bluetooth
sudo systemctl stop bluetooth
sudo systemctl status bluetooth
sudo systemctl restart bluetooth

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! CANT RECOGNIZE HEADPHONE
# https://www.reddit.com/r/linux4noobs/comments/qfo21u/audio_isnt_being_automatically_redirected_to_my/

# May be a priority issue, check with
pactl list sinks | grep analog

sudo vim /usr/share/alsa-card-profile/mixer/paths/analog-output-headphones.conf
# Modify the following line to
[General]
priority = 100

sudo vim /usr/share/alsa-card-profile/mixer/paths/analog-output-speaker.conf
# Modify the following line to
[General]
priority = 90

systemctl restart --user pipewire-media-session pipewire-pulse pipewire
# May need to unplug and plug the headphone, maybe reboot

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SCRCPY TO CONTROL YOUR SMARTPHONE FROM PC

sudo pacman -S scrcpy
# Plug the device through USB
# Search the IP on the phone configurations
adb tcpip 5555
adb connect 192.168.15.52 # Use your IP here
# Unplug the device to run via Wi-fi
# To run with less latency:
scrcpy -m800 -b2M

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! TIMESHIFT DON'T MAKE AUTOMATIC SNAPSHOTS
# https://github.com/teejee2008/timeshift/issues/396

systemctl enable cronie.service
systemctl start cronie.service

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! DOWNLOAD VIDEOS FROM NND

yay -S nndownload
nndownload.py -u user@mail.com -p password --add-metadata -o '/home/teruyo/Music/NND/{title}.{ext}' https://www.nicovideo.jp/watch/sm30171731

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! VIRT-MANAGER
# https://computingforgeeks.com/install-kvm-qemu-virt-manager-arch-manjar/

# Check if virtualization is enabled, must return a value higher than 0
egrep -c '(vmx|svm)' /proc/cpuinfo

sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat archlinux-keyring ebtables iptables dmidecode ethtool
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo virsh net-start default
sudo virsh net-autostart default
#sudo virsh net-autostart --disable default
sudo vim /etc/libvirt/libvirtd.conf
# Uncomment those lines:
unix_sock_group = "libvirt" #L85
unix_sock_rw_perms = "0770" #L102

sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
sudo systemctl restart libvirtd.service

# Install Virtio-Win iso for Windows guest for better performance
# https://www.youtube.com/watch?v=8Xnmfqqyq4c
# https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/

# Enable XML editing on 'Edit > Preferences'
# Select to customize configuration before install
# Before installing Windows, to to 'CPUs > XML' and erase the following lines:
<timer name="rtc" tickpolicy="catchup"/>
<timer name="pit" tickpolicy="delay"/>
# And replace "no" with "yes" on the following line:
<timer name="hpet" present="yes"

# On 'SATA Disk 1' change to
Disk bus: VirtIO

# ON 'NIC' change to
Device Model: virtio

# To add the VirtIO iso:
# '> Add Hardware > Select or create custom storage'
# 'Device type: CDROM device'
# '> Manage > Browse Local > #SELECT THE ISO > Finish > Begin Installation'

# On the installation process:

# 'Custom: Install Windows only'
# '> Load Driver > OK'
# 'Red Hat VirtIO SCSI controller (path/to/w10/visiostor.inf)'
# '> Next > Next'

# May not have internet, just continue, then to add internet after it's done:
# '> File Explorer > virtio iso CD ROM > virtio-win-gt-x64.msi'
# Click 'Next' to everything

# Make a share folder for Linux Guest
# https://www.youtube.com/watch?v=9FBhcOnCxM8
mkdir share
chmod 777 share/

# Go to 'Hardware details of the VM > Add Hardware > Filesystem'
# Just modify the source path (/home/teruyo/share) and target Path (/sharepoint)
# Open the VM and type on it's terminal:
mkdir share
sudo mount -t 9p -o trans=virtio /sharepoint share
# To interact with the files made/altered by the guest on host, you may need sudo or chmod
sudo vim /etc/fstab
# Add the following, with the huge spaces being a tab key press
/sharepoint    /home/teruyo/share 9p    trans=virtio,version=9p2000.L,rw    0    0

# Make a shared folder for Windows guest (incomplete)
qemu-system-x86_64    -net user,smb=/absolute/path/to/folder    -net nic,model=virtio   ...
# Enable RDP in Windows and connect the VM with
# https://remmina.org/

# 'Name: Win10 RDP'
# 'Group: Development'
# 'Protocol: RDP - Remote Desktop Protocol'
# 'Pre Command: command %h %u %t %U %p %g --option'
# 'Post Command: /path/to/command - opt1 arg %h %u %t -opt2 %U %p %g'

# 'Server: 192.168.122.xxx'
# 'User name: teruyo'
# 'User password: *********'
# 'Domain: #ITS INDEED BLANK'
# 'Resolution: Use client resolution'
# 'Share folder: win10'


# TROUBLESHOOTING
# failed to connect socket to...
#https://github.com/code-ready/crc/issues/629

sudo vim /etc/libvirt/qemu.conf
# Add the following line:
stdio_handler="file"
sudo systemctl restart libvirtd.service

# INTERNET NOT WORKING
# May be caused by a conflict of 2 network managers: 'systemd-networkd' and 'NetworkManager'. Disable one of them.
# https://bbs.archlinux.org/viewtopic.php?id=273243&p=2
sudo systemctl disable systemd-networkd
reboot

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'