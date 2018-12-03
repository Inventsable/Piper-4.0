SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetNumLockState, AlwaysOn	
global vCurX, vCurY, hWnd, vCtlClassNN
global _hwnd := "", 
global _title := ""
global MasterTitle := ""
global myDoc := "C:\Users\TRSch\OneDrive\Documents"
#SingleInstance Force
#Include KeyMaps.ahk
#Include CEPdev.ahk

^#F17::	
    Gosub, KillAHKs
    runScript("Piper 4.0", myDoc . "\Piper 4.0")
Return

^#MButton::
    runScript("Piper 4.0", myDoc . "\Piper 4.0")
Return

^#F14::
    ; runScript("guiTest", myDoc . "\AHK\iconFontGUI")
Return 


^#F13::
    ; runScript("MiniSpy", myDoc . "\Piper 4.0\MiniSpy")
    runScript("WindowSpy", "C:\Program Files\AutoHotkey")
Return

~*LButton::
~*RButton::
~*LButton Up::
~*RButton Up::
    WinGetActiveTitle, ClickTitle
        if !(ClickTitle = _ClickTitle) {
            _ClickTitle := ClickTitle
            gosub foolproof
        }
Return

currentwindow:		
    hwnd := winexist("a")
    if !(hwnd = _hwnd) {
        _hwnd := hwnd
        gosub foolproof
    }
Return

foolproof:
    ; ++WinChange
    hwnd := winexist("a")
    WinGetClass, WinClass, ahk_id %hwnd%
    WinGetTitle, WinTitle, ahk_id %hwnd%
    WinGet, WinExe, ProcessName, ahk_id %hwnd%
    ; MasterTitle := WinTitle
    ; MsgBox % WinTitle
    ; 
Return

runProg(WindowTitle, exeName, exePath) {
	If !WinExist(WindowTitle) {
		Run, % exeName, % exePath
	} Else {
		WinActivate, % WindowTitle
	}
}

runScript(scriptName, scriptPath) {
	Run, % scriptName ".ahk", % scriptPath
}

exploreFile(WindowTitle, exePath) {
	If !WinExist(WindowTitle) {
		Run, % "explore " exeName, % exePath
	} Else {
		WinActivate, % WindowTitle
	}
}


showFile(WindowTitle, exeName, exePath) {
	If !WinExist(WindowTitle) {
		Run, % exeName, % exePath
	} Else {
		WinActivate, % WindowTitle
	}
	Return
}

; @wolf_II
; https://autohotkey.com/boards/viewtopic.php?p=102103#p102103
;Script("Full\Path\to\Script.ahk", "Edit")
Script(Script, Action) { ; use tray icon actions of a running AHK script
    static a := { Open: 65300, Help:    65301, Spy:   65302, Reload: 65303
                , Edit: 65304, Suspend: 65305, Pause: 65306, Exit:   65307 }
    DetectHiddenWindows, On
    PostMessage, 0x111, % a[Action],,, %Script% - AutoHotkey
}

; @Lexikos
; https://autohotkey.com/board/topic/69611-conditional-singleinstance-force/?p=441099
KillAHKs:
    DetectHiddenWindows On ; List all running instances of this script:
    WinGet instances, List, ahk_class AutoHotkey
    if (instances > 1) { ; There are 2 or more instances of this script.
        this_pid := DllCall("GetCurrentProcessId"),  closed := 0
        Loop % instances { ; For each instance,
            WinGet pid, PID, % "ahk_id " instances%A_Index%
            if (pid != this_pid) { ; If it's not THIS instance,
                WinClose % "ahk_id " instances%A_Index% ; close it.
                closed += 1
            }
        }
    }
Return

^Esc::Reload