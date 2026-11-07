' VBScript khoi dong sync chay ngam 100% khong hien cua so Console
Set objFSO = CreateObject("Scripting.FileSystemObject")
strCurrentDir = objFSO.GetParentFolderName(WScript.ScriptFullName)

Set objShell = CreateObject("WScript.Shell")
strCommand = "powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File """ & strCurrentDir & "\sync-worker.ps1"""
objShell.Run strCommand, 0, False
