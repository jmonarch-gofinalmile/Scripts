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

$downjson = 'https://gofinalmile.sharepoint.com/:u:/s/ITBI/EX2_3QnbXmBJiYEqXoak_3MBHYl4P3rHNAFZRgMpYpCCEA?e=IZcz3v'
$downmsi = 'https://gofinalmile-my.sharepoint.com/:u:/p/jmonarch/EbvdtLoibShEsCiWP74I_QMBTUMVmS_fuMiIb5ZLEocKXg?e=XesiH9'
$downmst = 'https://gofinalmile.sharepoint.com/:u:/s/ITBI/ESqP4kk1wgNCkECPWIX6MKQBq-BaeDU2QcV-bD02NaZaOg?e=py8Dc9'

Invoke-WebRequest -Uri $downjson -OutFile "C:\Windows\Temp\DCAgentServerInfo.json"
Invoke-WebRequest -Uri $downmsi -OutFile "C:\Windows\Temp\DesktopCentralAgent.msi"
Invoke-WebRequest -Uri $downmst -OutFile "C:\Windows\Temp\DesktopCentralAgent.mst"

## Get Running Directory
#$dirraw = Get-Location
#$dir = $dirraw.Path
#
#$msi = 'DesktopCentralAgent.msi'
#$mst = 'DesktopCentralAgent.mst'
#
#$msipath = $dir + '\' + $msi
#$mstpath = $dir + '\' + $mst
#
#Start-Process msiexec.exe -ArgumentList "/i $msipath /qn TRANSFORMS=$mstpath /lv %temp%\Agentinstalllog.txt" -Wait

