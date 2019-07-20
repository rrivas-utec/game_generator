#!/usr/bin/env bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'
PROGNAME=$(basename $0)
set -e

if [ ! -d ~/DevLibraries/SFML-2.5.1-macOS-clang ]; then
    if [ ! -f ~/Downloads/SFML-2.5.1-macOS-clang.tar.gz ]; then
        {
            echo -e "${YELLOW}Descargando biblioteca SFML ...${NC}"
            curl -o ~/Downloads/SFML-2.5.1-macOS-clang.tar.gz \
                 https://www.sfml-dev.org/files/SFML-2.5.1-macOS-clang.tar.gz
        } || {
            echo -e "${YELLOW}Error descargando SFML ...${NC}"
            rm -rf ~/Downloads/SFML-2.5.1-macOS-clang.tar.gz    
            exit 1
        }
    fi

    clear
    echo -e "${YELLOW}Instalando SFML ...${NC}"
    if [ ! -d ~/DevLibraries ]; then
        mkdir ~/DevLibraries
    fi

    {
        tar -xvf ~/Downloads/SFML-2.5.1-macOS-clang.tar.gz -C ~/DevLibraries
    } || {
        echo -e "${YELLOW}Error instalando SFML ...${NC}"
        rm -rf ~/DevLibraries/SFML-2.5.1-macOS-clang
        exit 1   
    }
fi

clear
echo -e "${YELLOW}Copiando extlibs a ~/Library/Framework ...${NC}"
cp -avf ~/DevLibraries/SFML-2.5.1-macOS-clang/extlibs/. \
    ~/Library/Frameworks

clear
echo "Instalacion exitosa..."
