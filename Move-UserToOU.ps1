<#
.SYNOPSIS
Moves a user to a specified OU.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

param (
    [string]$Username,
    [string]$TargetOU
)

Import-Module ActiveDirectory

$user = Get-ADUser $Username

Move-ADObject -Identity $user.DistinguishedName -TargetPath $TargetOU

Write-Output "$Username moved to $TargetOU"
