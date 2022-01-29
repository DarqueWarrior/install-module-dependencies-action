[CmdletBinding()]
param (
   # full path to the module psd1 file
   [Parameter(Mandatory = $true)]
   [string]
   $ModulePath
)
# Load the psd1 file so you can read the required modules and install them
$manifest = Import-PowerShellDataFile $ModulePath

# Install each module
$manifest.RequiredModules | ForEach-Object { Install-Module -Name $_ -Repository PSGallery -Force -Scope CurrentUser -Verbose }