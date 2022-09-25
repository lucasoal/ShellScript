#!/bin/bash

clear

echo    "Selecione uma opção"
echo    "1- Data e hora do sistema"
echo    "2- Dividir 2 numeros"
echo    "3- Exibir mensagem"
read opcao;



case $opcao in
    "1")
        data=$(uptime)
        echo "-> $data"
    ;;

    "2")
        echo "Digite o valor A"
        read valorA
        echo "Digite o valor b"
        read valorB

        resultado=$(($valorA/$valorB))
        echo "Resultado de [$valorA/$valorB] é $resultado"
    ;;

    "3")
        echo "Digite uma mensagem"
        read mensagem
        echo "Mensagem digitada : "$mensagem""
    ;;   
esac