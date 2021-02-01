#!/bin/bash

clear

# instalando espeak
echo -e "\033[1;31m* Instalando Espeak *\e[0m" && sleep 1; sudo apt-get install espeak
echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

espeak "Espeak installation concluded";

# primeiros comandos
echo -e "\033[1;31m* Buscando pacotes para atualizações *\e[0m" && sleep 1;
    sudo apt-get update && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

echo -e "\033[1;31m* Atualizando pacotes *\e[0m" && sleep 1;
    sudo apt-get upgrade && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

echo -e "\033[1;31m* Removendo programas desnecessarios *\e[0m" && sleep 1;
    sudo apt-get remove celluloid hexchat simple-scan pix rhythmbox mint-meta-cinnamon mint-meta-core mintwelcome hypnotix thunderbird mint-meta-cinnamon mint-meta-core && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

echo -e "\033[1;31m* Liberando espaço *\e[0m" && sleep 1;
    sudo apt-get clean;
    sudo apt-get autoremove;
    sudo apt-get autoclean  && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

echo -e "\033[1;31m* Instalando ferramentas *\e[0m" && sleep 1;
    sudo apt-get install vlc codeblocks kazam plank  && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;

espeak "First commands concluded";

# git
echo -e "\033[1;31m* Baixando Git *\e[0m" && sleep 1;
    sudo apt-get install git
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
echo -e "\033[1;31m* Instalando Git *\e[0m" && sleep 1;
    sudo apt-get install git && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
espeak "Git installed";

# build essentials
echo -e "\033[1;31m* Instalando Build Essential *\e[0m" && sleep 1;
    sudo apt-get install build-essential && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
espeak "Build essentials installed";
    
# webapp
echo -e "\033[1;31m* Baixando WebApp *\e[0m" && sleep 1;
    sudo apt-get install webapp-manager && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
espeak "Web App installed"

# suporte para pacotes snap
echo -e "\033[1;31m* Baixando suporte para Snap [snapd] *\e[0m" && sleep 1;
    sudo rm /etc/apt/preferences.d/nosnap.pref && sudo apt install snapd && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
espeak "Snao support package installed"

# visual studio code
echo -e "\033[1;31m* Baixando snap Visual Studio Code *\e[0m" && sleep 1;
    firefox https://code.visualstudio.com/docs/?dv=linux64_deb && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
espeak "Visual Studio Code downloaded"

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
espeak "Wine HQ installed"

# wps office
echo -e "\033[1;31m* Instalando WPS Office *\e[0m" && sleep 1;
    sudo apt-get update;
    sudo snap install wps-office-all-lang-no-internet && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
espeak "WPS Office installed"

# limpando 
echo -e "\033[1;31m* Liberando espaço novamente*\e[0m" && sleep 1;
    sudo apt-get clean;
    sudo apt-get autoremove;
    sudo apt-get autoclean  && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
espeak "Cleaning concluded"; sleep 2;

# login no firefox
firefox https://accounts.firefox.com/?context=fx_desktop_v3&entrypoint=fxa_app_menu&action=email&service=sync; firefox gmail.comhttps://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin;

# oh my zsh
espeak "at least"; sleep 1; espeak "Installing Oh my zsh"
echo -e "\033[1;31m* Instalando ZSH *\e[0m" && sleep 1;
    sudo apt install zsh && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
    && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
espeak "Oh my zsh installed"
