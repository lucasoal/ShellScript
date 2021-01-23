#!/bin/bash


# n string1: o comprimento de string1 é diferente de 0;
# z string1: o comprimento de string1 é zero;
# string1 = string2: string1 e string2 são idênticas;
# string1 != string2: string1 e string2 são diferentes;
# inteiro1 -eq inteiro2: inteiro1 possui o mesmo valor que inteiro2;
# inteiro1 -ne inteiro2: inteiro1 não possui o mesmo valor que inteiro2;
# inteiro1 -gt inteiro2: inteiro1 é maior que inteiro2;
# inteiro1 -ge inteiro2: inteiro1 é maior ou igual a inteiro2;
# inteiro1 -lt inteiro2: inteiro1 é menor que inteiro2;
# inteiro1 -le inteiro2: inteiro1 é menor ou igual a inteiro2;
# e nome_do_arquivo: verifica se nome_do_arquivo existe;
# d nome_do_arquivo: verifica se nome_do_arquivo é um diretório;
# f nome_do_arquivo: verifica se nome_do_arquivo é um arquivo regular (texto, imagem, programa, docs, planilhas).

clear

echo "Digite um valor qualquer:"
read valor

if [ "$valor" -gt 0 ];
    then
        echo "-> O valor é positivo!!!"

elif [ "$valor" -lt 0 ];
    then
        echo "-> O valor é negativo!!!"

else    
    echo "Não é um valor permitido!!!"
fi

echo ""
echo    "Selecione uma opção"
echo    "1- Data e hora do sistema"
echo    "2- Dividir 2 numeros"
echo    "3- Exibir mensagem"
read opcao;

if [ "$opcao" == "1" ];
    then
        data=$(uptime)
        echo "-> $data"

elif [ "$opcao" == "2" ];
    then
        echo "Digite o valor A"
        read valorA
        echo "Digite o valor b"
        read valorB

        resultado=$(($valorA/$valorB))
        echo "Resultado de [$valorA/$valorB] é $resultado"

elif [ "$opcao" == "3" ];
    then
        echo "Digite uma mensagem"
        read mensagem
        echo "Mensagem digitada : "$mensagem""
else    
        echo "Opção não listada!!!"
fi