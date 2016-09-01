; Keyboard Goodies
; An AutoHotkey keyboard enhancement script
; -----------------------------------------
;
; Functionality
; -------------
; - Deactivates Caps Lock for normal (accidental) use.
;
; - To use Caps Lock as you normally would, you can press Win Key + Caps Lock
;
; - Access the following functions when pressing Caps Lock: 
;     Cursor Keys             - i, j, k, l (Up, Left, Down, Right - just like w, a, s, d)
;     Home, End               - h, ;
;			PgUp, PgDn              - u, o
;     Backspace, Delete       - n, m
;     Insert                  - b or Insert (The insert key is deactivated by default.)
;     Undo                    - ,
;     Redo                    - .
;
;     Space                   - Enter
;
;     Select all              - a
;     Cut, Copy, Paste        - s, d, f
;     Esc                     - r
;     Close Tab               - t
;     Previous Tab, Next Tab  - Tab, q
;     Close Window            - v
;  
; - Hold Capslock and drag anywhere in a window to move it (not just the title bar).
;
;
; #Acknowledgements
; -----------------
; This script is mostly assembled from modified versions of the following awesome scripts:
;
; #Caps Lock Remap by Danik
; https://gist.github.com/Danik/5808330/raw/d572399237ee5f1ccb3a50ba7ae3ebdc0df71883/capslock_remap_alt.ahk
; More info at http://danikgames.com/blog/?p=714
;
; # Home Row Computing by Gustavo Duarte: http://duartes.org/gustavo/blog/post/home-row-computing for 
; Changes: 
; - Does not need register remapping of AppsKey using SharpKeys.
; - Uses normal cursor key layout 
; - Added more hotkeys for insert, undo, redo etc.
;
; # Get the Linux Alt+Window Drag Functionality in Windows: http://www.howtogeek.com/howto/windows-vista/get-the-linux-altwindow-drag-functionality-in-windows/
; Changes: The only change was using Capslock instead of Alt. This also removes problems in certain applications.
;
; #Other resources
; https://github.com/jNizM/ahk_notepad-plus-plus
; https://autohotkey.com/boards/viewtopic.php?t=50


; And now, the script!

; Keep this script running always.
#Persistent

; Deactivate the Caps Lock key by default.
SetCapsLockState, AlwaysOff


; Cursor keys
; Caps Lock + i, j, k, l (Up, Left, Down, Right)
Capslock & i::Send {Blind}{Up DownTemp}
Capslock & i up::Send {Blind}{Up Up}

Capslock & j::Send {Blind}{Left DownTemp}
Capslock & j up::Send {Blind}{Left Up}

Capslock & k::Send {Blind}{Down DownTemp}
Capslock & k up::Send {Blind}{Down Up}

Capslock & l::Send {Blind}{Right DownTemp}
Capslock & l up::Send {Blind}{Right Up}


; Home
; Caps Lock + h
Capslock & h::SendInput {Blind}{Home Down}
Capslock & h up::SendInput {Blind}{Home Up}

; End
; Caps Lock + ;
Capslock & `;::SendInput {Blind}{End Down}
Capslock & `; up::SendInput {Blind}{End Up}


; Page Up
; Caps Lock + u;
Capslock & u::SendInput {Blind}{PgUp Down}
Capslock & u up::SendInput {Blind}{PgUp Up}

; Page Down
; Caps Lock + o
Capslock & o::SendInput {Blind}{PgDn Down}
Capslock & o up::SendInput {Blind}{PgDn Up}


; Backspace
; Caps Lock + n
Capslock & n::SendInput {Blind}{BS Down}
Capslock & BS::SendInput {Blind}{BS Down}

; Delete
; Caps Lock + m
Capslock & m::SendInput {Blind}{Del Down}


; Insert - The Insert key is deactivated by default.
; https://autohotkey.com/board/topic/63368-can-i-disable-the-insert-key/
$Insert::return
;!Insert::Send, {Insert} ; This would allow toggling insert mode with the Alt key, but we're using Caps Lock + b

; Insert
; Caps Lock + b
Capslock & b::SendInput {Blind}{Insert Down}

; Insert
; Also allow CapsLock + Insert to work
Capslock & Insert::SendInput {Insert Down}


; Undo
; Caps Lock + ,
Capslock & ,::SendInput {Ctrl Down}{z Down}
Capslock & , up::SendInput {Ctrl Up}{z Up}

; Redo
; Caps Lock + .
Capslock & .::SendInput {Ctrl Down}{Shift Down}{z Down}
Capslock & . up::SendInput {Ctrl Up}{Shift Up}{z Up}

; Redo alternate (Ctrl+Y)
;Capslock & .::SendInput {Ctrl Down}{y Down}
;Capslock & . up::SendInput {Ctrl Up}{y Up}


; Select All
; Caps Lock + a
Capslock & a::SendInput {Ctrl Down}{a Down}
Capslock & a up::SendInput {Ctrl Up}{a Up}

; Cut
; Caps Lock + .
Capslock & s::SendInput {Ctrl Down}{x Down}
Capslock & s up::SendInput {Ctrl Up}{x Up}

; Copy
; Caps Lock + .
Capslock & d::SendInput {Ctrl Down}{c Down}
Capslock & d up::SendInput {Ctrl Up}{c Up}

; Paste
; Caps Lock + .	
Capslock & f::SendInput {Ctrl Down}{v Down}
Capslock & f up::SendInput {Ctrl Up}{v Up}


; Escape
; Caps Lock + r	
Capslock & r::SendInput {Blind}{Esc Down}


; Enter
; Make Caps Lock + Space -> Enter
Capslock & Space::SendInput {Enter Down}


; Previous Tab
; Caps Lock + Tab
Capslock & Tab::SendInput {Ctrl Down}{Shift Down}{Tab Down}
Capslock & Tab up::SendInput {Ctrl Up}{Shift Up}{Tab Up}

; Next Tab
; Caps Lock + q
Capslock & q::SendInput {Ctrl Down}{Tab Down}
Capslock & q up::SendInput {Ctrl Up}{Tab Up}

; Close Tab
; Caps Lock + t
Capslock & t::SendInput {Ctrl down}{F4}{Ctrl up}

; Close Window
; Caps Lock + v
Capslock & v::SendInput {Alt down}{F4}{Alt up}


/*
; Not using these...
; Make Caps Lock & Enter equivalent to Control+Enter
Capslock & Enter::SendInput {Ctrl down}{Enter}{Ctrl up}

; Make Capslock & Alt Equivalent to Control+Alt
!Capslock::SendInput {Ctrl down}{Alt Down}
!Capslock up::SendInput {Ctrl up}{Alt up}
*/


; Make Win Key + Caps Lock work like Caps Lock
#Capslock::
If GetKeyState("CapsLock", "T") = 1
    SetCapsLockState, AlwaysOff
Else 
    SetCapsLockState, AlwaysOn
Return

; Window dragging helper
; Drag windows (foreground or background!) anywhere by holding Caps Lock and then clicking anywhere in the window and dragging.
;
; This script modified from the original: http://www.autohotkey.com/docs/scripts/EasyWindowDrag.htm
; by The How-To Geek http://www.howtogeek.com 
Capslock & LButton::
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
if EWD_WinState = 0  ; Only if the window isn't maximized 
    SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U  ; Button has been released, so drag is complete.
{
	SetTimer, EWD_WatchMouse, off
	return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
{
	SetTimer, EWD_WatchMouse, off
	WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
	return
}
; Otherwise, reposition the window to match the change in mouse coordinates
; caused by the user having dragged the mouse:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1   ; Makes the below move faster/smoother.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY
return