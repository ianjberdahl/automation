$addy = Read-Host -Prompt "New Domain"
$users = Get-EXOMailbox 

foreach ($user in $users.Alias) {
    $new = $user+'@'+$addy
    Set-Mailbox -Identity "$user" -WindowsEmailAddress "$new" -MicrosoftOnlineServicesID "$new"
    Get-EXOMailbox -Identity "$user" | Format-List UserPrincipalName, primarySMTPAddress, EmailAddresses
}

if ($args[0] -eq '-h','--help') {
    Write-Output "Enter in the full domain name starting from '@'"
}