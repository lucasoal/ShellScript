#!/bin/bash


# FUNÇÕES
main()
{
    echo "Escolha uma opção"
    echo "1- Esvaziar lixeira"
    echo -e "2- Calcular fatorial\n" # -e na frente do echo faz \n ser utilizado
    read opcao

    if [ "$opcao" == "1" ];
        then
            esvaziarLixeira

    elif [ "$opcao" == "2" ];
        then
            calcularFatorial
    else
        echo -e "\nOpção não listada"
    fi
}

esvaziarLixeira()
{
    echo -e "\nEsvaziando lixeira"

    # define a variavel path como o diretorio da lixeira
    path="${HOME}/.local/share/Trash/files"
    cd "$path" # change directorie para path

    for file in * # para todos arquivos listados no diretorio
        do
            rm -rf "$file"
        done
            echo -e "\nLixeira limpa!!!"
}

calcularFatorial()
{
    echo -e "\nCalculando fatorial\nDigite um numero"
    read numero

    fatorial=1
    i=$numero

    while [ $i -gt "0" ]
        do
            fatorial=$(($fatorial*$i));
            i=$(($i-1))
        done
            echo "$numero! = $fatorial"
}

# CHAMADA DE EXECUÇÃO

clear
main