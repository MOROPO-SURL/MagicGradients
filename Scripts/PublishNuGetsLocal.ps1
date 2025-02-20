﻿Function Build-Solution{
    param(
        [Parameter(Mandatory=$true)]
        [String] $Path
    )
    process
    {
        $MsBuildExe = 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\msbuild.exe'
        
        Write-Host "Building $($Path)" -foregroundcolor green 
        & "$($MsBuildExe)" "$($Path)" /t:clean,restore,rebuild,pack /p:Configuration=Release /p:Platform="Any CPU" /m
    }
}

$NuGetPath = '..\src\MagicGradients\bin\**\Release\*.nupkg'

Remove-Item $NuGetPath
Build-Solution('..\src\MagicGradients\MagicGradients.csproj')

Get-ChildItem -Path $NuGetPath -Recurse | Copy-Item -Destination 'C:\Packages'