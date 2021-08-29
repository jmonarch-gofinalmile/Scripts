<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2021 v5.8.193
	 Created on:   	8/29/2021 10:29 AM
	 Created by:   	JosephMonarch
	 Organization: 	Riverstone Logistics
	 Filename:     	InstallDC.ps1
	===========================================================================
	.DESCRIPTION
		Installs Desktop Central on client workstations
#>

$downjson = 'https://github.com/jmonarch-gofinalmile/Scripts/raw/main/Dev/DesktopCentralInstall/DCAgentServerInfo.json'
$downmsi = 'https://github.com/jmonarch-gofinalmile/Scripts/raw/main/Dev/DesktopCentralInstall/DesktopCentralAgent.msi'
$downmst = 'https://github.com/jmonarch-gofinalmile/Scripts/raw/main/Dev/DesktopCentralInstall/DesktopCentralAgent.mst'

Invoke-WebRequest -Uri $downjson -OutFile "C:\Windows\Temp\DCAgentServerInfo.json"
Invoke-WebRequest -Uri $downmsi -OutFile "C:\Windows\Temp\DesktopCentralAgent.msi"
Invoke-WebRequest -Uri $downmst -OutFile "C:\Windows\Temp\DesktopCentralAgent.mst"

$dir = 'C:\Windows\Temp'
$msi = 'DesktopCentralAgent.msi'
$mst = 'DesktopCentralAgent.mst'

$msipath = $dir + '\' + $msi
$mstpath = $dir + '\' + $mst

Start-Process msiexec.exe -ArgumentList "/i $msipath /qn TRANSFORMS=$mstpath /lv C:\Windows\Temp\Agentinstalllog.txt" -Wait

