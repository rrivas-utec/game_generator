#!/usr/bin/env bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ $# -eq 0 ]; then
    clear
    echo -e "\n${RED}ERROR: Falto nombre de proyecto${NC}"
    echo -e "Formato: ${YELLOW}./genlinux.sh <NombreProjecto>${NC}"
    echo -e "Ejemplo: ${YELLOW}./genlinux.sh game${NC}"
    exit 1
fi 

if [ ! -f '~/DevLibraries/SFML-2.5.1' ]; then
    if [ ! -f '~/Downloads/SFML-2.5.1' ]; then
        #clear
        echo "Descargando biblioteca SFML ..."
        wget https://www.sfml-dev.org/files/SFML-2.5.1-linux-gcc-64-bit.tar.gz -P ~/Downloads
    fi

    #clear
    echo "Instalando SFML ..."
    tar -xvf ~/Downloads/SFML-2.5.1-linux-gcc-64-bit.tar.gz -C ~/DevLibraries
fi

#clear
echo "Instalacion exitosa ..."
