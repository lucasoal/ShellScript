#!/bin/bash

# ################################## # 
# PUC MINAS - POÇOS DE CALDAS        #
# CURSO DE CIÊNCIA DA COMPUTAÇÃO     #
# DISCIPLINA DE LABORATÓRIO DE REDES #
#                                    #
# LUCAS OMAR ANDRADE LEAL            #
# 10 DE SETEMBRO DE 2022             #
# ################################## #

# . Obter o endere�o l�gico (IP) local com aux�lio do comando ifconfig
# . Obter as informa��es auxiliares MASCARA e BRADCAST
# . Calcular o endere�o de net (NET ID)
# . Determinar o intervalo do dom�nio de BRADCAST (NetID ... BradCast)
# . Elaborar os la�os necess�rios para percorrer todos os hosts da net local
# . Apresentar os end. l�gicos e seus endere�os de hardware  em formato de tabela (duas colunas)

# ALGUMAS DEFINIÇÕES DE CORES PARA OUTPUT NO TERMINAL
red='\033[1;31m'
green='\033[1;32m'
rcor='\e[0m'

clear

echo -e "${green}Lab Redes - Mapermento ARP | Lucas Omar Andrade Leal${rcor}\n"

# SELEÇÃO DOS DADOS EM CAMPOS ESPECÍFICOS DO COMANDO ifconfig
# DEFINIÇÃO DO IP, NETMASK E BROADCAST
ip=$(ifconfig | grep 'inet ' | tail -1 |  awk '{print $2}')
mask=$(ifconfig | grep netmask | tail -1 | awk '{OFS="\t"; print $4}')
broadcast=$(ifconfig | grep broadcast | tail -1 | awk '{OFS="\t"; print $6}')

# CALCULO DO INTERVALO 
INPUT_BASE=10 #DECIMAL
OUTPUT_BASE=2 #BINARIO

ipA=$(ifconfig | grep broadcast | tail -1 | awk $'{print $6}' | cut -d '.' -f '1')
ipB=$(ifconfig | grep broadcast | tail -1 | awk $'{print $6}' | cut -d '.' -f '2')
ipC=$(ifconfig | grep broadcast | tail -1 | awk $'{print $6}' | cut -d '.' -f '3')
ipD='0'
ipABin=$(printf "%8b\n" $(bc <<< "ibase=$INPUT_BASE; obase=$OUTPUT_BASE; $ipA") | sed 's^ ^0^g')
ipBBin=$(printf "%8b\n" $(bc <<< "ibase=$INPUT_BASE; obase=$OUTPUT_BASE; $ipB") | sed 's^ ^0^g')
ipCBin=$(printf "%8b\n" $(bc <<< "ibase=$INPUT_BASE; obase=$OUTPUT_BASE; $ipC") | sed 's^ ^0^g' )
ipDBin=$(printf "%8b\n" $(bc <<< "ibase=$INPUT_BASE; obase=$OUTPUT_BASE; $ipD") | sed 's^ ^0^g')

#--

maskA=$(ifconfig | grep netmask | tail -1 | awk '{print $4}'| cut -d '.' -f '1')
maskB=$(ifconfig | grep netmask | tail -1 | awk '{print $4}'| cut -d '.' -f '2')
maskC=$(ifconfig | grep netmask | tail -1 | awk '{print $4}'| cut -d '.' -f '3')
maskD=$(ifconfig | grep netmask | tail -1 | awk '{print $4}'| cut -d '.' -f '4')
maskABin=$(printf "%8b\n" $(bc <<< "ibase=$INPUT_BASE; obase=$OUTPUT_BASE; $maskA") | sed 's^ ^0^g')
maskBBin=$(printf "%8b\n" $(bc <<< "ibase=$INPUT_BASE; obase=$OUTPUT_BASE; $maskB") | sed 's^ ^0^g')
maskCBin=$(printf "%8b\n" $(bc <<< "ibase=$INPUT_BASE; obase=$OUTPUT_BASE; $maskC") | sed 's^ ^0^g')
maskDBin=$(printf "%8b\n" $(bc <<< "ibase=$INPUT_BASE; obase=$OUTPUT_BASE; $maskD") | sed 's^ ^0^g')

netIdA=$((maskA&ipA))
netIdB=$((maskB&ipB))
netIdC=$((maskC&ipC))
netIdD=$((maskD&ipD))

net=$(echo "$netIdA.$netIdB.$netIdC")

netIdABin=$(printf "%8b\n" $(bc <<< "ibase=$INPUT_BASE; obase=$OUTPUT_BASE; $netIdA") | sed 's^ ^0^g')
netIdBBin=$(printf "%8b\n" $(bc <<< "ibase=$INPUT_BASE; obase=$OUTPUT_BASE; $netIdB") | sed 's^ ^0^g')
netIdCBin=$(printf "%8b\n" $(bc <<< "ibase=$INPUT_BASE; obase=$OUTPUT_BASE; $netIdC") | sed 's^ ^0^g')
netIdDBin=$(printf "%8b\n" $(bc <<< "ibase=$INPUT_BASE; obase=$OUTPUT_BASE; $netIdD") | sed 's^ ^0^g')

# APRESENTAÇÃO DE DADOS
echo -e "IP   Dec \t ${ip}"
echo -e "IP   Bin \t ${ipABin}.${ipBBin}.${ipCBin}.${ipDBin}"
echo -e "Mask Dec \t ${mask}"
echo -e "Mask Bin \t ${maskABin}.${maskBBin}.${maskCBin}.${maskDBin}"
echo -e "Net  Dec \t ${net}"
echo -e "Net  Bin \t ${netIdABin}.${netIdBBin}.${netIdCBin}.${netIdDBin}"
echo
echo -e "${green}IP \t\t NetMask \t Broadcast \t Net \t\t Intervalo${rcor}"
echo -e "${ip} \t ${mask} \t ${broadcast} \t ${net} \t ${intervalo}\n"

# INICIO DE MAPEAMENTO COM LAÇO FOR 
echo -e "\nIniciando mapeamento de hosts na net"
read -p "Deseja continuar? [Y/n] " option
option=${option,,}

# VERIFICAÇÃO DE OPÇÃO DO USUÁRIO
while [ $option != "y" ] && [ $option != "n" ]; do
    echo -e "\n${red}[Err!]${rcor}\nOpcao nao listada\nDeseja, ou nao, continuar a operacao de mapeamento?"
    read -p "Digite Y para SIM e N para NAO [Y/n] " option
    option=${option,,} # TO LOWER PARA O CARACTERE QUE A PESSOA COLOCAR
done

intervalo=255

if [ "$option" == "y" ]; then
    for (( c=0; c <= $intervalo; c++ )) do
        macNet=$(arp -a ${net}.${c} | awk '{print $4}')

        if [ -z "$macNet" ]; then
            macNet="${red}<HWaddress not found>${rcor}"
        fi
        echo -e "${green}${net}.${c} ${rcor}: ${macNet}"
        #ping -c 1 ${net}.${c} | grep 'packets' | head -1
    done
fi


