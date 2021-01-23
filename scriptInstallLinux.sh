#!/bin/bash

clear

# primeiros comandos
echo "Buscando pacotes para atualizações"
    sudo apt update;
echo "Atualizando pacotes"
    sudo apt upgrade;
echo "Removendo programas desnecessarios"
    sudo apt remove --purge libreoffice celluloid hexchat simple-scan pix rhythmbox;
echo "Liberando espaço"
    sudo apt clean;
    sudo apt autoremove;
    sudo apt autoclean;
echo "Instalando ferramentas"
    sudo apt install vlc gimp codeblocks audacity kdenlive kazam blender plank sublime;

# google chrome
echo "Baixando Google Chrome Stable"
    sudo gedit /etc/apt/sources.list;
    deb http://dl.google.com/linux/deb/ stable main;
    sudo apt-get update;
echo "Insalando Google Chrome Stable"
    sudo apt-get install google-chrome-stable;

# visual studio code
echo "Baixando snap Visual Studio Code"
    sudo snap install code --classic;
    sudo snap refresh code;

# winehq
echo "Habilitando arquitetura i386(32x)"
    sudo dpkg --add-architecture i386;
echo "Obtendo wine key"
    wget -nc https://dl.winehq.org/wine-builds/winehq.key
    sudo apt-key add winehq.key;
echo "Adicionando repositorio"
    sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main';
    sudo apt update;
    sudo apt install --install-recommends winehq-stable;

# wps office
echo "Instalando WPS Office"
    sudo apt-get update;
    sudo apt-get install snapd;
    sudo snap install wps-office-all-lang-no-internet;