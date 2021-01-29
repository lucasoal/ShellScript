#!/bin/bash

clear

# primeiros comandos
echo -e "\033[1;31m* Buscando pacotes para atualizações *\e[0m" && sleep 1;
    sudo apt-get update && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

echo -e "\033[1;31m* Atualizando pacotes *\e[0m" && sleep 1;
    sudo apt-get upgrade && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

echo -e "\033[1;31m* Removendo programas desnecessarios *\e[0m" && sleep 1;
    sudo apt-get remove celluloid hexchat simple-scan pix rhythmbox mint-meta-cinnamon mint-meta-core mintwelcome 
    && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

echo -e "\033[1;31m* Liberando espaço *\e[0m" && sleep 1;
    sudo apt-get clean;
    sudo apt-get autoremove;
    sudo apt-get autoclean  && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

echo -e "\033[1;31m* Instalando ferramentas *\e[0m" && sleep 1;
    sudo apt-get install vlc codeblocks kazam plank  && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

# git
echo -e "\033[1;31m* Baixando Git *\e[0m" && sleep 1;
    sudo apt-get install git
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
echo -e "\033[1;31m* Instalando Git *\e[0m" && sleep 1;
    sudo apt-get install git && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

# build essentials
echo -e "\033[1;31m* Instalando Build Essential *\e[0m" && sleep 1;
    sudo apt-get install build-essential && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
    
# oh my zsh
echo -e "\033[1;31m* Instalando ZSH *\e[0m" && sleep 1;
    sudo apt install zsh && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
    && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

# webapp
echo -e "\033[1;31m* Baixando WebApp *\e[0m" && sleep 1;
    sudo apt-get install webapp-manager && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

# suporte para pacotes snap
echo -e "\033[1;31m* Baixando suporte para Snap [snapd] *\e[0m" && sleep 1;
    sudo rm /etc/apt/preferences.d/nosnap.pref && sudo apt install snapd && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

# visual studio code
echo -e "\033[1;31m* Baixando snap Visual Studio Code *\e[0m" && sleep 1;
    firefox https://code.visualstudio.com/docs/?dv=linux64_deb;
echo -e "\033[1;31m* Instalar VS Code? *\e[0m" && sleep 1;
    sudo dpkg -i home/lucas/Downloads/code_1.52.1-1608136922_amd64.deb
echo -e "\033[1;31m* Removendo VS Code [.deb] * \033[30;1;31m" && sleep 1;
    sudo apt-get rm /hom/lucas/Downloads/code_1.52.1-1608136922_amd64.deb && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

# winehq
echo -e "\033[1;31m* Baixando WineHQ *\e[0m" && sleep 1;
echo -e "\033[1;31m* Habilitando arquitetura i386(32x) *\e[0m" && sleep 1;
    sudo dpkg --add-architecture i386;
echo -e "\033[1;31m* Obtendo wine key *\e[0m" && sleep 1;
    wget -nc https://dl.winehq.org/wine-builds/winehq.key
    sudo apt-key add winehq.key;
echo -e "\033[1;31m* Adicionando repositorio *\e[0m" && sleep 1;
    sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main';
    sudo apt update;
echo -e "\033[1;31m* Instalando WineHQ Stable *\e[0m" && sleep 1;
    sudo apt install --install-recommends winehq-stable; && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

# wps office
echo -e "\033[1;31m* Instalando WPS Office *\e[0m" && sleep 1;
    sudo apt-get update;
    sudo snap install wps-office-all-lang-no-internet && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;