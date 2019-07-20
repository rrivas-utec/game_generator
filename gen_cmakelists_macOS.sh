#!/usr/bin/env bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ $# -eq 0 ]; then
    echo -e "\n${RED}ERROR: Falto nombre de proyecto${NC}"
    echo -e "Formato: ${YELLOW}./gen_cmakelists_macOS.sh <Nombre de Projecto>${NC}"
    echo -e "Ejemplo: ${YELLOW}./gen_cmakelists_macOS.sh game${NC}"
    exit 1
fi 

echo -e "${YELLOW}Generando CMakeLists.txt ...${NC}"
cp CMakeLists.template CMakeLists.txt
sed -i '' -e 's/PROYECTO/'$1'/' CMakeLists.txt
sed -i '' -e 's#DIRECTORIO#~/DevLibraries/SFML-2.5.1-macOS-clang#' \
    CMakeLists.txt

echo "Finalizo exitosomente ..."
