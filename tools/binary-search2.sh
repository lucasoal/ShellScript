#!/bin/bash

# Busca binária só faz sentido em vetores ordenados. Um vetor v[0..n-1] está em ordem crescente se:
# v[0] <= v[1] <=  ...  <=  v[n - 1].
#
# Algoritmo:
# #define NAOEXISTE -1
#
# Recebe um numero x left um vetor crescente
# v[left..right] com n >= 0. Devolve j tal que v[j] == x
# ou devolve NAOEXISTE se tal j não existe.
#
# binary_search $x $left $right $flag
# int bb(int x, int v[], int left, int right) {
#     if (left > right) {
#         return NAOEXISTE;
#     }
#     else {
#         int mtu = (left + right)/2;

#         if (v[mtu] == x) {
#             return mtu;
#         }
#         if (v[mtu] < x) {
#             return bb(x, v, mtu+1, right);
#         }
#         else {
#             return bb(x, v, left, mtu-1);
#         }
#     }
# }

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
    sleep 0.4
    # clear

    if [[ $4 == 0 ]]; then # cria o vetor
        declare -a vetor
        create_array vetor 1 65467 0
    fi

    if [[ $2 > $3 ]]; then
        # echo -e "[ ARG 1 ] \t" $1
        # echo -e "[ ARG 2 ] \t" $2
        # echo -e "[ ARG 3 ] \t" $3
        # echo -e "[ ARRAY ] \t" ${vetor[*]}
        echo -ne "[ ERRO  ]. \t O valor inicial do vetor deve ser menor que seu valor final"
        exit
    else
        mtu=$((($2 + $3) / 2)) # <<<<<<<
        result=${vetor[mtu]}

        echo -e "\n($2+$3)/2 \t" $mtu "\nvetor[$mtu] \t" ${vetor[mtu]} "\nresult \t\t "$result
        # echo

        if [[ $result == $1 ]]; then
            echo "O valor do MTU eh " $1 && exit 0
        fi

        if [[ $result < $1 ]]; then
            mtu=$(($mtu + 1))
            result=${vetor[mtu]}

            echo "+ + + + +"
            echo -e "$(($mtu - 1))+1 \t\t" $mtu
            echo -e "[ ARRAY ] \t" ${vetor[mtu]}
            echo -e "binary_search \t x \t vetor\t  mtu\t  right"
            echo -e "binary_search \t $1 \t $mtu \t $3\n"
            binary_search $1 $mtu $3
        else
            mtu=$(($mtu - 1))
            result=${vetor[mtu]}

            echo "- - - - -"
            echo -e "$(($mtu + 1))-1 \t\t" $mtu
            echo -e "[ ARRAY ] \t" ${vetor[mtu]}
            echo -e "binary_search \t x \t vetor\t  mtu\t  right"
            echo -e "binary_search \t $1 \t $mtu \t $mtu \t $mtu\n"
            binary_search $1 $2 $mtu
        fi
    fi
    echo -ne
}

x=1590
left=1
right=65467
flag=0 # evita de criar o array a cada recursividade

binary_search $x $left $right $flag
