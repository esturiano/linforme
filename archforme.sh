#!/bin/bash
# Обустройство arch-based свежеустановленной системы

clear
echo -en '\033[32;1m*******************************************************\033[0m\n'
echo -en '\033[32;1m*** ОБУСТРОЙСТВО УСТАНОВЛЕННОЙ ARCH-BASED СИСТЕМЫ.  ***\033[0m\n'
echo -en '\033[32;1m*** (используя скрипт, вы берете все риски на себя) ***\033[0m\n'
echo -en '\033[32;1m***                автор: esturiano                 ***\033[0m\n'
echo -en '\033[32;1m*******************************************************\033[0m\n'
echo ''
echo ''

echo -en '\033[1mОчень желательно установить пакет \033[33;1m"reflector"\033[0m \033[1mи выбрать оптимальные зеркала репозиториев. \033[36;1mДелаем? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            sudo pacman -S reflector --noconfirm;
            sudo reflector --verbose -l 50 -p https --sort rate --save /etc/pacman.d/mirrorlist;
            echo -e 'Готово.\n'
            break;;
        [Nn]* ) echo -en '\033[31;1m...пропущено.\033[0m\n'; break;;
        * ) echo -en '\033[1mПожалуйста, выберите \033[33;1;5m"y"\033[0m или \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mПакет \033[33;1m"yay"\033[0m \033[1m(обязательно должен быть установлен в системе). \033[36;1mУстановить его? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            sudo pacman -S go git --noconfirm;
            git clone https://aur.archlinux.org/yay.git;
            cd yay;
            makepkg -si --noconfirm;
            cd ..;
            rm -fR yay;
            echo -en '\033[32;1mУстановка завершена\033[0m\n';
            break;;
        [Nn]* ) echo -en '\033[31;1m...пропущено.\033[0m\n'; break;;
        * ) echo -en '\033[1mПожалуйста, выберите \033[33;1;5m"y"\033[0m или \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mМета-пакет \033[33;1m"plasma-desktop"\033[0m \033[1mи минимальный достаточный набор приложений. \033[36;1mУстановить? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            sudo pacman -S plasma-desktop dolphin sddm sddm-kcm konsole kate yakuake plasma-pa plasma-nm kdeconnect sshfs powerdevil kde-gtk-config breeze-gtk gnu-free-fonts ark --noconfirm;
            sudo systemctl enable sddm;
            echo -en '\033[32;1mУстановка завершена. Сервис запуска графической среды при загрузке системы активирован.\033[0m\n';
            break;;
        [Nn]* ) echo -en '\033[31;1m...пропущено.\033[0m\n'; break;;
        * ) echo -en '\033[1mПожалуйста, выберите \033[33;1;5m"y"\033[0m или \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mПоддержка печати \033[33;1m"cups"\033[0m \033[1m. \033[36;1mУстановить? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            sudo pacman -S cups cups-filters cups-pdf print-manager foomatic-db-engine foomatic-db-nonfree-ppds foomatic-db-nonfree foomatic-db foomatic-db-ppds  --noconfirm;
            echo -en '\033[32;1mУстановка завершена.\033[0m\n';
            sudo systemctl enable --now org.cups.cupsd.service;
            echo -en '\033[32;1mСлужба "org.cups.cupsd.service" запущена.\033[0m\n';
            break;;
        [Nn]* ) echo -en '\033[31;1m...пропущено.\033[0m\n'; break;;
        * ) echo -en '\033[1mПожалуйста, выберите \033[33;1;5m"y"\033[0m или \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mПакет\033[33;1m "JAVA 8 (jre8)"\033[0m\033[1m. \033[36;1mУстановить его? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -S jre8 --noconfirm;
            echo -en '\033[32;1mУстановка завершена\033[0m\n';
            echo 'Назначение JAVA8 по умолчанию...';
            sudo archlinux-java set java-8-jre/jre;
            echo -e 'Готово.\n';
            break;;
        [Nn]* ) echo -en '\033[31;1m...пропущено.\033[0m\n'; break;;
        * ) echo -en '\033[1mПожалуйста, выберите \033[33;1;5m"y"\033[0m или \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mПакет\033[33;1m "LibreOffice (fresh)"\033[0m\033[1m. \033[36;1mУстановить его? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -S libreoffice-fresh libreoffice-fresh-ru --noconfirm;
            echo -en '\033[32;1mУстановка завершена\033[0m\n';
            break;;
        [Nn]* ) echo -en '\033[31;1m...пропущено.\033[0m\n'; break;;
        * ) echo -en '\033[1mПожалуйста, выберите \033[33;1;5m"y"\033[0m или \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mПакет\033[33;1m "FireFox (стабильная версия)"\033[0m\033[1m. \033[36;1mУстановить его? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -S firefox firefox-i18n-ru --noconfirm;
            echo -en '\033[32;1mУстановка завершена\033[0m\n';
            break;;
        [Nn]* ) echo -en '\033[31;1m...пропущено.\033[0m\n'; break;;
        * ) echo -en '\033[1mПожалуйста, выберите \033[33;1;5m"y"\033[0m или \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mПакет\033[33;1m "Chromium (стабильная версия)"\033[0m\033[1m. \033[36;1mУстановить его? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -S chromium --noconfirm;
            echo -en '\033[32;1mУстановка завершена\033[0m\n';
            break;;
        [Nn]* ) echo -en '\033[31;1m...пропущено.\033[0m\n'; break;;
        * ) echo -en '\033[1mПожалуйста, выберите \033[33;1;5m"y"\033[0m или \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mПакет\033[33;1m "google-drive-ocamlfuse-opam"\033[0m\033[1m. \033[36;1mУстановить его? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -S google-drive-ocamlfuse-opam --noconfirm;
            echo -en '\033[32;1mУстановка завершена\033[0m\n';
            mkdir ~/.drive@alejandro;
            mkdir ~/.drive@senoraarina;
            wget senora.ru/__ocamlgoogledrive.sh && chmod +x __ocamlgoogledrive.sh && sudo mv __ocamlgoogledrive.sh /usr/bin;
            cd .config/autostart-scripts/ && ln -s /usr/bin/__ocamlgoogledrive.sh;
            cd ;
            echo -e 'Настройка произведена.\n';
            break;;
        [Nn]* ) echo -en '\033[31;1m...пропущено.\033[0m\n'; break;;
        * ) echo -en '\033[1mПожалуйста, выберите \033[33;1;5m"y"\033[0m или \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mПакеты\033[33;1m (дополнительные)\033[0m\033[1m. \033[36;1mУстановить их? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -S epson-inkjet-printer-escpr telegram-desktop qtwaw code masterpdfeditor-free teamviewer simplescreenrecorder gparted android-tools xsane zoom filezilla gimp kio-gdrive kde-servicemenus-rootactions aspell aspell-ru curl --noconfirm;
            echo -en '\033[32;1mУстановка дополнительных пакетов завершена\033[0m\n';
            break;;
        [Nn]* ) echo -en '\033[31;1m...пропущено.\033[0m\n'; break;;
        * ) echo -en '\033[1mПожалуйста, выберите \033[33;1;5m"y"\033[0m или \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''


echo -en '\033[1mПакет\033[33;1m "zsh"\033[0m\033[1m. \033[36;1mУстановить его? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -S zsh --noconfirm;
            curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh ;
            chsh -s /usr/bin/zsh;
            echo -en '\033[32;1mУстановка завершена\033[0m\n';
            break;;
        [Nn]* ) echo -en '\033[31;1m...пропущено.\033[0m\n'; break;;
        * ) echo -en '\033[1mПожалуйста, выберите \033[33;1;5m"y"\033[0m или \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mПакет\033[33;1m "glabels 4.0 beta"\033[0m\033[1m. \033[36;1mУстановить его? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -S glabels-qt-git --noconfirm;
            echo -en '\033[32;1mУстановка завершена\033[0m\n';
            break;;
        [Nn]* ) echo -en '\033[31;1m...пропущено.\033[0m\n'; break;;
        * ) echo -en '\033[1mПожалуйста, выберите \033[33;1;5m"y"\033[0m или \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''

echo -en '\033[1mПроприетарные драйвера\033[33;1m "nvidia 340xx"\033[0m\033[1m. \033[36;1mУстановить их? (y/n) \033[0m'
while true; do
    read yn
    case $yn in
        [Yy]* ) 
            yay -Sy nvidia-340xx-dkms nvidia-340xx-utils lib32-nvidia-340xx-utils opencl-nvidia-340xx lib32-opencl-nvidia-340xx --noconfirm;
            echo -en '\033[32;1mУстановка завершена\033[0m\n';
            echo 'Отключение заставки NVIDDIA при загрузке...';
            sudo nvidia-xconfig --no-logo;
            echo -e 'Готово.\n';
            break;;
        [Nn]* ) echo -en '\033[31;1m...пропущено.\033[0m\n'; break;;
        * ) echo -en '\033[1mПожалуйста, выберите \033[33;1;5m"y"\033[0m или \033[33;1;5m"n"\033[0m.';;
    esac
done
echo ''
echo ''

echo -en '\033[32;1m*******************************************************\033[0m\n'
echo -en '\033[32;1m***         ОБУСТРОЙСТВО СИСТЕМЫ ЗАВЕРШЕНО.         ***\033[0m\n'
echo -en '\033[32;1m***    В систему установлены необходимые пакеты     ***\033[0m\n'
echo -en '\033[32;1m***         и запущены необходимые службы.          ***\033[0m\n'
echo -en '\033[32;1m***                                                 ***\033[0m\n'
echo -en '\033[32;1m***      Чтобы все изменения вступили в силу,       ***\033[0m\n'
echo -en '\033[32;1m***               прямо сейчас лучше                ***\033[0m\n'
echo -en '\033[32;1m***            \033[42;33;1;5mперезагрузить компьютер.\033[0m             \033[32;1m***\033[0m\n'
echo -en '\033[32;1m***                     Удачи! :-)                  ***\033[0m\n'
echo -en '\033[32;1m*******************************************************\033[0m\n'
echo ''
echo ''

# Финиш
# Удаляем скрипт.
rm -f archforme.sh
