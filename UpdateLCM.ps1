Configuration UpdateLCM
{
    node localhost
    {
        LocalConfigurationManager
        {
            ConfigurationMode = "ApplyAndAutocorrect"
        }
    }  
}
UpdateLCM
Set-DscLocalConfigurationManager -Path 'C:\UpdateLCM' -Verbose