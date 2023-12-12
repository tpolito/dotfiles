; Center Active Window
#c::
WinExist("A")
WinGetPos,,, sizeX, sizeY
WinMove, (A_ScreenWidth/2)-(sizeX/2), (A_ScreenHeight/2)-(sizeY/2)
return

; Make the window 2400x1080 and center it
^!r:: 
WinGetActiveTitle, ActiveTitle ; Get the title of the active window
WinMove, %ActiveTitle%,, 0, 0, 2400, 1080 ; Resize the active window
WinExist("A")
WinGetPos,,, sizeX, sizeY
WinMove, (A_ScreenWidth/2)-(sizeX/2), (A_ScreenHeight/2)-(sizeY/2)
return
