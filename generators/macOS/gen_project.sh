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

PROJECT_PATH="$(cd "$(dirname "../../../..")" && pwd -P)/"$1
if [ -d ${PROJECT_PATH} ]; then
    echo -e "${RED}ERROR: No se puede genera en folder existente: ${YELLOW}[${PROJECT_PATH}]${NC}"
    exit 1
fi

mkdir ${PROJECT_PATH}
cp -r ../../source/. ${PROJECT_PATH}

echo -e "${YELLOW}Generando CMakeLists.txt ...${NC}"
mv ${PROJECT_PATH}/CMakeLists.template ${PROJECT_PATH}/CMakeLists.txt
sed -i '' -e 's/PROYECTO/'$1'/' ${PROJECT_PATH}/CMakeLists.txt
sed -i '' -e 's#DIRECTORIO#~/DevLibraries/SFML-2.5.1-macOS-clang#' \
    ${PROJECT_PATH}/CMakeLists.txt
sed -i '' -e 's/PROYECTO/'$1'/' ${PROJECT_PATH}/run.sh

echo "Actualizacion exitosa ..."
