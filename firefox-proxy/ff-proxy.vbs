' Version : 1.0
' Created : 17/05/2022
' Auteur : EHO - Deepdef
' Fonction : Lancement du script de desactivation de proxy firefox

Dim WinScriptHost
Set WinScriptHost = CreateObject("WScript.Shell")
WinScriptHost.Run("powershell -windowstyle hidden -noprofile -executionpolicy bypass -file \\Srv-ad\sysvol\veil.local\Packages\FIREFOX\ff-proxy.ps1")
Set WinScriptHost = Nothing