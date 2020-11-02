#!/bin/bash
# Обустройство arch-based свежеустановленной системы

clear
echo -en '\033[32;1m*******************************************************\033[0m\n'
echo -en '\033[32;1m***        TUNING MY NEW DEBIAN-BASED SYSTEM        ***\033[0m\n'
echo -en '\033[32;1m***                (at your own risk)               ***\033[0m\n'
echo -en '\033[32;1m***                    esturiano                    ***\033[0m\n'
echo -en '\033[32;1m*******************************************************\033[0m\n'
echo ''
echo ''

echo -en '\033[1mInstalling important packages and make some settings\033[33;1m (for correct script working)\033[0m\033[1m. \033[36;1mDo it? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            sudo apt install -y curl wget yakuake unzip pipenv
            echo -en '\033[32;1mDone.\033[0m\n'
            echo -en '\033[32;1mMaking own audio library...\033[0m\n'
            fileid="1dxSykLylPIfGwHeOtuoaY9gYXPmo9zXi"
            filename="mysounds.zip"
            curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
            curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
            unzip mysounds.zip
            rm mysounds.zip
            sudo mv mysounds /usr/share/sounds
            echo -en '\033[32;1mDone.\033[0m\n'
            
            echo -en '\033[32;1mAdding MenuRootActions to the Dolphin...\033[0m\n'
            fileid="1jNiMYW3lxBYuUfeBt4z-_svhCIG1f3gb"
            filename="rootactions-servicemenu.pl"
            curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
            curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
            sudo mv rootactions-servicemenu.pl /usr/bin
            echo -en '\033[32;1mDone.\033[0m\n'
            
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''


echo -en '\033[1mPackage\033[33;1m "JAVA 8 (jre8)"\033[0m\033[1m. \033[36;1mInstalling? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            fileid="1bx-rgkGe9avzcl98MgqAOeY1X_pvvVfh"
            filename="jre-8u271-linux-x64.tar.gz"
            curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
            curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
            tar -xf jre-8u271-linux-x64.tar.gz
            sudo mv jre1.8.0_271 /usr/lib/jvm/
            rm -R jre-8u271-linux-x64.tar.gz
            sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jre1.8.0_271/bin/java 1
            echo -e 'Now jre8 set to default...\n'
            sudo update-alternatives --config java
            echo -en '\033[32;1mDone.\033[0m\n'
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mSpecial browser \033[33;1m "FireFox 51.0.1"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
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
            echo -en '\033[32;1mDone.\033[0m\n'
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mPackage\033[33;1m "google-drive-ocamlfuse"\033[0m\033[1m. \033[36;1mInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            sudo apt install -y opam ocaml make fuse camlp4-extra build-essential pkg-config ssh libcurl4-gnutls-dev libfuse-dev libgmp-dev libsqlite3-dev zlib1g-dev  
            opam init
            eval $(opam env)
            opam update
            opam install depext
            opam depext google-drive-ocamlfuse
            opam install google-drive-ocamlfuse
            sudo install ~/.opam/default/bin/google-drive-ocamlfuse /usr/local/bin/
            echo -en '\033[32;1mDone.\033[0m\n'
            echo -en '\033[32;1mTuning...\033[0m\n'
            mkdir ~/.drive@alejandro
            mkdir ~/.drive@senoraarina
            fileid="1bvlxchCP5ZNQ1WV-o1Qq9IAKDnLs_Vq1"
            filename="__ocamlgoogledrive.sh"
            curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
            curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
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
            sudo apt install -y zsh
            curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh ;
            chsh -s /usr/bin/zsh;
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
            wget http://code-industry.net/public/master-pdf-editor-4.3.89_qt5.amd64.tar.gz
            tar -xf master-pdf-editor-4.3.89_qt5.amd64.tar.gz
            sudo mv master-pdf-editor-4 /opt
            sudo install /opt/master-pdf-editor-4/masterpdfeditor4 /usr/bin
            rm -R master-pdf-editor-4.3.89_qt5.amd64.tar.gz
            echo -en '\033[32;1mVersion 4.3.89. Done.\033[0m\n'
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
            sudo apt install -y qt5-default pyqt5-dev-tools qttools5-dev build-essential
            wget https://github.com/jimevins/glabels-qt/archive/glabels-3.99-master561.tar.gz
            tar -xf glabels-3.99-master561.tar.gz
            cd glabels-qt-glabels-3.99-master561
            mkdir build
            cd build
            cmake ..
            make
            echo -en '\033[33;1mBe patient!\033[0m\n'
            sudo make install
            cd
            rm -R glabels-qt-glabels-3.99-master561
            echo -en '\033[32;1mDone.\033[0m\n'
            break;;
        [Nn]* ) echo -en '\033[31;1m...skipped.\033[0m\n'; break;;
        * ) echo -en '\033[1mPlease, type \033[33;1;5m"y"\033[0m or \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mDrivers\033[33;1m "nvidia 340xx-dkms"\033[0m\033[1m. \033[36;1mУInstall? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
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
echo -en '\033[32;1m***                                                 ***\033[0m\n'
echo -en '\033[32;1m***                                                 ***\033[0m\n'
echo -en '\033[32;1m***                                                 ***\033[0m\n'
echo -en '\033[32;1m***                                                 ***\033[0m\n'
echo -en '\033[32;1m***                  just now make                  ***\033[0m\n'
echo -en '\033[32;1m***                    \033[42;33;1;5mreboot\033[0m             \033[32;1m***\033[0m\n'
echo -en '\033[32;1m***                   Good luck! :-)                ***\033[0m\n'
echo -en '\033[32;1m*******************************************************\033[0m\n'
echo ''
echo ''




# Финиш
# Удаляем скрипт.
rm -f debforme.sh
