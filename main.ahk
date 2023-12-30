#SingleInstance Force

; Center Active Window - Win + C
#c::CenterWindow("A")
; CTRL + ALT + num
^!1::CenterWindowAtSpecifcSize("A",1934, 1087)
^!2::CenterWindowAtSpecifcSize("A",1755, 973)

CenterWindow(WinTitle)
{
  WinGetPos ,, &Width, &Height, WinTitle
  WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, WinTitle
}

CenterWindowAtSpecifcSize(WinTitle, NewWidth, NewHeight)
{
  WinGetPos ,, &Width, &Height, WinTitle
  WinMove ,,NewWidth,NewHeight, WinTitle
  CenterWindow(WinTitle)
}
