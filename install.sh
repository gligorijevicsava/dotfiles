#!/bin/bash

sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
sudo chown -R $USER:$USER yay
cd yay
makepkg -si
cd ..
rm -rf yay
rm -rf go

yay -S wob xdg-desktop-portal-hyprland-git alacritty authy brightnessctl pipewire pipewire-pulse pipewire-alsa bashtop cava clipman cmatrix cups splix flatpak firefox unzip unrar zip yt-dlp xorg-xwayland xarchiver winetricks wine-staging wget waybar-hyprland unrar tumbler gvfs gvfs-mtp ttf-symbola ttf-ms-win10-auto tldr thunderbird thunar swaylock-effects-git swayidle steam soundconverter slurp grim rofi-calc rofi-emoji rofi qt6ct qt6-wayland qt6-base qt5ct-kde qt5-base qt5-wayland python-pip python-tkinter plymouth p7zip otf-font-awesome otf-raleway ntp noto-fonts-emoji mpv mpv-mpris netctl neovim neofetch man-db mako ly-git lutris osu-handler libreoffice-fresh kvantum hyprland hyprpaper handbrake imv gtkpod gnome-disk-utility wlogout ffmpegthumbnailer gimp font-manager farge-git dracut dotnet-runtime dotnet-sdk dhcpcd dhclient clipman dialog alsa-utils libpulse mono noto-fonts-cjk python-psutil python-pydbus qbittorrent slop papirus-icon-theme

wget https://mega.nz/linux/repo/Arch_Extra/x86_64/megasync-x86_64.pkg.tar.zst
wget https://mega.nz/linux/repo/Arch_Extra/x86_64/thunar-megasync-x86_64.pkg.tar.xz

sudo pacman -U megasync-x86_64.pkg.tar.zst thunar-megasync-x86_64.pkg.tar.xz
rm megasync-x86_64.pkg.tar.zst thunar-megasync-x86_64.pkg.tar.xz

git clone https://git.hrfee.pw/hrfee/waybar-mpris.git
cd waybar-mpris
sed -i 's/SYMBOL:ARTIST:ALBUM:TITLE:POSITION/SYMBOL:TITLE:ARTIST:POSITION/' main.go
go build
sudo cp waybar-mpris /usr/local/bin/

cd /home/$USER/dotfiles/config/
cp -r alacritty cava fontconfig font-manager hypr Kvantum libreoffice mako mpv nvim qBittorrent qt5ct qt6ct rofi swaylock systemd waybar wlogout wob xarchiver zsh /home/$USER/.config/
sudo cp -r ly /etc/

cd

systemctl enable --user wob.service
sudo systemctl enable --now cups.service
sudo systemctl enable --now ntpd.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable netctl@auto.service

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
wget https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip
unzip CascadiaCode-2111.01.zip
cd otf/static/

sudo cp CascadiaCode-BoldItalic.otf CascadiaMono-BoldItalic.otf CascadiaCode-Bold.otf CascadiaMono-Bold.otf CascadiaCode-ExtraLightItalic.otf CascadiaMono-ExtraLightItalic.otf CascadiaCode-ExtraLight.otf CascadiaMono-ExtraLight.otf CascadiaCode-Italic.otf CascadiaMono-Italic.otf CascadiaCode-LightItalic.otf CascadiaMono-LightItalic.otf CascadiaCode-Light.otf CascadiaMono-Light.otf CascadiaCodePL-BoldItalic.otf CascadiaMonoPL-BoldItalic.otf CascadiaCodePL-Bold.otf CascadiaMonoPL-Bold.otf CascadiaCodePL-ExtraLightItalic.otf CascadiaMonoPL-ExtraLightItalic.otf CascadiaCodePL-ExtraLight.otf CascadiaMonoPL-ExtraLight.otf CascadiaCodePL-Italic.otf CascadiaMonoPL-Italic.otf CascadiaCodePL-LightItalic.otf CascadiaMonoPL-LightItalic.otf CascadiaCodePL-Light.otf CascadiaMonoPL-Light.otf CascadiaCodePL-Regular.otf CascadiaMonoPL-Regular.otf CascadiaCodePL-SemiBoldItalic.otf CascadiaMonoPL-SemiBoldItalic.otf CascadiaCodePL-SemiBold.otf CascadiaMonoPL-SemiBold.otf CascadiaCodePL-SemiLightItalic.otf CascadiaMonoPL-SemiLightItalic.otf CascadiaCodePL-SemiLight.otf CascadiaMonoPL-SemiLight.otf CascadiaCode-Regular.otf CascadiaMono-Regular.otf CascadiaCode-SemiBoldItalic.otf CascadiaMono-SemiBoldItalic.otf CascadiaCode-SemiBold.otf CascadiaMono-SemiBold.otf CascadiaCode-SemiLightItalic.otf CascadiaMono-SemiLightItalic.otf CascadiaCode-SemiLight.otf CascadiaMono-SemiLight.otf /usr/share/fonts/OTF/
cd 
rm -rf otf 
rm -rf woff2
rm -rf  ttf
rm CascadiaCode-2111.01.zip

sudo cp "MesloLGS NF Bold.ttf" "MesloLGS NF Bold Italic.ttf" "MesloLGS NF Italic.ttf" "MesloLGS NF Regular.ttf" /usr/share/fonts/TTF/
rm "MesloLGS NF Bold.ttf" "MesloLGS NF Bold Italic.ttf" "MesloLGS NF Italic.ttf" "MesloLGS NF Regular.ttf"
mkdir /home/$USER/Pictures/
cd /home/$USER/dotfiles/
cp wallpaper.jpg /home/$USER/Pictures/wallpaper.jpg

sudo cp /home/$USER/dotfiles/mkinitcpio.conf /etc/mkinitcpio.conf
sudo cp /home/$USER/dotfiles/grub /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo nvim /boot/grub/grub.cfg

cd
git clone https://github.com/ccontavalli/grub-shusher.git
cd grub-shusher
make
sudo ./grub-kernel /boot/efi/EFI/arch/grubx64.efi
cd
rm -rf grub-shusher
sudo mkinitcpio -P 

flatpak install io.github.spacingbat3.webcord

cd /home/$USER/dotfiles/
sudo cp environment /etc/environment

