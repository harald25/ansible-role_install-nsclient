#nat@dira.no
param (
    [int]$xWarning = 90
    ,[int]$xCritical = 180
)

$Session = New-Object -ComObject "Microsoft.Update.Session"
$Searcher = $Session.CreateUpdateSearcher()
$iDaysSinceLastInstall = ($(Get-Date) – $($Searcher.QueryHistory(0,1)).Date).Days ##first record is last run

	if ($xCritical -le $iDaysSinceLastInstall )
	{#CRITICAL
		Write-Output "Critical $iDaysSinceLastInstall days since last install"
		$host.SetShouldExit(2) #exit 2 #critical
	}
	elseif ($xWarning -le $iDaysSinceLastInstall )
	{#WARNING
		Write-Output "Warning $iDaysSinceLastInstall days since last install"
		$host.SetShouldExit(1) #exit 1 #warning
	}
	else
	{#ok
		Write-Output "Ok! $iDaysSinceLastInstall days since last install"
		$host.SetShouldExit(0) #exit 0 #OK
	}
