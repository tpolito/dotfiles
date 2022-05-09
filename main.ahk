 ; Main AHK
; Current Date/Time Script
^!q::
FormatTime, CurrentDateTime,, yyyy-M-d
SendInput %CurrentDateTime%
return

; Open Notepad++
^!n::
Run, notepad++.exe, C:\Program Files\Notepad++
return

; Center Active Window
#c::
WinExist("A")
WinGetPos,,, sizeX, sizeY
WinMove, (A_ScreenWidth/2)-(sizeX/2), (A_ScreenHeight/2)-(sizeY/2)
return

; CapsLock -> Ctrl
$CapsLock::Ctrl

; Rebind for big keyboards
; (Currently I'm using power toys for this, becasue the ` being the ahk escape character was causing issues)
; $`::Esc

; +Esc::
; SendInput, `````

#!^Left::
#+z::
SysGet, m, MonitorWorkArea 
WinMove, A,, 0, 0, mRight/2, mBottom 
return

#!^Right::
#z:: 
SysGet, m, MonitorWorkArea 
WinMove, A,, mRight/2, 0, mRight/2, mBottom 
return

; Discord Remaps
; F13 - Mute / F14 - Mute & Deafen
PrintScreen::F13
Pause::F14
NumpadHome::F13
NumpadUp::F14

; Select Current Line
!a:: SelectCurrentLine()

SelectCurrentLine() {
  SendInput {End}
  SendInput +{Home}
}

getSelectedText() {
   ; See if selection can be captured without using the clipboard.
    WinActive("A")
    ControlGetFocus ctrl
    ControlGet selectedText, Selected,, %ctrl%

    ;If not, use the clipboard as a fallback.
    If (selectedText = "") {
        originalClipboard := ClipboardAll ; Store current clipboard.
        Clipboard := ""
        SendInput ^c
        ClipWait .2
        selectedText := ClipBoard
        ClipBoard := originalClipboard
    }

    Return selectedText
}