

$plaster = @{
    TemplatePath    = "." 
    DestinationPath = "C:\tmp\NewModule" # Must be named exactly like ModuleName for tests
    FullName = "Mark Warneke"
    ModuleName = "NewModule"
    ModuleDesc = "Here is a module description"
    Version = "0.1.0"
    FunctionName = "Get-Demo"
}

If (!(Test-Path $plaster.DestinationPath)) {
    New-Item -ItemType Directory -Path $plaster.DestinationPath
}
Invoke-Plaster @plaster -Verbose
