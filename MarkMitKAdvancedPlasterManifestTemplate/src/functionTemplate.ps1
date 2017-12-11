#REQUIRES #-Version 4.0
#REQUIRES #-Modules
#REQUIRES #-RunAsAdministrator

<#
DISCLAIMER:

Microsoft provides programming examples for illustration only, without warranty either expressed or implied,
including, but not limited to, the implied warranties of merchantability or fitness for a particular purpose. 
This mail message assumes that you are familiar with the programming language that is being demonstrated and
the tools that are used to create and debug procedures.

Author: Mark Warneke <mark.warneke@microsoft.com>
Created: <mm-dd-yyyy>
#>

function <%= $PLASTER_PARAM_FunctionName %> {
    <#
  .SYNOPSIS
    Short description
  .DESCRIPTION
    Long description
  .EXAMPLE
    C:\PS><%= $PLASTER_PARAM_FunctionName %>
    Example of how to use this cmdlet
 .PARAMETER ComputerName
    Enter one or more computer names separated by commas.
  #>
  
    [CmdletBinding(
        SupportsPaging = $False,
        SupportsShouldProcess = $False,
        PositionalBinding = $True
    )]
  
    [OutputType([PSCustomObject])]
    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ParameterSetName = "ComputerName",
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Enter one or more computer names separated by commas."
        )]     
        # [AllowEmptyString()]
        # [AllowEmptyCollection()]  
        # [ValidateCount(1,5)]
        # [ValidateLength(1,10)]  
        # [ValidatePattern("[0-9][0-9][0-9][0-9]")]
        # [ValidateRange(0,10)] 
        # [ValidateScript( { $_ -ge (Get-Date) } )]
        # [ValidateSet("Low", "Average", "High")]
        # [ValidateNotNull()] 
        [alias("Computer", "CN", "MachineName")]
        [String[]]
        $ComputerName
    )
    
    begin {
    }
    
    process {
        foreach ($_computer in $ComputerName) {
            try {

            }
            catch [Exception] {
                Write-Error "$Exception found"


            }
            finally {
                [PSCustomObject]@{

                }
            }
        }
    }
    
    end {
    }
}