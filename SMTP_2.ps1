$addy = Read-Host -Prompt "New Domain"
$users = Get-EXOMailbox 

foreach ($user in $users.Alias) {
    try{
        $new = $user+'@'+$addy
        $new
    }
    catch [Microsoft.Exchange.Configuration.ObjectModel.NotAcceptedDomainException]
    {
        Write-Warning "Domain $addy doesn't exist"
    } 
}    


<#foreach ( $email in $emails ) {
    $new = $email -replace ".{3}$",$domain
} try {
    Set-Mailbox -Identity "$email" -WindowsEmailAddress $new -MicrosoftOnlineServicesID $new
} Finally {
    Get-Mailbox -Identity "$email" | Format-List UserPrincipalName, primarySMTPAddress, EmailAddresses
} catch [Microsoft.Exchange.Configuration.Tasks.ManagementObjectNotFoundEsception] { 
    Write-Warning "Email $email not added as it doesn't exist"
} 

#>