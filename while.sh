#!/bin/bash

clear

echo "-> WHILE"
echo ""

echo "Digite qualquer valor [-1 para sair]"
read valor

while [ $valor != "-1" ];
    do
        echo "Você digitou $valor"
    read valor;
done
    echo "Saindo..."
    sleep 1.5;

echo ""
echo "-> WHILE - Contador"
echo ""

echo "Digite um valor para a contagem:"
read valor
sleep 1

i=0

while [ $i -le  $valor ];
    do
        echo "$i"
        ((i=$i+1))
        sleep 1;
    done
        echo "Fim!"