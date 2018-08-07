<#
    .SYNOPSIS
        Apply a specific Windows Server STIG version to a node

    .DESCRIPTION
        Use the embedded STIG data with default range values. In this example,
        the Windows Server 2012R2 V2 R12 member server STIG is processed by the
        composite resource and merges in the default values for any settings
        that have a valid range.
#>
configuration Example
{
    param
    (
        [parameter()]
        [string]
        $NodeName = 'localhost'
    )

    Import-DscResource -ModuleName PowerStigDsc

    Node $NodeName
    {
        WindowsServer BaseLine
        {
            OsVersion   = '2012R2'
            OsRole      = 'MS'
            StigVersion = '2.12'
            DomainName  = 'sample.test'
            ForestName  = 'sample.test'
        }
    }
}

Example
