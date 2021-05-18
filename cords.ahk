;Credit: autohotkey.com/board/topic/75360-how-to-know-the-x-y-coordinate-of-my-screen/?p=479665
CoordMode, Mouse, Screen
SetTimer, Check, 20
return

Check:
MouseGetPos, xx, yy
Tooltip %xx%`, %yy%
return

Esc::ExitApp