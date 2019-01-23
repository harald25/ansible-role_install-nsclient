#nat@dira.no
$arrFalsePositive =  @("RemoteRegistry" #RemoteRegistry
,"sppsvc" #Software Protection
,"TrustedInstaller" #Windows Modules Installer
,"MapsBroker" #Downloaded Maps Manager
,"WbioSrvc" #Windows Biometric Service
,"CDPSvc" #Connected Devices Platform Service
,"tiledatamodelsvc" #Tile Data model server
,"gupdate" #Google-oppdatering-tjenesten
,"dbupdate" #Dropbox-oppdatering-tjeneste (dbupdate)
)

$notRunning=Get-Service |? {$_.StartType -EQ "Automatic" -and $_.Status -NE "Running"}
$out=""

foreach ($svc in $notRunning) {

    if ($arrFalsePositive -contains $svc.Name)
    {
        #echo "falsk positiv $($svc.DisplayName)"
    }
    else
    {
        #OneSyncSvc_*
        if ($svc -match "OneSyncSvc_")
        {
            #echo "falsk positiv $($svc.DisplayName)"
        }
        else
        {
            $out+=$svc.DisplayName + ", "
        }
        
    }
}

if ("" -ne $out)
{
    Write-Output "Critical Services not running: $out"
    $host.SetShouldExit(2) #exit 2 #critical
}
else
{
    Write-Output "Ok! All services is running"
    $host.SetShouldExit(0) #exit 0 #OK
}

