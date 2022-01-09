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

; Delete Current Line - This is currently crashing AHK, no idea why
; !k:: DeleteCurrentLine()

DeleteCurrentLine() {
  SelectCurrentLine()

  If getSelectedText() = "" {
    ; We are on a empty line
    SendInput {Delete}
  } Else {
    SendInput ^+{Left}
    SendInput {Delete}
  }
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

; Mouse 4 & 5 Remaps
;Button1::F17
;XButton2::F17

; Text Expansion
; Typos
::nad::and
::hte::the
::ti::it
::fo::of
::fro::for
::ahve::have
::cosnt::const
::ahd::had
::cahce::cache
::thrid::third
; Can't Spell
::``misc::miscellaneous
::``Misc::Miscellaneous
::``res::restaurant
::``uf::unfortunately
::``gu::guaranteed
::``li::license
::``lis::licenses
::``appr::appreciate