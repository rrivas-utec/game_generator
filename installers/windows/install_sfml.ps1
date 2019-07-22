$ESC=[char]27
$RED="$ESC[0;91m"
$YELLOW="$ESC[1;33m"
$NC="$ESC[0m"

$OSBit = "32bit"
$CompressedFile = "SFML-2.5.1-windows-vc15-32-bit.zip"

if (-not (Test-Path "~/DevLibraries/SFML/$OSBit/SFML-2.5.1")) {

    try {
        if (-not (Test-Path "~/Downloads/$CompressedFile")) {
            #clear
            echo $YELLOW "Descargando biblioteca SFML ..." $NC
            curl -o "~/Downloads/$CompressedFile" "https://www.sfml-dev.org/files/$CompressedFile"
        }
    } catch {
        if (Test-Path "~/Downloads/$CompressedFile") {
            rm ~/Downloads/$CompressedFile
        }
        echo $RED "ERROR: Descargando SFML ..." $NC
        exit 
    }
    echo $YELLOW "Instalando Biblioteca SFML ..." $NC 
    expand-archive -Path "~/Downloads/$CompressedFile" -DestinationPath "~/DevLibraries/SFML/$OSBit"
}

echo $YELLOW "Registrando el PATH ..." $NC
$SFMLPath = [Environment]::GetEnvironmentVariable("PATH", "user")
if (!($SFMLPath -like "*\DevLibraries\SFML\$OSBit\SFML-2.5.1\bin*")) {
    $SFMLPath += ";$HOME\DevLibraries\SFML\$OSBit\SFML-2.5.1\bin"
    [Environment]::SetEnvironmentVariable("PATH", $SFMLPath, "user")
}

#clear
echo "Instalacion exitosa ..."
