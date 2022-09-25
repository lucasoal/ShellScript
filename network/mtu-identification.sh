#!/bin/bash

# ################################## #
# PUC MINAS - POÇOS DE CALDAS        #
# CURSO DE CIÊNCIA DA COMPUTAÇÃO     #
# DISCIPLINA DE LABORATÓRIO DE REDES #
#                                    #
# LUCAS OMAR ANDRADE LEAL            #
# 22 DE SETEMBRO DE 2022             #
# ################################## #

# Orientações de execução apresentadas durante as conferências.
# . Obter o valor de MTU para uma interface de rede específica (informada no prompt), de forma dinâmica.
# . Elaborar uma heurística de obtenção do valor de MTU para reduzir o número de repetições (laço), considerando o intervalo de dados entre 0 e 65467.
# . Adaptar o comando ping -nc 1 -M do -s NUM_BYTES -I IP_ORIGEM IP_DESTINO como escopo de um laço de repetição.
# . O usuário deve informar o IP_ORIGEM e o IP_DESTINO como entrada do shell script (argumentos de entrada).

# ALGUMAS DEFINIÇÕES DE CORES PARA OUTPUT NO TERMINAL
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
RCOR='\e[0m'
IP_ORIGEM=$(ifconfig | grep 'inet ' | tail -1 | awk '{print $2}')
IP_DESTINO=157.240.226.35 # facebook

echo -e "${GREEN}Lab Redes - Identificação MTU | Lucas Omar Andrade Leal${RCOR}"
echo -e "\nDigite o IPV4 que deseja identificar o MTU [Ex: 192.168.2.6]"
echo -e "[ IPV4 Origem  ] .: ${IP_ORIGEM}"
echo -e "[ IPV4 Destino ] .: ${IP_DESTINO} [definido para teste - pode habilitar a requisicao no codigo]"
# read -p "[ IPV4 Destino ] .: " IP_DESTINO
# packets=$(ping -nc 3 -M do -s 406 -I 192.168.1.2 157.240.226.35 | grep 'packets' | head -1 | awk '{print $4}')

create_array() {
    declare -n array=$1
    min=$2 && max=$3

    echo -e "[ ARRAY ] \t Criando array de $2 a $3 posicoes"

    for ((i = $min; i <= $max; i++)); do
        # clear
        array[$i]=$(($i))
        # echo ${array[i]} && sleep $4 && echo -ne
    done
    echo -e "[ ARRAY ] \t Finalizado"
}

binary_search() {
    clear
    echo -e "${GREEN}Lab Redes - Identificação MTU | Lucas Omar Andrade Leal${RCOR}"
    echo
    echo -e "${GREEN}Min \t Max${RCOR}"
    echo -e "$1 \t $2"

    # create array 0 65467
    # ls $1 > /dev/null #oculta warnings

    #limpa buffers e cache
    sync; echo 1 > /proc/sys/vm/drop_caches
    sync; echo 2 > /proc/sys/vm/drop_caches
    sync; echo 3 > /proc/sys/vm/drop_caches 


    if [ $1 -lt 0 ] || [ $2 -gt 127992 ]; then
        echo -e "\n${RED}[ ERR ] \t Falha de requisicao!\n Tente novamente ou altere o range de verificacao${RCOR}"
        exit
    else
        # echo
        # echo 'minlim' $1
        packets1=$(ping -nc 1 -M do -s $1 -I 192.168.1.2 157.240.226.35 | grep 'packets' | tail -1 | awk '{print $6}')
        # echo '>>'$packets1
        # echo 'maxlim' $2
        packets2=$(ping -nc 1 -M do -s $2 -I 192.168.1.2 157.240.226.35 | grep 'packets' | tail -1 | awk '{print $6}')
        # echo '>>'$packets2

        if [ "$packets1" == "0%" ] && [ "$packets2" != "0%" ]; then
            minlim=$1
            maxlim=$2
            result=$(( ($1+$2)/2 ))

            rest=$(( ($1+$2)%2 ))
            if [ $rest -gt 0 ]; then
                result=$(($result+1))          
            fi
            mtu=$(($2-$1))
            if [ $mtu == 1 ]; then
                result=$(($1+28))
                echo -e "\n${BLUE}[ FINISHED ]"
                echo -e "${GREEN}O valor do MTU eh:${BLUE} $1"
                echo -e "${GREEN}Considerando pacotes UDP e TCP (+28):${BLUE} $result"
                exit
            fi
        
            binary_search $minlim $result
        
        elif [ "$packets1" != "0%" ] && [ "$packets2" == "0%" ]; then
            aux=$maxlim
            result=$(( ($aux+$minlim)/2 ))
            minlim=$aux
          
            binary_search $minlim $result
            
        elif [ "$packets1" == "0%" ] && [ "$packets2" == "0%" ]; then
            mtu=$(($2-$1))
            if [ $mtu == 0 ]; then
                result=$(($1+28))
                echo -e "\n${BLUE}[ FINISHED ]"
                echo -e "${GREEN}O valor do MTU eh: $1"
                echo -e "${GREEN}Considerando pacotes UDP e TCP:${BLUE} $result"
                exit
            fi
            binary_search $2 $maxlim
        
        elif [ "$packets1" != "0%" ] && [ "$packets2" != "0%" ]; then
            echo -e "${RED}O MTU nao esta presente neste range apresentado"
            exit
        fi
    fi
}

left=0
right=65467
flag=0 # evita de criar o array a cada recursividade

binary_search $left $right $flag
