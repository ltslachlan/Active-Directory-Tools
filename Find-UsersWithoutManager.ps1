<#
.SYNOPSIS
Finds users without a manager assigned.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

Import-Module ActiveDirectory

Get-ADUser -Filter * -Properties Manager |
Where-Object { -not $_.Manager } |
Select SamAccountName, Name
