#!/bin/bash

clear

echo "Compilador de script"
echo ""

echo "Digite o nome do arquivo a ser compilado"
read archiveToCompile

echo "Compilando"
    sleep 1.2
    chmod +x $archiveToCompile

echo "Compilado!!!"
echo ""
    ./$archiveToCompile 

echo ""
echo "Feito!!!"