<#
.SYNOPSIS
Lists all disabled AD users.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

Import-Module ActiveDirectory

Get-ADUser -Filter { Enabled -eq $false } |
Select SamAccountName, Name
