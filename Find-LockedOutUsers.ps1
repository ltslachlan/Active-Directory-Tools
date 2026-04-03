<#
.SYNOPSIS
Finds currently locked out AD accounts.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

Import-Module ActiveDirectory

Search-ADAccount -LockedOut | Select-Object Name, SamAccountName, LockedOut
