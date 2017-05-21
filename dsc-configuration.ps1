Configuration SetTimeZone
{
   Param
   (
       [String[]]$NodeName = $env:COMPUTERNAME,

       [Parameter(Mandatory = $true)]
       [ValidateNotNullorEmpty()]
       [String]$SystemTimeZone
   )

   Import-DSCResource -ModuleName xTimeZone

   Node $NodeName
   {
        xTimeZone TimeZoneExample
        {
            IsSingleInstance = 'Yes'
            TimeZone         = $SystemTimeZone
        }
   }
}

# SetTimeZone -NodeName 'localhost' -SystemTimeZone 'Central Standard Time'
#Start-DscConfiguration -Path . -Wait -Verbose -Force