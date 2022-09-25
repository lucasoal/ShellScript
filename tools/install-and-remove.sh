#!/bin/bash

clear

# PERMITE O ARQUIVO ATUAL(%) A READ, WRITE AND EXECUTE
# !chmod +rwx %

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
    ohMyZsh
}

update(){
    echo -e "\033[1;31m* Buscando pacotes para atualizações *\e[0m";
    sudo apt-get update -y && -e "\033[1;32m* Concluido *\e[0m";
}

upgrade(){
    echo -e "\033[1;31m* Atualizando pacotes *\e[0m";
    sudo apt-get upgrade -y && echo -e "\033[1;32m* Concluido *\e[0m";
}

tools(){
    echo -e "\033[1;31m* Instalando ferramentas *\e[0m";
    sudo apt-get install vlc codeblocks kazam plank -y && echo -e "\033[1;32m* Concluido *\e[0m";
}

unecessaryApplications(){
    echo -e "\033[1;31m* Removendo programas desnecessarios *\e[0m";
    sudo apt-get remove celluloid hexchat simple-scan pix rhythmbox mint-meta-cinnamon mint-meta-core mintwelcome hypnotix thunderbird mint-meta-cinnamon mint-meta-core -y && echo -e "\033[1;32m* Concluido *\e[0m";
}

git(){
    # git
    echo -e "\033[1;31m* Baixando Git *\e[0m";
    sudo apt-get install git
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
    echo -e "\033[1;31m* Instalando Git *\e[0m";
    sudo apt-get install git -y && echo -e "\033[1;32m* Concluido *\e[0m";
}

buildEssentials(){
    # build essentials
    echo -e "\033[1;31m* Instalando Build Essential *\e[0m";
    sudo apt-get install build-essential -y && echo -e "\033[1;32m* Concluido *\e[0m";
}

snap(){
    # suporte para pacotes snap
    echo -e "\033[1;31m* Baixando suporte para Snap [snapd] *\e[0m";
    sudo rm /etc/apt/preferences.d/nosnap.pref -y && sudo apt install snapd -y && echo -e "\033[1;32m* Concluido *\e[0m";
}

vsCode(){
    # visual studio code
    echo -e "\033[1;31m* Baixando snap Visual Studio Code *\e[0m";
    sudo apt-get install wget gpg -y
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg -y
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' -y
    rm -f packages.microsoft.gpg -y && echo -e "\033[1;32m* Concluido *\e[0m";
    sudo apt install apt-transport-https -y
    sudo apt update -y
    sudo apt install code -y # or code-insiders
}

wineHq(){
    # winehq
    echo -e "\033[1;31m* Baixando WineHQ *\e[0m";
    echo -e "\033[1;31m* Habilitando arquitetura i386(32x) *\e[0m";
    sudo dpkg --add-architecture i386;
    echo -e "\033[1;31m* Obtendo wine key *\e[0m";
    wget -nc https://dl.winehq.org/wine-builds/winehq.key
    sudo apt-key add winehq.key;
    echo -e "\033[1;31m* Adicionando repositorio *\e[0m";
    sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main';
    sudo apt update;
    echo -e "\033[1;31m* Instalando WineHQ Stable *\e[0m";
    sudo apt install --install-recommends winehq-stabl -y && echo -e "\033[1;32m* Concluido *\e[0m";
}

clean(){
    # limpando 
    echo -e "\033[1;31m* Liberando espaço novamente*\e[0m";
    sudo apt-get clean;
    sudo apt-get autoremove;
    sudo apt-get autoclean  -y && echo -e "\033[1;32m* Concluido *\e[0m";
}

reactSupport(){    
    echo -e "\033[1;31m* Instalando Curl *\e[0m";
    sudo apt-get install curl;

    echo -e "\033[1;31m* Instalando Node.js *\e[0m";
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install -y nodejs;

    echo -e "\033[1;31m* Instalando Yarn *\e[0m";
    sudo npm install --global yarn;

    echo -e "\033[1;31m* Versions ";
    echo -e "node " -y && node -v;
    echo -e "npm " -y && npm -v;
    echo -e "yarn " -y && yarn -v;
    echo -e "*\e[0m";

    echo -e "\033[1;31m* Instalando Java JDK *\e[0m";
    sudo add-apt-repository ppa:openjdk-r/ppa;
    sudo apt-get update;
    sudo apt-get install openjdk-11-jdk;

    echo -e "java jdk verision " & java -version;

    echo -e "\033[1;32m* Concluido *\e[0m";
}

mySqlWorkbench(){
    echo -e "\033[1;31m* Instalando MySQL Workbench *\e[0m";
    lsb_release -rs
    wget http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community_8.0.21-1ubuntu20.04_amd64.deb -O mysql-workbench-community.deb
    sudo dpkg -i mysql-workbench-community.deb
    sudo apt-get -f install
    echo -e "\033[1;32m* Concluido *\e[0m";
}

ohMyZsh(){
    # oh my zsh
    echo -e "\033[1;31m* Instalando ZSH *\e[0m";
    sudo apt install zsh -y;
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -y;
    # /home/userName:/bin/bash
    # /home/userName:/bin/zsh
    echo -e "\033[1;32m* Concluido *\e[0m";
}

refuse(){
    echo -e "\033[1;31m *You aren't the root user! You can't install softwares.* \e[0m"
}   


{ #try
    install
} || { #catch
    refuse
}


# it verifies if the user is logged as root
# ${UID} User IDentifier. If the value is equal 0, is a root user
#if [[ "${UID}" -eq 0 ]]; 
#    then 
#        install
#    else
#        refuse
#fi

