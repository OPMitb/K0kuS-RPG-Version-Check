Const DESKTOP = &H10&

Set objShell = CreateObject("Shell.Application")
Set objFolder = objShell.NameSpace(DESKTOP)

Set objFolderItem = objFolder.ParseName("K0kuS's RPG.lnk")
Set objShortcut = objFolderItem.GetLink

objShortcut.SetIconLocation "C:\Users\Administrator\Desktop\RPG CMD\K0kuS's RPG v0.3\data\logo.ico", 0
objShortcut.Save