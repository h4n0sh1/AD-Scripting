'	Version : 1.0
'	Created: 29/04/2022
'	Auteur: EHO -  Deepdef
'	Fonction:   Lancement silencieux du scanner de sécurité Microsoft

Dim WinScriptHost
Set WinScriptHost = CreateObject("WScript.Shell")
WinScriptHost.Run Chr(34) & "\\serveur01\packages\MSERT\Scripts\msert.bat" & Chr(34), 0
Set WinScriptHost = Nothing