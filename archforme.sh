#!/bin/bash
# Обустройство arch-based свежеустановленной системы

clear
echo '\033[32;1m*******************************************************\033[0m'
echo '\033[32;1m***         TUNING MY NEW ARCH-BASED SYSTEM         ***\033[0m'
echo '\033[32;1m***                (at your own risk)               ***\033[0m'
echo '\033[32;1m***                    esturiano                    ***\033[0m'
echo '\033[32;1m*******************************************************\033[0m'
echo ''
echo ''


echo -n '\033[1mPackage\033[33;1m (yay)\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            sudo pacman -S git reflector curl --noconfirm
            sudo reflector --verbose -l 20 -p https --sort rate --save /etc/pacman.d/mirrorlist
            git clone https://aur.archlinux.org/yay.git
            cd yay
            makepkg -si
            cd ..
            rm -fR yay
            echo '\033[32;1mDone.\033[0m'
            
            break;;
        [Nn]* ) echo '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''


echo -n '\033[1mInstalling important packages and make some settings\033[33;1m (for correct script working)\033[0m\033[1m. \033[36;1mDo it? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
        
            
            yay -S gparted android-tools filezilla kio-gdrive touchpad-toggle kde-servicemenus-rootactions --noconfirm
            echo '\033[32;1mDone.\033[0m\n'
            
            break;;
        [Nn]* ) echo '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''


echo -n '\033[1mSystem notification library\033[33;1m (my favorite sounds)\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
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
            echo '\033[32;1mDone.\033[0m\n'
            
            break;;
        [Nn]* ) echo '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''


# https://drive.google.com/file/d/1W-659_cJLsZtEeUr98mT8E-iGMz2Rdcd/view?usp=sharing jdk151
# https://drive.google.com/file/d/1JjCnalXi6901-WFUzzw2YMMw2J4-aI31/view?usp=sharing jre151

echo -n '\033[1mSpecial browser \033[33;1m "FireFox 51.0.1"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            fileid="1ZZ5QjQc3fQ8L1Ldgzq0QpPDM4slMx0Cv"
            filename="firefox-51.0.1.zip"
            curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
            curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
            unzip firefox-51.0.1.zip
            mv firefox .firefox51
            rm -R firefox-51.0.1.zip
            echo '\033[32;1mDone.\033[0m\n'
            break;;
        [Nn]* ) echo '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -n '\033[1mPackage\033[33;1m "google-drive-ocamlfuse"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -S google-drive-ocamlfuse-opam --noconfirm
            echo -en '\033[32;1mDone.\033[0m\n'
            mkdir ~/.drive@alejandro
            mkdir ~/.drive@senoraarina
            
            fileid="1bvlxchCP5ZNQ1WV-o1Qq9IAKDnLs_Vq1"
            filename="__ocamlgoogledrive.sh"
            curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
            curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
            chmod +x __ocamlgoogledrive.sh
            sudo mv __ocamlgoogledrive.sh /usr/bin
            cd .config/autostart-scripts/ && ln -s /usr/bin/__ocamlgoogledrive.sh
            cd 
            
            echo '\033[32;1mTuned.\033[0m\n'
            break;;
        [Nn]* ) echo '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''



echo -n '\033[1mPackage\033[33;1m "zsh"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay zsh zsh-autosuggestions zsh-syntax-highlighting --noconfirm
            curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh ;
            sudo chsh -s /usr/bin/zsh;
            echo '\033[32;1mDone.\033[0m\n'
            break;;
        [Nn]* ) echo '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''


# https://www.linuxuprising.com/2019/04/download-master-pdf-editor-4-for-linux.html
echo -n '\033[1mPackage\033[33;1m "master-pdf-editor (free)"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -S masterpdfeditor-free --noconfirm
            echo '\033[32;1mVersion 4.3.89 installed.\033[0m\n'
            break;;
        [Nn]* ) echo '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

# https://github.com/jimevins/glabels-qt/
echo -n '\033[1mPackage\033[33;1m "glabels-qt (beta)"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -S glabels-qt-git --noconfirm
            echo '\033[32;1mDone.\033[0m\n'
            break;;
        [Nn]* ) echo '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -n '\033[1mDo you want to remove this script\033[33;1m ("archforme.sh")\033[0m\033[1m\033[36;1m? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            rm -f debforme.sh
            echo '\033[32;1mDone.\033[0m\n'
            break;;
        [Nn]* ) echo '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''
echo ''

echo '\033[32;1m*******************************************************\033[0m\n'
echo '\033[32;1m***                   GAME OVER!!!                  ***\033[0m\n'
echo '\033[32;1m***                                                 ***\033[0m\n'
echo '\033[32;1m***                  just now make                  ***\033[0m\n'
echo '\033[32;1m***                      \033[42;33;1;5mreboot\033[0m                     \033[32;1m***\033[0m\n'
echo '\033[32;1m***                   Good luck! :-)                ***\033[0m\n'
echo '\033[32;1m*******************************************************\033[0m\n'
echo ''
echo ''

zsh


