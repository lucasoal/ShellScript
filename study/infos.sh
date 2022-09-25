#!/bin/bash

clear

# O comando echo exibe na tela a string entre aspas duplas. Caso você não queira que ela fique entre aspas duplas, simplesmente não as forneça no comando echo;
echo "-> Seu nome de usuário é:"
# O comando whoami exibe o usuário logado no sistema;
whoami

echo "-> Hora atual e tempo de máquina sendo executada:"
# O comando uptime exibe a hora atual, o tempo decorrido desde que o computador foi ligado, o número de usuários logados e uma média do número de processos carregados nos últimos um, cinco e 15 minutos;
uptime

echo "-> Script executado a partir do dirtório:"
# O comando pwd exibe o diretório no qual o arquivo está rodando.
pwd

# declarando variavel
variavel_string=string
variavel_numero=127
echo "-> Variavel string declarada: $variavel_string"
echo "-> Variavel numero declarada: $variavel_numero"

# variavel comando
variavel_comando=$(whoami)
echo "-> Variavel comando: $variavel_comando"

# lendo entrada de dados
echo "-> Digite uma banda que você goste:"
read nome_banda
echo "-> Você gosta da banda '$nome_banda'"

