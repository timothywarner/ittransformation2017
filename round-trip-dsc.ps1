break
# #############################################################################
# TITLE: ROUND-TRIP DESIRED STATE CONFIGURATION (DSC)
# FILENAME: round-trip-dsc.ps1# 
# AUTHOR: Timothy L. Warner
# DATE:  2017-05-22
# EMAIL: timothy-warner@pluralsight.com
# TWITTER: @TechTrainerTim
# #############################################################################

#region Prepare the environment; log into Azure
Set-Location -Path 'C:\Users\Tim\desktop\repo\ittransformation2017'
Login-AzureRmAccount
Set-AzureRmContext -SubscriptionName 'tim-2017'
#endregion

#region Create an ADUser DSC resource with xDscResourceDesigner

<# references: 
* https://msdn.microsoft.com/en-us/powershell/dsc/authoringresourcemofdesigner
* 
#>

# obtain the module
Find-Module -Name xDscResourceDesigner | Install-Module -Force -Verbose

# define the resource properties
$UserName = New-xDscResourceProperty –Name UserName -Type String -Attribute Key
$Ensure = New-xDscResourceProperty –Name Ensure -Type String -Attribute Write –ValidateSet 'Present', 'Absent'
$DomainCredential = New-xDscResourceProperty –Name DomainCredential -Type PSCredential -Attribute Write
$Password = New-xDscResourceProperty –Name Password -Type PSCredential -Attribute Write

# create the resource
New-xDscResource –Name Demo_ADUser –Property $UserName, $Ensure, $DomainCredential, $Password `
     –Path 'C:\Program Files\WindowsPowerShell\Modules' –ModuleName Demo_DSCModule

# check it out
ise 'C:\Program Files\WindowsPowerShell\Modules\Demo_DSCModule\DSCResources\Demo_ADUser\Demo_ADUser.schema.mof'    #MOF schema file
ise 'C:\Program Files\WindowsPowerShell\Modules\Demo_DSCModule\DSCResources\Demo_ADUser\Demo_ADUser.psm1'          #PS resource script

# define a new DSC configuration using the resource
Find-Module -Name xTimeZone | Install-Module -Force -Verbose
ise '.\dsc-configuration.ps1'

#endregion

#region Test and troubleshoot
Get-DscLocalConfigurationManager

Get-DscConfiguration

Get-DscConfigurationStatus

Remove-DscConfigurationDocument -Stage Current



#endregion







