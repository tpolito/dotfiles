; Main AHK
; Current Date/Time Script
!q::
FormatTime, CurrentDateTime,, yyyy/M/d
SendInput %CurrentDateTime%
return

; Open Notepad++
!n::
Run, notepad++.exe, C:\Program Files\Notepad++
return

; Notion TODO - add a ' ; ' the first line to disable
; CTRL+Enter to create a todo item within notion
!Enter::
Send [] 
return

; Center Active Window
#c::
WinExist("A")
WinGetPos,,, sizeX, sizeY
WinMove, (A_ScreenWidth/2)-(sizeX/2), (A_ScreenHeight/2)-(sizeY/2)
return

; Referance Link - From Adam Learns
::``ref:: 
SendInput (reference) 
SendInput {Left}^+{Left} 
SendInput ^k 
SendInput ^v 
; This is for fixing notion
; SendInput {Enter} 
return

; Discord Remaps
PrintScreen::F13
Pause::F14

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
; Productivity
::``gql::GraphQL
::``clj::Clojure
:::cd::cd Documents/Development/
:::cdb::cd Documents/Development/blog
:::cdd::cd Documents/Development/projects/discord-bot
:::cdnd::cd Documents/Development/projects/dnd-toolkit-2/frontend
:::cdg::cd Documents/Development/game-dev/HideAndSeek
:::cda::cd Documents/Development/tools/ahk
::``co::code .
::``exp::explorer .
::``dev::yarn dev