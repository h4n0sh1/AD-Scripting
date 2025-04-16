# Extact from MISC 137 // J.Khalfa

# Script de backup des objets AD
Get-ADOrganizationalUnit -Filter * -Properties DistinguishedName | Select-Object Name, DistinguishedName | Export-Csv -Path "OUExport.csv" -NoTypeInformation
Get-ADUser -Filter * -Properties DistinguishedName | Select-Object Name, DistinguishedName | Export-Csv -Path "UserExport.csv" -NoTypeInformation
Get-ADGroup -Filter * -Properties DistinguishedName | Select-Object Name, DistinguishedName | Export-Csv -Path "GroupExport.csv" -NoTypeInformation
Get-ADComputer -Filter * -Properties DistinguishedName | Select-Object Name, DistinguishedName | Export-Csv -Path "ComputerExport.csv" -NoTypeInformation

#Script de backup des objets GPO
Get-GPO -All | Export-Csv -Path "GPOExport.csv" -NoTypeInformation 
Get-GPOReport -All -ReportType XML -Path "GPOReport.xml"
Get-GPOReport -All -ReportType HTML -Path "GPOReport.html"
$gpos = Get-ADOrganizationalUnit -Filter * | Get-GPInheriteance | Select-Object -ExpandProperty GpoLinks
$gpos | Export-Csv -Path "GPO_linked.csv" -NoTypeInformation
$gpos_root_domain = Get-AdDomain | Get-GPInheritance
$gpos_root_domain | Export-Csv GPO_linked_root_domain.csv -NoTypeInformation