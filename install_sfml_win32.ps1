$ESC=[char]27
$RED="$ESC[0;91m"
$YELLOW="$ESC[1;33m"
$NC="$ESC[0m"

if ($args.count -eq 0 ) {
    echo $RED "ERROR: Falto nombre de proyecto$NC"
    echo "`tFormato: $YELLOW./genwin64.ps1 <Nombre de Projecto>$NC"
    echo "`tEjemplo: $YELLOW./genwin64.ps1 game$NC"
    exit
}

# clear
# echo $YELLOW "Removiendo descarga anterior de SFML ..." $NC
# rm -recurse -force ~/Downloads/SFML*

if (-not (Test-Path "~/DevLibraries/SFML/32bit/SFML-2.5.1")) {
    if (-not (Test-Path "~/Downloads/SFML-2.5.1-windows-vc15-32-bit.zip")) {
        #clear
        echo $YELLOW "Descargando biblioteca SFML ..." $NC
        curl -o ~/Downloads/SFML-2.5.1-windows-vc15-32-bit.zip https://www.sfml-dev.org/files/SFML-2.5.1-windows-vc15-32-bit.zip
    }
    echo $YELLOW "Instalando Biblioteca SFML ..." $NC 
    expand-archive -Path ~/Downloads/SFML-2.5.1-windows-vc15-32-bit.zip -DestinationPath ~/DevLibraries/SFML/32bit
}

$SFMLPath = [Environment]::GetEnvironmentVariable("PATH", "user")
if (!($SFMLPath -like "*\DevLibraries\SFML\32bit\SFML-2.5.1\bin*")) {
    $SFMLPath += ";$HOME\DevLibraries\SFML\32bit\SFML-2.5.1\bin"
    [Environment]::SetEnvironmentVariable("PATH", $SFMLPath, "user")
}

#clear
echo "Instalacion exitosa ..."
