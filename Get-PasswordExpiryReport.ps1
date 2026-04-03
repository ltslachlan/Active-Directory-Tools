<#
.SYNOPSIS
Reports users with soon-to-expire passwords.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

param (
    [int]$DaysUntilExpiry = 14
)

Import-Module ActiveDirectory

$users = Get-ADUser -Filter * -Properties PasswordLastSet, msDS-UserPasswordExpiryTimeComputed

foreach ($user in $users) {
    if ($user."msDS-UserPasswordExpiryTimeComputed") {
        $expiry = [datetime]::FromFileTime($user."msDS-UserPasswordExpiryTimeComputed")
        if ($expiry -lt (Get-Date).AddDays($DaysUntilExpiry)) {
            [PSCustomObject]@{
                User   = $user.SamAccountName
                Expiry = $expiry
            }
        }
    }
}
