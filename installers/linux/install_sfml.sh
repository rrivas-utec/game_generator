#!/usr/bin/env bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ ! -d ~/DevLibraries/SFML-2.5.1 ]; then
    if [ ! -f ~/Downloads/SFML-2.5.1-linux-gcc-64-bit.tar.gz ]; then
        {
            clear
            echo -e "${YELLOW}Descargando biblioteca SFML ...${NC}"
            wget https://www.sfml-dev.org/files/SFML-2.5.1-linux-gcc-64-bit.tar.gz -P ~/Downloads
        } || {
            echo -e "${RED}ERROR Descargando biblioteca SFML ...${NC}"
            rm -rf ~/Downloads/SFML-2.5.1-linux-gcc-64-bit.tar.gz 
            exit 1
        }
    fi

    clear
    echo -e "${YELLOW}Instalando SFML ...${NC}"
    if [ ! -d ~/DevLibraries ]; then
        mkdir ~/DevLibraries
    fi
    tar -xvf ~/Downloads/SFML-2.5.1-linux-gcc-64-bit.tar.gz -C ~/DevLibraries
fi

clear
echo "Instalacion exitosa ..."

