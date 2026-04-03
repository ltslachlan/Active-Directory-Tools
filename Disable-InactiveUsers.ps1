<#
.SYNOPSIS
Disables inactive AD users.

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
Where-Object { $_.LastLogonDate -lt $threshold -and $_.Enabled -eq $true } |
ForEach-Object {
    Disable-ADAccount $_
}
