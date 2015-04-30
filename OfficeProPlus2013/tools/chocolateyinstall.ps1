$configFile = (Join-Path $(Split-Path -parent $MyInvocation.MyCommand.Definition) 'configuration.xml')
Install-ChocolateyPackage 'officeClickToRun' 'exe' "/extract:$env:temp\office /log:$env:temp\officeInstall.log /quiet /norestart" 'http://download.microsoft.com/download/6/2/3/6230F7A2-D8A9-478B-AC5C-57091B632FCF/officedeploymenttool_x86_4713-1000.exe'
Install-ChocolateyInstallPackage 'officeClickToRun' 'exe' "/download $configFile" "$env:temp\office\setup.exe"
Install-ChocolateyInstallPackage 'officeClickToRun' 'exe' "/configure $configFile" "$env:temp\office\setup.exe"