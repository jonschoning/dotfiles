SetTitleMatchMode 2
	
!^s::
if WinExist("ahk_class EVERYTHING") 
	WinActivate
else
	Run C:\Program Files (x86)\Everything\Everything.exe
return

!^b::
if WinExist("ahk_class VirtualConsoleClass") 
	WinActivate
else
	Run "C:\Program Files\ConEmu\ConEmu64.exe"
return

!^c::
if WinExist("- Google Chrome")
    WinActivate
else
    Run "C:\Users\Jon\AppData\Local\Google\Chrome SxS\Application\chrome.exe"
return

!^v::
if WinExist("ahk_class Vim")
    WinActivate                ahk_exe slack.exe
return

!^k::
if WinExist("gitk")
    WinActivate
return

!^u::
if WinExist("ahk_exe devenv.exe")
    WinActivate
return

!^f::
if WinExist("ahk_exe firefox.exe")
    WinActivate
return

!^o::
if WinExist("ahk_exe Code.exe")
    WinActivate
return

!^a::
if WinExist("ahk_exe slack.exe")
    WinActivate
return

!^z::
if WinExist("ahk_class ZPContentViewWndClass")
    WinActivate
else if WinExist("ahk_class ZPPTMainFrmWndClassEx")
    WinActivate
return


!^y::
Run "C:\Program Files\AutoHotkey\WindowSpy.ahk"
return
;!^o::
;if WinExist("ahk_class rctrl_renwnd32")
;    WinActivate
;  else
;   Run "C:\Program Files (x86)\Microsoft Office\Office14\OUTLOOK.EXE"        
;return

;!^w::
;if WinExist("ahk_class OpusApp")
;    WinActivate
;  else
;   RUN "c:\program files (x86)\Microsoft Office\Office14\winword.exe"
;return

;!^p::
;if WinExist("ahk_class SUMATRA_PDF_FRAME")
;	WinActivate
;return

;+^v::
;WinGetActiveTitle, VimTargetWindow
;SendInput ^c
;RunWait c:\Program Files (x86)\Vim\vim74\gvim.exe --servername ClipBrd +ClipBrd +only
;If not ErrorLevel
;{
;    WinActivate %VimTargetWindow%
;    Sleep 10
;    SendInput ^v
;}
;return

;!^v::Run "C:\Program Files (x86)\Sysinternals\Dbgview.exe"


;+!^u:: SendRaw % CreateGUID()
;CreateGuid()
;{
;	VarSetCapacity(bGuid, 16,0)
;	VarSetCapacity(sGuid, 76)
;	
;	dllcall("ole32.dll\CoCreateGuid", uint,  &bGuid)
;	x := dllcall("ole32.dll\StringFromGUID2", "uint", &bGuid, "str", sGuid, "int", 76)
;	
;	Loop 76
;	 UUID .= (Mod(A_Index,2) = 1) ? Chr( *(&sGuid+(A_Index-1)) ) : ""
;	
;	StringMid, UUID_s, UUID, 2, 36
;	Return UUID_s
;}

:c*:Q@@::xxx
:c*:Q@#::xxx
:c*:Q#$::xxx
:c*:Q#!::xxx
:c*:Q$$::xxx
:c*:Q$%::xxx

