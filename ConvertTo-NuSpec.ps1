[CmdletBinding()]
param (
    # version number that should be used when publishing to github
    [Parameter(Mandatory = $true, ParameterSetName = "PublishGithub")]
    [version]
    $Version,
    
    # full path to the module psd1 file
    [Parameter(Mandatory = $true)]
    [string]
    $ModulePath
)

Write-Host "Create NuSpec from PSD1"
Install-Module -Name Trackyon.Nuget -Scope CurrentUser -Force
ConvertTo-NuSpec -Path "$ModulePath"

$filename = [System.IO.Path]::GetFileName($ModulePath)

Write-Host "Pack module"
nuget pack "$($modulePath.Replace('psd1', 'nuspec'))" -NonInteractive -OutputDirectory "$($modulePath.Replace($filename, ''))" -version $Version -Verbosity Detailed