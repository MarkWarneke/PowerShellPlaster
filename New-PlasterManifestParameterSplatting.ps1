$destination = @{
    ManifestFolder ='.\MarkMitKPlasterManifestTemplate'
    ModuleFolder = '.\MarkMitKModule'
}

Find-Module -Name Plaster -Repository PSGallery | Install-Module -Verbose -Force

# Create folder structure if not exists based on destination hash
foreach ($path in $destination.GetEnumerator()) {
    if (-Not (Test-Path -Path $path.Value)) {
        New-Item -Path $path.Value -ItemType Directory
    }
}

$manifestProperties = @{
    Path = "$($destination.ManifestFolder)\PlasterManifest.xml" # Name must be PlasterManifest in order to use Test-PlasterManifest
    Title = "MarkMitK working with Plaster"
    TemplateName = "MarkMitKPlasterTemplate"
    TemplateVersion = "0.0.1"
    Author = "Mark Warneke <mark.warneke@microsoft.com>"
    Description = "MarkMitK's Plaster Template"
    Verbose = $true
}

New-PlasterManifest @manifestProperties
# The value of the Path argument must refer to a file named 'plasterManifest.xml' or 'plasterManifest_<culture>.xml'. Change the Plaster manifest filename and' or 'plasterManifest_<culture>.xml'.
Test-PlasterManifest $manifestProperties.Path 
code $destination.ManifestFolder

Invoke-Plaster -TemplatePath $($destination.ManifestFolder) -DestinationPath $($destination.ModuleFolder)