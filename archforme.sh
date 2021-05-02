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
            sudo reflector --verbose -l 20 -p https --sort rate --save /etc/pacman.d/mirrorlist
            git clone https://aur.archlinux.org/yay.git
            cd yay
            makepkg -si
            cd ..
            rm -fR yay
            echo -en '\033[32;1mDone.\033[0m'
            
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mPackages KDE-plasma\033[33;1m (plasma)\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -S xnconvert kde-servicemenus-rootactions yandex-disk yandex-disk-indicator --noconfirm
            # sudo systemctl enable sddm
            mkdir ~/.esturiano@yandex
            echo -en '\033[32;1mDone.\033[0m'
            
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mInstalling packages for works\033[33;1m (browsers, office, tools etc.)\033[0m\033[1m. \033[36;1mDo it? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
        
            
            yay -S gparted vlc gimp firefox firefox-i18n-ru libreoffice-fresh libreoffice-fresh-ru visual-studio-code-bin android-tools filezilla opera-ffmpeg-codecs opera --noconfirm
            # Подключение репозитория flathub
            # sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
            echo -en '\033[32;1mDone.\033[0m\n'
            
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''


echo -en '\033[1mSystem notification library\033[33;1m (my favorite sounds)\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            fileid="1dxSykLylPIfGwHeOtuoaY9gYXPmo9zXi"
            filename="mysounds.zip"
            curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
            curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
            unzip mysounds.zip
            rm mysounds.zip
            sudo mv mysounds /usr/share/sounds
            echo -en '\033[32;1mDone.\033[0m\n'
            
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''


# https://drive.google.com/file/d/1W-659_cJLsZtEeUr98mT8E-iGMz2Rdcd/view?usp=sharing jdk151
# https://drive.google.com/file/d/1JjCnalXi6901-WFUzzw2YMMw2J4-aI31/view?usp=sharing jre151

echo -en '\033[1mPackage\033[33;1m "google-drive-ocamlfuse-opam"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -S google-drive-ocamlfuse-opam --noconfirm
            echo -en '\033[32;1mDone.\033[0m\n'
            mkdir ~/.drive@alejandro
            # mkdir ~/.drive@senoraarina
            
            fileid="1bvlxchCP5ZNQ1WV-o1Qq9IAKDnLs_Vq1"
            filename="__ocamlgoogledrive.sh"
            curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
            curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
            chmod +x __ocamlgoogledrive.sh
            sudo mv __ocamlgoogledrive.sh /usr/bin
            cd .config/autostart-scripts/ && ln -s /usr/bin/__ocamlgoogledrive.sh
            cd 
            
            echo -en '\033[32;1mTuned.\033[0m\n'
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''



echo -en '\033[1mPackage\033[33;1m "zsh"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -S zsh --noconfirm
            curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh ;
            chsh -s /usr/bin/zsh;
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
            mv zsh-syntax-highlighting .zsh-syntax-highlighting
            echo "source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
            git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
            echo -en '\033[33mAdd plugin to the file .zshrc (string plugins =(... zsh-autosuggestions).\033[0m\n'
            cd
            nano +71 .zshrc
            echo -en '\033[32;1mDone.\033[0m\n'
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''


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


echo -en '\033[1mDrivers\033[33;1m "nvidia-340xx"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -Sy nvidia-340xx-dkms nvidia-340xx-utils lib32-nvidia-340xx-utils opencl-nvidia-340xx lib32-opencl-nvidia-340xx --noconfirm
            sudo nvidia-xconfig --no-logo
            echo -en '\033[32;1mDone.\033[0m\n'
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

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

echo -en '\033[32;1m*******************************************************\033[0m\n'
echo -en '\033[32;1m***                   GAME OVER!!!                  ***\033[0m\n'
echo -en '\033[32;1m***                  Good luck! :-)                 ***\033[0m\n'
echo -en '\033[32;1m*******************************************************\033[0m\n'
echo -en ''
echo -en ''

# zsh
source .zshrc

