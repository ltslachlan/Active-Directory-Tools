<#
.SYNOPSIS
Unlocks an AD user account.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

param (
    [Parameter(Mandatory)]
    [string]$Username
)

Import-Module ActiveDirectory

Unlock-ADAccount -Identity $Username

Write-Output "$Username has been unlocked."
