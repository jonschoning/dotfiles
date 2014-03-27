SetTitleMatchMode 2
	
!^s::
if WinExist("ahk_class EVERYTHING") 
	WinActivate
else
	Run C:\Program Files (x86)\Everything\Everything.exe
return

!^i::
if WinExist("ahk_class IEFrame") 
	WinActivate
else
	Run "C:\Program Files\Internet Explorer\iexplore.exe"
return

!^a::Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\AutoIt3 Window Spy.lnk"

!^t::Run "C:\Program Files (x86)\TechSmith\SnagIt 9\SnagIt32.exe"

!^x::RUN "c:\program files (x86)\Microsoft Office\Office14\excel.exe"

!^d::Run "C:\Program Files (x86)\Clipdiary\ClipDiary.exe"

!^g::
if WinExist("gitk")
    WinActivate
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
      Run "C:\Users\v-jon.schoning\AppData\Local\Google\Chrome SxS\Application\chrome.exe"
;     Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
return

!^o::
if WinExist("ahk_class rctrl_renwnd32")
    WinActivate
  else
   Run "C:\Program Files (x86)\Microsoft Office\Office14\OUTLOOK.EXE"        
return

!^w::
if WinExist("ahk_class OpusApp")
    WinActivate
  else
   RUN "c:\program files (x86)\Microsoft Office\Office14\winword.exe"
return

!^v::
if WinExist("ahk_class Vim")
    WinActivate
; else
;   Run "C:\Program Files\vim73\gvim.exe"
return

!^p::
if WinExist("ahk_class SUMATRA_PDF_FRAME")
	WinActivate
return

+^v::
WinGetActiveTitle, VimTargetWindow
SendInput ^c
RunWait c:\Program Files (x86)\Vim\vim74\gvim.exe --servername ClipBrd +ClipBrd +only
If not ErrorLevel
{
    WinActivate %VimTargetWindow%
    Sleep 10
    SendInput ^v
}
return

+!^v::
if WinExist("Microsoft Visual Studio (Administrator)")
    WinActivate
return

;!^v::Run "C:\Program Files (x86)\Sysinternals\Dbgview.exe"

:c*:Q@@::xxx
:c*:Q@#::xxx
:c*:Q#$::xxx
:c*:Q#!::xxx
:c*:Q$$::xxx
:c*:Q$%::xxx


+!^u:: SendRaw % CreateGUID()
CreateGuid()
{
	VarSetCapacity(bGuid, 16,0)
	VarSetCapacity(sGuid, 76)
	
	dllcall("ole32.dll\CoCreateGuid", uint,  &bGuid)
	x := dllcall("ole32.dll\StringFromGUID2", "uint", &bGuid, "str", sGuid, "int", 76)
	
	Loop 76
	 UUID .= (Mod(A_Index,2) = 1) ? Chr( *(&sGuid+(A_Index-1)) ) : ""
	
	StringMid, UUID_s, UUID, 2, 36
	Return UUID_s
}


