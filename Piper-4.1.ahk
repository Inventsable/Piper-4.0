; 18/12/14 - Constrict to single file for automatic launch on log-in via Task
; 19/06/22 - Trim all CEP specific generation, add Adobe XD keys to match Illustrator

SendMode Input
SetWorkingDir %A_ScriptDir%
SetNumLockState, AlwaysOn	
global myDoc := "C:\Users\TRSch\OneDrive\Documents"
#SingleInstance Force

VSCodeKeys :=           {"#!Left" : "{{}{Enter}"
                        ,"#!Right" : "{{}{Enter}"
                        ,"^#=" : ":={Space}"
                        ,"!=" : "+1={Space}"
                        ,"#!=" : ".={Space}"
                        ,"^+\" : "MsgBox{Space}+{5}{Space}{Delete}"
                        ,"^!\" : "ToolTip{Space}+{5}{Space}"
                        ,"<!Left" : "{Home}"
                        ,"<!Right" : "{End}"
                        ,"<!Up" : "{Up 5}"
                        ,"<!Down" : "{Down 5}"
                        ,"^RButton" : "^{/}"
                        ,"^Space" : "^+``"
                        ,"!Space" : "^{Space}"}
Hotkey, IfWinActive, ahk_exe Code.exe
bindHotkeysFromKeyMap(VSCodeKeys)
Hotkey, If


; ////// AE 
AfterEffectsKeys :=			{"F13" : "{Enter}"
                        ,"F14" : "^e"
                        ,"F15" : "p"
                        ,"F16" : "s"
                        ,"F17" : "r"
                        ,"XButton2" : "v"
                        ,"XButton1" : "u"
                        ,"F18" : "t"
                        ,"^F13" : "{Delete}"
                        ,"^F14" : "^t"
                        ,"^F15" : "g"
                        ,"^F16" : "q"
                        ,"^F17" : "^{Up}"
                        ,"^XButton2" : "{PgDn}"
                        ,"^XButton1" : "{PgUp}"
                        ,"^F18" : "^{Down}"
                        ,"^MButton" : "^d"
                        ,"+F15" : "k"
                        ,"+F16" : "j"
                        ,"+F17" : "["
                        ,"+F18" : "]"
                        ,"+MButton" : "{F9}"
                        ,"!F13" : "+{F3}"
                        ,"!F14" : "^!k"
                        ,"!F15" : "+!p"
                        ,"!F16" : "+!s"
                        ,"!F17" : "+!r"
                        ,"!F18" : "+!t"
                        ,"^+F13" : "^!{Home}"
                        ,"^+F15" : "^p"
                        ,"^+F16" : "y"
                        ,"^+F17" : "!]"
                        ,"^+F18" : "!["
                        ,"^+MButton" : "^+c"
                        ,"^!F13" : "^i"
                        ,"^!F14" : "^!r"
                        ,"^!F15" : "!{NumpadMult}"
                        ,"^!F16" : "{Home}"
                        ,"^!F17" : "^!{Up}"
                        ,"^!XButton2" : "+{PgDn}"
                        ,"^!XButton1" : "+{PgUp}"
                        ,"^!F18" : "^!{Down}"
                        ,"^!MButton" : "{F4}"
                        ,"+!F13" : "{F4}"
                        ,"+!F14" : "^+d"
                        ,"+!F15" : "b"
                        ,"+!F16" : "n"
                        ,"+!XButton2" : "^+!y"
                        ,"+!XButton1" : "^y"
                        ,"+!MButton" : "^k"
                        ,"+!RButton" : "^l"}
	Hotkey, IfWinActive, ahk_exe AfterFX.exe
	bindHotkeysFromKeyMap(AfterEffectsKeys)
	Hotkey, If

IllustratorKeys := 		  {"F13" : "{Enter}"
                        ,"F14" : "i"
                        ,"F15" : "p"
                        ,"F16" : "s"
                        ,"F17" : "r"
                        ,"XButton2" : "v"
                        ,"XButton1" : "a"
                        ,"MButton" : "+{F7}"
                        ,"^XButton2" : "+{F11}"
                        ,"^XButton1" : "^{F11}"
                        ,"^MButton" : "^g"
                        ,"+F13" : "+w"
                        ,"+F16" : "+o"
                        ,"+F17" : "^7"
                        ,"+F18" : "^8"
                        ,"+XButton2" : "^+{F12}"
                        ,"+XButton1" : "+{F12}"
                        ,"+MButton" : "+m"
                        ,"!F13" : "{F12}"
                        ,"!F14" : "!{F12}"
                        ,"!F15" : "^+{F11}"
                        ,"!F16" : "^+{F10}"
                        ,"!XButton2" : "^+]"
                        ,"!XButton1" : "^+["
                        ,"!MButton" : "^+g"
                        ,"^+XButton2" : "^{F2}"
                        ,"^+XButton1" : "+{F2}"
                        ,"^+F14" : "^+{F9}"
                        ,"^!F13" : "{F8}"
                        ,"^!F14" : "^{F8}"
                        ,"^!F15" : "{F9}"
                        ,"^!F16" : "^{F9}"
                        ,"^!F17" : "^+{F6}"
                        ,"^!XButton2" : "{F10}"
                        ,"^!XButton1" : "{F11}"
                        ,"^!MButton" : "^j"
                        ,"^!RButton" : "^3"
                        ,"+!F13" : "+{F9}"
                        ,"+!F14" : "!{F2}"
                        ,"+!F15" : "^!y"
                        ,"+!F16" : "^!+s"
                        ,"+!F17" : "{F6}"
                        ,"+!F18" : "+{F6}"
                        ,"+!XButton2" : "^{`'}"
                        ,"+!XButton1" : "+^{`'}"
                        ,"+!MButton" : "{F12}"
                        ,"+!RButton" : "^2"
                        ,"^w" : ""}
Hotkey, IfWinActive, ahk_class illustrator
bindHotkeysFromKeyMap(IllustratorKeys)
Hotkey, If

XDKeys := 			        {"F13" : "{Enter}"
                        ,"F14" : "i"           
                        ,"F15" : "p"
                        ,"F16" : "r"
                        ,"F17" : "e"
                        ,"F18" : "y"
                        ,"XButton2" : "v"
                        ,"XButton1" : "a"
                        ,"^F14" : "t"
                        ,"MButton" : "^d"
                        ,"^MButton" : "^g"
                        ,"!MButton" : "^+g"
                        ,"+MButton" : "^k"
                        ,"^!RButton" : "^3"
                        ,"+!RButton" : "^2"
                        ,"!^XButton1" : "+c"
                        ,"!^XButton1" : "+m"
                        ,"^F13" : "{Delete}"}
Hotkey, IfWinActive, Adobe XD
bindHotkeysFromKeyMap(XDKeys)
Hotkey, If

AdobeMenuKeys := 				{"F13" : "{Enter}"
                        ,"XButton2" : "{Tab}"
                        ,"XButton1" : "+{Tab}"}
Hotkey, IfWinActive, ahk_class #32770
bindHotkeysFromKeyMap(AdobeMenuKeys)
Hotkey, If


; //// Chrome
ChromeKeys := 					{"F13" : "^e"
                        ,"F14" : "^t"
                        ,"^F14" : "^+b"
                        ,"F15" : "^{PgUp}"
                        ,"F16" : "^{PgDn}"
                        ,"F18" : "^+i"
                        ,"^F18" : "^u"
                        ,"XButton1" : "{XButton1}"
                        ,"XButton2" : "{XButton2}"}
Hotkey, IfWinActive, ahk_exe chrome.exe
bindHotkeysFromKeyMap(ChromeKeys)
Hotkey, If

; @@ KEYMAPS
KeySet(msg) {
	SendInput, % msg
}

bindHotkeysFromKeyMap(KeyMap) {
	for keybind, command in KeyMap {
		bf  :=  Func("KeySet").bind(command)
		; bf  :=  command   ; for labels/functions rather than input
		Hotkey, % keybind, % bf, On
	}
}


sendTool(keyTo, keyFrom) {
	KeyWait %keyFrom%
	Send, %keyTo%  
}

winSnap(direction) {
    hwnd := winexist("a")
    WinGetActiveStats, thisTitle, thisW, thisH, thisX, thisY
    WinGetClass, thisClass, ahk_id %hwnd%
    WinGet, WinExe, ProcessName, ahk_id %hwnd%
    WinGetPos,,,trayW, trayH, ahk_class Shell_TrayWnd
	if (thisX > 0) {
		if (direction = "Right") {
			if ((thisW != (A_ScreenWidth/2)) || (thisH != (A_ScreenHeight - trayH)) || (thisX != (A_ScreenWidth/2)) || (thisY != 0)) {
				prevX := thisX, prevY := thisY, prevW := thisW, prevH := thisH
				WinMove, ahk_exe %WinExe%,, (A_ScreenWidth/2), 0, (A_ScreenWidth/2), (A_ScreenHeight - trayH)
			} else {
				WinMove, ahk_exe %WinExe%,, %prevX%, %prevY%, %prevW%, %prevH%
			}
		} else if (direction = "Left") {
			if ((thisW != (A_ScreenWidth/2)) || (thisH != (A_ScreenHeight - trayH)) || (thisX != 0) || (thisY != 0)) {
				prevX := thisX, prevY := thisY, prevW := thisW, prevH := thisH
				WinMove, ahk_exe %WinExe%,, 0, 0, (A_ScreenWidth/2), (A_ScreenHeight - trayH)
			} else {
				WinMove, ahk_exe %WinExe%,, %prevX%, %prevY%, %prevW%, %prevH%
			}
		}
	} else {
		if (direction = "Right") {
			if ((thisW != (A_ScreenWidth/2)) || (thisH != (A_ScreenHeight - trayH)) || (thisX != (A_ScreenWidth/2 * (-1))) || (thisY != 0)) {
				prevX := thisX, prevY := thisY, prevW := thisW, prevH := thisH
				WinMove, ahk_exe %WinExe%,, -1536, 0, 1536, 1668
			} else {
				WinMove, ahk_exe %WinExe%,, %prevX%, %prevY%, %prevW%, %prevH%
			}
		} else if (direction = "Left") {
			if ((thisW != (A_ScreenWidth/2)) || (thisH != (A_ScreenHeight - trayH)) || (thisX != (A_ScreenWidth * (-1))) || (thisY != 0)) {
				prevX := thisX, prevY := thisY, prevW := thisW, prevH := thisH
				WinMove, ahk_exe %WinExe%,, -3072, 0, 1536, 1668
			} else {
				WinMove, ahk_exe %WinExe%,, %prevX%, %prevY%, %prevW%, %prevH%
			}
		}
		 
	}
}


; Default
#Enter::Return
^#Enter::Return
#RShift::Return
#F16::Return
~LWin::Send {Blind}{vk07}
#F15 Up::Send, {LWinDown}{Up}{LWinUp}{Up Up}
#F17 Up::Send, {LWinDown}{d}{LWinUp}{d Up}
!+^Enter:: Send, {PrintScreen}

#XButton1::winSnap("Right")
#XButton2::winSnap("Left")

#IfWinActive, ahk_class illustrator
^F13:: Send, {Delete}
^F14:: sendTool("t", "LControl")
^F15:: sendTool("m", "LControl")
^F16:: sendTool("l", "LControl")
^F17:: sendTool("5", "LControl")
^F18:: sendTool("o", "LControl")
+F14:: sendTool("k", "LShift")
+F15:: sendTool("w", "LShift")
^+F14:: sendTool("8", "LShift")


#If WinActive("(?i).*\.(js||vue)")
:B0:forloop::
	; MsgBox % "hello"
    lastClip := Clipboard
	ClipWait, 1, 1
	KeyWait, Space
	KeyWait, Space, D
	KeyWait, Space
	KeyWait, Space, D
	KeyWait, Space
	Send, {bs}+{Home}
	Sleep, 50
	Send, ^x
	Sleep, 50
	ClipWait, 1, 1
	result := StrSplit(Clipboard, A_Space)
	length := result[3]
	root := result[2]
	Send % "for (let " . root . " = 0; " . root . " < " . length . "; " . root
	Send, +=+={)}{Space}{{}{Enter}
	target := StrReplace(length, ".length", "[" . root . "];")
	Send % "= " . target
	Send, {Home}
	Send % "const "
	Send, {Space}{Left}
	KeyWait, Space
	KeyWait, Space, D
	Send, {bs}{End}{Enter}
	Clipboard := lastClip
	ClipWait, 1, 1
Return

#If WinActive("(?i).*\.(jsx||ts)")
:B0:forloop::
    lastClip := Clipboard
	ClipWait, 1, 1
	KeyWait, Space
	KeyWait, Space, D
	KeyWait, Space
	KeyWait, Space, D
	KeyWait, Space
	Send, {bs}+{Home}
	Sleep, 50
	Send, ^x
	Sleep, 50
	ClipWait, 1, 1
	result := StrSplit(Clipboard, A_Space)
	length := result[3]
	root := result[2]
	Send % "for (var " . root . " = 0; " . root . " < " . length . "; " . root
	Send, +=+={)}{Space}{{}{Enter}
	target := StrReplace(length, ".length", "[" . root . "];")
	Send % "= " . target
	Send, {Home}
	Send % "var "
	Send, {Space}{Left}
	KeyWait, Space
	KeyWait, Space, D
	Send, {bs}{End}{Enter}
	Clipboard := lastClip
	ClipWait, 1, 1
Return

#If WinActive("(?i).*\.vue")
:B0:vuetag::
	KeyWait, Space
	KeyWait, Space, D
	KeyWait, Space
	Send, ={Space}`;{Left}
return

#If

^#MButton::
    runScript("Piper-4.1", myDoc . "\Piper-4.0")
Return

^#F13::
    runScript("WindowSpy", "C:\Program Files\AutoHotkey")
Return

runScript(scriptName, scriptPath) {
	Run, % scriptName ".ahk", % scriptPath
}

^Esc::Reload