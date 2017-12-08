$destinationFolder = '.\MarkMitKTemplate'

$manifestProperties = @{
    Path = "$destinationFolder\MarkMitKPlasterManifest.xml"
    Title = "MarkMitK working with Plaster"
    TemplateName = "MarkMitKPlasterTemplate"
    TemplateVersion = "0.0.1"
    Author = "Mark Warneke <mark.warneke@microsoft.com>"
    Description = "MarkMitK's Plaster Template"
    Verbose = $true
}

New-PlasterManifest @manifestProperties
code $destinationFolder