# Author : EHO - Deepdef
# Last update : 12/05/22
# Purpose : Centralize MSFT silent scanner results only if log file is present and size greater than 2kb. ( ~ not empty)

if ( Test-Path  -Path C:\Windows\debug\msert.log -PathType Leaf){
	if ( (Get-Item "C:\Windows\debug\msert.log").length -gt 2kb ) {
		$ip = ((Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Ethernet*).IPAddress).ToString()
		$hostname = hostname
		$time = (Get-Date).ToString("MMddhhmm")
		$dest = "\\serveur01\Packages\MSERT\Logs\" + "msert-" + $hostname + "-" + $time + ".log" 
		Copy-Item -Path C:\Windows\debug\msert.log -Destination $dest
		$ip | Out-File -FilePath $dest -Append
	}
}