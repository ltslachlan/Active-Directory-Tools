<#
.SYNOPSIS
Exports group members.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

param (
    [string]$GroupName,
    [string]$OutputPath = "GroupMembers.csv"
)

Import-Module ActiveDirectory

Get-ADGroupMember $GroupName |
Select Name, ObjectClass |
Export-Csv $OutputPath -NoTypeInformation
