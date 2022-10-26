Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
    InitialDirectory = [System.Environment]::GetFolderPath('Downloads')
    Filter = 'All Files (*.*)|*.*'}
$null = $FileBrowser.ShowDialog() 

using 
$json = ( Import-Csv $file )

foreach ( $user in $json.UserPrincipalName[0] ){

    Write-Out $user
}





#Set-Mailbox -Identity $name -WindowsEmailAddress $newemail -MicrosoftOnlineServicesID $newemail



