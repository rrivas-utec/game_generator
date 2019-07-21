#!/usr/bin/env bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ $# -eq 0 ]; then
    clear
    echo -e "\n${RED}ERROR: Falto nombre de proyecto${NC}"
    echo -e "Formato: ${YELLOW}./gen_cmakelists_linux.sh <Nombre de Projecto>${NC}"
    echo -e "Ejemplo: ${YELLOW}./gen_cmakelists_linux.sh game${NC}"
    exit 1
fi 

clear
echo -e "${YELLOW}Generando CMakeLists.txt ...${NC}"
rm -rf CMakeLists.txt
cp CMakeLists.template CMakeLists.txt
sed -i 's/PROYECTO/'$1'/g' CMakeLists.txt
sed -i 's#DIRECTORIO#~/DevLibraries/SFML-2.5.1#g' CMakeLists.txt

echo "Actualizacion exitosa..."

