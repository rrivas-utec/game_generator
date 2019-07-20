$ESC=[char]27
$RED="$ESC[0;91m"
$YELLOW="$ESC[1;33m"
$NC="$ESC[0m"

$OSBit = "64bit"
$OSEnv = "win64"

if ($args.count -eq 0 ) {
    echo $RED "ERROR: Falto nombre de proyecto$NC"
    echo "`tFormato: $YELLOW./gen_cmakelists_$OSEnv.ps1 <Nombre de Projecto>$NC"
    echo "`tEjemplo: $YELLOW./gen_cmakelists_$OSEnv.ps1 game$NC"
    exit
}

#clear
echo $YELLOW "Generando CMakeLists.txt ..." $NC
rm -ErrorAction Ignore CMakeLists.txt
rm -ErrorAction Ignore CMakeLists.aux
cp -force CMakeLists.template CMakeLists.txt
$project = $args[0]
Get-Content CMakeLists.template | %{$_ -replace "PROYECTO", $project} | Out-File -Encoding utf8 CMakeLists.aux
Get-Content CMakeLists.aux | %{$_ -replace "DIRECTORIO","~/DevLibraries/SFML/$OSbit/SFML-2.5.1"} | Out-File -Encoding utf8 CMakeLists.txt
rm CMakeLists.aux

$SFMLPath = [Environment]::GetEnvironmentVariable("PATH", "user")
if (!($SFMLPath -like "*\DevLibraries\SFML\$OSBit\SFML-2.5.1\bin*")) {
    $SFMLPath += ";$HOME\DevLibraries\SFML\$OSBit\SFML-2.5.1\bin"
    [Environment]::SetEnvironmentVariable("PATH", $SFMLPath, "user")
}

#clear
echo "Actualizacion exitosa..."
