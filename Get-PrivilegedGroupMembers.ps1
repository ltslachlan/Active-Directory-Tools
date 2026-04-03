<#
.SYNOPSIS
Lists members of privileged AD groups.

.AUTHOR
Lachlan McGregor

.DATE
2026
#>

$groups = @(
    "Domain Admins",
    "Enterprise Admins",
    "Administrators"
)

Import-Module ActiveDirectory

foreach ($group in $groups) {
    Get-ADGroupMember $group | Select @{
        Name = "Group"; Expression = { $group }
    }, Name, ObjectClass
}
