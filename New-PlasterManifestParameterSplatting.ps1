$destination = @{
    Manifest ='.\MarkMitKPlasterManifestTemplate'
    Module = '.\MarkMitKModule'
}

Find-Module -Name Plaster -Repository PSGallery |
    Install-Module -Verbose -Force

foreach ($path in $destination.GetEnumerator()) {
    if (-Not (Test-Path -Path $path.Value)) {
        New-Item -Path $path.Value -ItemType Directory
    }
}

$manifestProperties = @{
    Path = "$($destination.ManifestFolder)\MarkMitKPlasterManifest.xml"
    Title = "MarkMitK working with Plaster"
    TemplateName = "MarkMitKPlasterTemplate"
    TemplateVersion = "0.0.1"
    Author = "Mark Warneke <mark.warneke@microsoft.com>"
    Description = "MarkMitK's Plaster Template"
    Verbose = $true
}

New-PlasterManifest @manifestProperties
code $destinationFolder

Invoke-Plaster -TemplatePath $($destination.Manifest) -DestinationPath $($destination.Module)