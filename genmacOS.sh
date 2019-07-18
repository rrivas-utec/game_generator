#!/usr/bin/env bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ $# -eq 0 ]; then
    clear
    echo -e "\n${RED}ERROR: Falto nombre de proyecto${NC}"
    echo -e "${YELLOW}./genmacOS.sh <NombreProjecto>${NC}"
    echo -e "donde: ${YELLOW}<NombreProjecto> = Nombre del Projecto${NC}"
    echo -e "ejemplo: ${YELLOW}./genmacOS.sh game${NC}"
    exit 1
fi 

    if [ ! -f ~/Downloads/SFML-2.5.1-macOS-clang.tar.gz ]; then
        clear
        echo "Descargando biblioteca SFML..."
        curl -o ~/Downloads/SFML-2.5.1-macOS-clang.tar.gz \
             https://www.sfml-dev.org/files/SFML-2.5.1-macOS-clang.tar.gz
    fi

    clear
    echo "Descomprimir..."
    if [ ! -d ~/DevLibraries ]; then
        mkdir ~/DevLibraries
    elif [ -d ~/DevLibraries/SFML-2.5.1-macOS-clang.tar.gz ]; then
        rm -rf ~/DevLibraries/SFML-2.5.1-macOS-clang.tar.gz
    fi
    tar -xvf ~/Downloads/SFML-2.5.1-macOS-clang.tar.gz -C ~/DevLibraries

    clear
    echo "Copiando extlibs a ~/Library/Framework..."
    cp -avf ~/DevLibraries/SFML-2.5.1-macOS-clang/extlibs/. \
        ~/Library/Frameworks

    clear
    echo "Modificando plantilla CMakeLists.txt..."
    cp CMakeLists.template CMakeLists.txt
    perl -i -pe's/PROYECTO/'$1'/g' CMakeLists.txt
    perl -i -pe's#DIRECTORIO#~/DevLibraries/SFML-2.5.1-macOS-clang#g' \
         CMakeLists.txt

    clear 
    echo "Actualizacion exitosa..."
