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
        echo "Descargando biblioteca SFML..."
        curl -o ~/Downloads/SFML-2.5.1-windows-vc15-32-bit.zip https://www.sfml-dev.org/files/SFML-2.5.1-windows-vc15-32-bit.zip
    }
    echo $YELLOW "Instalando Biblioteca SFML ..." $NC 
    expand-archive -Path ~/Downloads/SFML-2.5.1-windows-vc15-32-bit.zip -DestinationPath ~/DevLibraries/SFML/32bit
}

#clear
echo $YELLOW "Generando CMakeLists.txt ..." $NC
rm -ErrorAction Ignore CMakeLists.txt
rm -ErrorAction Ignore CMakeLists.aux
cp -force CMakeLists.template CMakeLists.txt
$project = $args[0]
cat CMakeLists.template | %{$_ -replace "PROYECTO", $project} > CMakeLists.aux
cat CMakeLists.aux | %{$_ -replace "DIRECTORIO","~/DevLibraries/SFML/32bit/SFML-2.5.1"} > CMakeLists.txt
rm CMakeLists.aux

$SFMLPath = [Environment]::GetEnvironmentVariable("PATH", "user")
if (!($SFMLPath -like "*\DevLibraries\SFML\32bit\SFML-2.5.1\bin*")) {
    $SFMLPath += ";$HOME\DevLibraries\SFML\32bit\SFML-2.5.1\bin"
    [Environment]::SetEnvironmentVariable("PATH", $SFMLPath, "user")
}

#clear
echo "Actualizacion exitosa..."
