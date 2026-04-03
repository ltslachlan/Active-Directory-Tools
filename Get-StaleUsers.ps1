<#
.SYNOPSIS
Finds inactive AD users.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

param (
    [int]$DaysInactive = 90
)

Import-Module ActiveDirectory

$threshold = (Get-Date).AddDays(-$DaysInactive)

Get-ADUser -Filter * -Properties LastLogonDate |
Where-Object { $_.LastLogonDate -lt $threshold } |
Select SamAccountName, LastLogonDate
