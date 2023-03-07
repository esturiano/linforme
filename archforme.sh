#!/bin/bash
# Обустройство arch-based свежеустановленной системы

clear
echo -en '\033[32;1m*******************************************************\033[0m'
echo -en '\033[32;1m***         TUNING MY NEW ARCH-BASED SYSTEM         ***\033[0m'
echo -en '\033[32;1m***                (at your own risk)               ***\033[0m'
echo -en '\033[32;1m***                    esturiano                    ***\033[0m'
echo -en '\033[32;1m*******************************************************\033[0m'
echo ''
echo ''

echo -en '\033[1mPackage\033[33;1m (yay)\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* )
            sudo pacman -S git reflector curl go nano unzip --noconfirm
            sudo reflector --verbose -l 20 -p https --country='Russia,USA, ' --sort rate --save /etc/pacman.d/mirrorlist
            git clone https://aur.archlinux.org/yay.git
            cd yay
            makepkg -sir
            cd ..
            rm -fR yay
            echo -en '\033[32;1mDone.\033[0m'

            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''
clear

echo -en '\033[1mInstalling yandex-browser\033[33;1m (+jq!)\033[0m\033[1m. \033[36;1mDo it? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* )

            yay -S --noconfirm jq yandex-browser
            echo -en '\033[32;1mDone.\033[0m\n'

            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''
clear

echo -en '\033[1mInstalling yandex-disk\033[33;1m (+GUI indicator)\033[0m\033[1m. \033[36;1mDo it? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* )

            yay -S --noconfirm yandex-disk yandex-disk-indicator
            mkdir ~/.esturiano@yandex
            echo -en '\033[32;1mDone.\033[0m\n'

            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''
clear


echo -en '\033[1mInstalling daily packages\033[33;1m (utils, office, tools etc.)\033[0m\033[1m. \033[36;1mDo it? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* )


            yay -S --noconfirm gnome-disk-utility okular imagewriter gimp kdenlive obs-studio blender soundkonverter libreoffice-fresh libreoffice-fresh-ru
            echo -en '\033[32;1mDone.\033[0m\n'

            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''
clear


echo -en '\033[1mInstalling qemu/KVM\033[33;1m (+virt-manager)\033[0m\033[1m. \033[36;1mDo it? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* )


            yay -S --noconfirm libvirt qemu-arch-extra qemu-guest-agent qemu virt-manager dnsmasq
            yay -S --noconfirm virtio-win
            sudo gpasswd -a $USER libvirt
            sudo systemctl start libvirtd.service
            sudo systemctl enable libvirtd.service
            echo -en '\033[32;1mDone.\033[0m\n'

            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''
clear


echo -en '\033[1mPackage\033[33;1m "Chaotic-AUR"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* )
            wget -q -O chaotic-AUR-installer.bash https://raw.githubusercontent.com/SharafatKarim/chaotic-AUR-installer/main/install.bash && sudo bash chaotic-AUR-installer.bash && rm chaotic-AUR-installer.bash
            echo -en '\033[32;1mDone.\033[0m\n'
            
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''
clear


# https://drive.google.com/file/d/1JJdi5aNSjN74WD0FQmcjq2PVaYCQlXs5/view?usp=sharing
echo -en '\033[1mSystem notification library\033[33;1m (my favorite sounds)\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* )
            fileid="1JJdi5aNSjN74WD0FQmcjq2PVaYCQlXs5"
            filename="msounds.zip"
            curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
            curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
            unzip msounds.zip
            rm msounds.zip
            sudo mv msounds /usr/share/sounds
            echo -en '\033[32;1mDone.\033[0m\n'

            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''
clear


echo -en '\033[1mPackage\033[33;1m "zsh"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* )
            yay -S zsh --noconfirm
            curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh ;
            chsh -s /usr/bin/zsh;
            sudo chsh -s /usr/bin/zsh;
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
            mv zsh-syntax-highlighting .zsh-syntax-highlighting
            echo "source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
            git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
            # echo -en '\033[33mAdd plugin to the file .zshrc (string plugins =(... zsh-autosuggestions).\033[0m\n'
            # cd
            # nano +71 .zshrc
            echo -en '\033[32;1mDone.\033[0m\n'
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''
clear


# https://www.linuxuprising.com/2019/04/download-master-pdf-editor-4-for-linux.html
echo -en '\033[1mPackage\033[33;1m "master-pdf-editor (free)"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* )
            yay -S masterpdfeditor-free --noconfirm
            echo -en '\033[32;1mVersion 4.3.89 installed.\033[0m\n'
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''
clear


# https://github.com/jimevins/glabels-qt/
echo -en '\033[1mPackage\033[33;1m "glabels-qt (beta)"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* )
            yay -S glabels-qt-git --noconfirm
            echo -en '\033[32;1mDone.\033[0m\n'
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''
clear


echo -en '\033[1mDrivers\033[33;1m "nvidia-340xx-lts-dkms"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* )
            yay -Sy nvidia-340xx-lts-dkms nvidia-340xx-utils lib32-opencl-nvidia-340xx opencl-nvidia-340xx --noconfirm
            sudo nvidia-xconfig --no-logo
            echo -en '\033[32;1mDone.\033[0m\n'
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''
clear


echo -en '\033[1mDo you want to remove this script\033[33;1m ("archforme.sh")\033[0m\033[1m\033[36;1m? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* )
            rm -f archforme.sh
            echo -en '\033[32;1mDone.\033[0m\n'
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''
echo ''
clear


echo -en '\033[32;1m*******************************************************\033[0m\n'
echo -en '\033[32;1m***                   GAME OVER!!!                  ***\033[0m\n'
echo -en '\033[32;1m***                  Good luck! :-)                 ***\033[0m\n'
echo -en '\033[32;1m*******************************************************\033[0m\n'
echo -en ''
echo -en ''

