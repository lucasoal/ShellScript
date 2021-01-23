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

echo "-> Utilizando quebra de linha(\n) [colocar '-e' na frente do echo]"
echo -e "-> Quebra\n   de\n   linha"