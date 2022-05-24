# Last update : 18/05/2022
# Author : EHO - Deepdef
# Purpose : Disable firefox proxy 

[datetime]$limit = (Get-Date).AddMinutes(15)
while((Get-Date) -lt $limit) {
	while((Get-Content $env:appdata\Mozilla\Firefox\Profiles\*.default\prefs.js | Select-String -Pattern 'user_pref\(\"network\.proxy\.type\"\, 1\)\;').Matches.Success){
		(Get-Content $env:appdata\Mozilla\Firefox\Profiles\*.default\prefs.js).replace('user_pref("network.proxy.type", 1);', 'user_pref("network.proxy.type", 0);') | Set-Content $env:appdata\Mozilla\Firefox\Profiles\*.default\prefs.js
	}
}