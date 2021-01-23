#!/bin/bash

clear

echo "-> FOR - Opção 1, listagem"
echo ""

for i in {10,11,12};
    do
        echo "Apresentando o valor de 'i':"
        echo "  $i"
    done
        echo "'i' = 12...Fim do laço"

echo ""
echo "-> FOR - Opção 2, contagem"
echo ""

for i in {3..1};
    do
        echo "$i"
    done
    echo "Fim!"

for i in {1..3};
    do
        echo "$i"
    done
    echo "Fim!"

echo ""
echo "-> FOR + SEQ - Com intervalo"
echo ""

for i in $(seq 0 2 10);
    do
        echo "$i"
    done
        echo "Fim!"

echo ""
echo "-> FOR + SEQ - Sem intervalo"
echo ""

for i in $(seq 0 5);
    do
        echo "$i"
    done
        echo "Fim!"