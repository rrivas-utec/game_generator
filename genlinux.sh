#!/usr/bin/env bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ $# -eq 0 ]
then
    clear
    echo -e "\n${RED}ERROR: Falto nombre de proyecto${NC}"
    echo -e "${YELLOW}./genlinux.sh <NombreProjecto>${NC}"
    echo -e "Donde: ${YELLOW}<NombreProjecto> = El nombre de Projecto${NC}"
    echo -e "Ejemplo: ${YELLOW}./genlinux.sh game${NC}"
    exit 1
fi 

clear
echo "Removiendo descarga anterior de SFML..."
rm -rf ~/Downloads/SFML*

clear
echo "Descargando biblioteca SFML..."
wget https://www.sfml-dev.org/files/SFML-2.5.1-linux-gcc-64-bit.tar.gz -P ~/Downloads

clear
echo "Descomprimir..."
tar -xvf ~/Downloads/SFML-2.5.1-linux-gcc-64-bit.tar.gz -C ~/Libraries

clear
echo "Actualizando Projecto..."
sed -i 's/PROYECTO/'$1'/g' CMakeLists.txt
sed -i 's#DIRECTORIO#~/Libraries/SFML-2.5.1#g' CMakeLists.txt


