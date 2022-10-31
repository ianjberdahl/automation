Write-Output "Enter in the full domain name starting from '@'"
$addy = Read-Host -Prompt "New Domain"
$users = Get-EXOMailbox 

foreach ($user in $users.Alias) {
    try {
        $new = $user+'@'+$addy
        Set-Mailbox -Identity "$user" -WindowsEmailAddress "$new" -MicrosoftOnlineServicesID "$new"
    }
    Finally {
    Get-EXOMailbox -Identity "$user" | Format-List UserPrincipalName, primarySMTPAddress, EmailAddresses
    }
}