Set-Location -Path 'C:\Users\Tim\Desktop\REPO\ittransformation2017'

Get-DscLocalConfigurationManager

Set-DscLocalConfigurationManager -Path '.\LCMConfig' -Verbose

Get-DscConfiguration

Start-DscConfiguration -Path '.\FileResourceDemo' -Wait -Verbose

Test-DscConfiguration -Verbose

Remove-DscConfigurationDocument -Stage Current -Force

Restore-DscConfiguration 

# Used only with pull servers
Update-DscConfiguration