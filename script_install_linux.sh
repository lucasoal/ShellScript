#!/bin/bash

clear

# PERMITE O ARQUIVO ATUAL(%) A READ, WRITE AND EXECUTE
!chmod +rwx %

install()
{
    update
    upgrade

    unecessaryApplications
    tools
    git
    buildEssentials
    snap
    vsCode
    winehq
    clean
    reactSupport
    ohMyZsh
}

update(){
    echo -e "\033[1;31m* Buscando pacotes para atualizações *\e[0m" && sleep 1;
    sudo apt-get update && \
        echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
}

upgrade(){
    echo -e "\033[1;31m* Atualizando pacotes *\e[0m" && sleep 1;
    sudo apt-get upgrade && \
        echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
}

tools(){
    echo -e "\033[1;31m* Instalando ferramentas *\e[0m" && sleep 1;
    sudo apt-get install vlc codeblocks kazam plank  && \ 
        echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
}

unecessaryApplications(){
    echo -e "\033[1;31m* Removendo programas desnecessarios *\e[0m" && sleep 1;
    sudo apt-get remove celluloid hexchat simple-scan pix rhythmbox \ 
        mint-meta-cinnamon mint-meta-core mintwelcome hypnotix \
            thunderbird mint-meta-cinnamon mint-meta-core && \ 
                echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
}

git(){
    # git
    echo -e "\033[1;31m* Baixando Git *\e[0m" && sleep 1;
    sudo apt-get install git
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
    echo -e "\033[1;31m* Instalando Git *\e[0m" && sleep 1;
    sudo apt-get install git && \ 
         echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
}

buildEssentials(){
    # build essentials
    echo -e "\033[1;31m* Instalando Build Essential *\e[0m" && sleep 1;
    sudo apt-get install build-essential && \ 
         echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
}

snap(){
    # suporte para pacotes snap
    echo -e "\033[1;31m* Baixando suporte para Snap [snapd] *\e[0m" && sleep 1;
    sudo rm /etc/apt/preferences.d/nosnap.pref && \ 
         sudo apt install snapd && echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
}

vsCode(){
    # visual studio code
    echo -e "\033[1;31m* Baixando snap Visual Studio Code *\e[0m" && sleep 1;
    sudo snap install --classic code && \ 
         echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
}

wineHq(){
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
    sudo apt install --install-recommends winehq-stabl && \
         echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
}

clean(){
    # limpando 
    echo -e "\033[1;31m* Liberando espaço novamente*\e[0m" && sleep 1;
    sudo apt-get clean;
    sudo apt-get autoremove;
    sudo apt-get autoclean  && \ 
         echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
}

reactSupport(){    
    echo -e "\033[1;31m* Instalando Curl *\e[0m" && sleep 1;
    sudo apt-get install curl;

    echo -e "\033[1;31m* Instalando Node.js *\e[0m" && sleep 1;
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install -y nodejs;

    echo -e "\033[1;31m* Instalando Yarn *\e[0m" && sleep 1;
    sudo npm install --global yarn;

    echo -e "\033[1;31m* Versions " && sleep 1;
    echo -e "node " && node -v;
    echo -e "npm " && npm -v;
    echo -e "yarn " && yarn -v;
    echo -e "*\e[0m";

    echo -e "\033[1;31m* Instalando Java JDK *\e[0m" && sleep 1;
    sudo add-apt-repository ppa:openjdk-r/ppa;
    sudo apt-get update;
    sudo apt-get install openjdk-11-jdk;

    echo -e "java jdk verision " & java -version;

    echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
}

mySqlWorkbench(){
    echo -e "\033[1;31m* Instalando MySQL Workbench *\e[0m" && sleep 1;
    lsb_release -rs
    wget http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community_8.0.21-1ubuntu20.04_amd64.deb \
        -O mysql-workbench-community.deb
    sudo dpkg -i mysql-workbench-community.deb
    sudo apt-get -f install
    echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
}

ohMyZsh(){
    # oh my zsh
    echo -e "\033[1;31m* Instalando ZSH *\e[0m" && sleep 1;
    sudo apt install zsh && \ 
         sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
    
    # /home/userName:/bin/bash
    # /home/userName:/bin/zsh

    echo -e "\033[1;32m* Concluido *\e[0m" && sleep 1;
}

refuse(){
    echo -e "\033[1;31m *You aren't the root user! You can't install softwares.* \e[0m"
}   

# it verifies if the user is logged as root
# ${UID} User IDentifier. If the value is equal 0, is a root user
if [[ "${UID}" -eq 0 ]]; 
    then 
        install
    else
        refuse
fi