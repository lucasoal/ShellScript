#!/bin/bash

clear

if [ $# -lt 1 ]
    then
        echo -e "\nPrecisa inserir pelo menos '1' argumento"
        exit 1
fi
    echo "Número de argumentos passados = $#"

i=0
for  argumento in $*
    do
        i=$(($i+1))
        echo "Argumento nº$i = $argumento"
    done
        echo -e "\nFim!"

