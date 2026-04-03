<#
.SYNOPSIS
Exports computer account details.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

param (
    [string]$OutputPath = "Computers.csv"
)

Import-Module ActiveDirectory

Get-ADComputer -Filter * -Properties OperatingSystem, LastLogonDate |
Select Name, OperatingSystem, LastLogonDate |
Export-Csv $OutputPath -NoTypeInformation
