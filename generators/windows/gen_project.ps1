$ESC=[char]27
$RED="$ESC[0;91m"
$YELLOW="$ESC[1;33m"
$NC="$ESC[0m"

$OSBit = "32bit"

if ($args.count -eq 0 ) {
    echo $RED "ERROR: Falto nombre de proyecto$NC"
    echo "`tFormato: $YELLOW$($MyInvocation.MyCommand.Name) <Nombre de Projecto>$NC"
    echo "`tEjemplo: $YELLOW$($MyInvocation.MyCommand.Name) game$NC"
    exit
}

$project = $args[0]
$PROJECT_PATH = (Resolve-Path -Path "..\..\..\").tostring()
$PROJECT_PATH += "\" + $project

if (Test-Path $PROJECT_PATH) {
    echo $RED "ERROR: No se puede generar en folder existente: " $YELLOW $PROJECT_PATH $NC
    exit
}

mkdir $PROJECT_PATH
cp -force ../../source/*.* $PROJECT_PATH

echo $YELLOW "Generando CMakeLists ..." $NC
mv -force "$PROJECT_PATH/CMakeLists.template" "$PROJECT_PATH/CMakeLists.txt"

$cmakelists = (Get-Content "$PROJECT_PATH/CMakeLists.txt" | %{$_ -replace "PROYECTO", $project}) 
$cmakelists | Out-File -Encoding utf8 "$PROJECT_PATH/CMakeLists.txt"

$cmakelists = (Get-Content "$PROJECT_PATH/CMakeLists.txt" | %{$_ -replace "DIRECTORIO","~/DevLibraries/SFML/$OSbit/SFML-2.5.1"}) 
$cmakelists | Out-File -Encoding utf8 "$PROJECT_PATH/CMakeLists.txt"

rm -Recurse "$PROJECT_PATH/*.sh"

$SFMLPath = [Environment]::GetEnvironmentVariable("PATH", "user")
if (!($SFMLPath -like "*\DevLibraries\SFML\$OSBit\SFML-2.5.1\bin*")) {
    $SFMLPath += ";$HOME\DevLibraries\SFML\$OSBit\SFML-2.5.1\bin"
    [Environment]::SetEnvironmentVariable("PATH", $SFMLPath, "user")
}

#clear
echo "Actualizacion exitosa..."
