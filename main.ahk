; Main AHK

; Current Date/Time Script
!q::
FormatTime, CurrentDateTime,, yyyy/M/d
SendInput %CurrentDateTime%
return

; Opens Dev Tools in Chrome
^!g::
SendInput {F12}
return

; Open Notepad++
!n::
Run, notepad++.exe, C:\Program Files\Notepad++
return

; Open TODO File folder on GDrive
!t::
Run, "C:\Program Files\Microsoft VS Code\Code.exe" "G:\My Drive\Documents\todo\TODO\TODO.todo"
return

; Open TODO File folder on GDrive
!m::
Run, "C:\Program Files\Microsoft VS Code\Code.exe" "G:\My Drive\Documents\todo\TODO\work.todo" 
return

; Open scratchpad.md file on GDrive
!y::
Run, "C:\Program Files\Microsoft VS Code\Code.exe" "G:\My Drive\Documents\todo\scratchpad.md"
return

; Notion TODO - add a ' ; ' the first line to disable
; CTRL+Enter to create a todo item within notion
!Enter::
Send [] 
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
::``js::javascript
::``Js::Javascript
::``ts::typescript
::``Ts::Typescript
::``gql::GraphQL
::`clj::Clojure
:::cd::cd Documents/Development/
:::cdb::cd Documents/Development/blog
:::cda::cd Documents/Development/tools/ahk
::``co::code .
::``exp::explorer .
::``imp::import {} from ''