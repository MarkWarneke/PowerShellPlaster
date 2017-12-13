[CmdletBinding()]
param (
    [string] $NewModuleName = "MarkMitKModule"
)

$plaster = @{
    TemplatePath    = "." 
    DestinationPath = "C:\dev\git\AdvancedPlaster\$NewModuleName"  # Must be named exactly like ModuleName for tests
    FullName = "Mark Warneke"
    ModuleName = "$NewModuleName"
    ModuleDesc = "Here is a module description"
    Version = "0.1.0"
    FunctionName = "Get-Demo"
}



If (!(Test-Path $plaster.DestinationPath)) {
    New-Item -ItemType Directory -Path $plaster.DestinationPath
} else {
    Remove-Item -Path $plaster.DestinationPath
}
Invoke-Plaster @plaster -Verbose
