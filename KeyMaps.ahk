SetTitleMatchMode, 2
SetDefaultMouseSpeed, 3
global prevX, prevY, prevW, prevH

; These need to be RegEx/Code Specific for code gen and nav-specific for Code.exe
VSCodeKeys :=                   {"#!Left" : "{{}{Enter}"
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
                                ,"^Space" : "^+``"}
Hotkey, IfWinActive, ahk_exe Code.exe
bindHotkeysFromKeyMap(VSCodeKeys)
Hotkey, If

IllustratorKeys := 				{"F13" : "{Enter}"
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
								,"!F15" : "{F3}"
								,"!F16" : "{F5}"
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

; ///// Atom
SetTitleMatchMode, RegEx
HTMLKeys :=				  		{"^Numpad7" : "<link href=""./resources/css/style.css"" type=""text/css"" rel=""stylesheet"">"
								,"<!Left" : "{Home}"
								,"<!Right" : "{End}"
								,"^RButton" : "^/"}
Hotkey, IfWinActive, (?i).*\.html
bindHotkeysFromKeyMap(HTMLKeys)
Hotkey, If

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

nextLayer() {
	static layers := ["HTML", "CSS", "JavaScript"]
	static index
	++index
	if (index > layers.MaxIndex()) {
		index := 1
	}
	return layers[index]
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
; ~LAlt::Send {Blind}{vk07}
; #XButton1::Send, {LWinDown}{Right}{LWinUp}
; #XButton2::Send, {LWinDown}{Left}{LWinUp}
#F15 Up::Send, {LWinDown}{Up}{LWinUp}{Up Up}
#F17 Up::Send, {LWinDown}{d}{LWinUp}{d Up}

#XButton1::winSnap("Right")
#XButton2::winSnap("Left")


; ^F24::Send, 
; !F24::Send, 

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



#If WinActive("(?i).*\.(js||ts)")
:B0:forloop::
    lastClip := Clipboard
	KeyWait, Space
	KeyWait, Space, D
	KeyWait, Space
	Send, {bs}+{Home}
	Sleep, 50
	Send, ^x
	Sleep, 50
	ClipWait, 1, 1
	result := StrSplit(Clipboard, A_Space)
	length := result[2]
	Send % "for (var i = 0; i < " . length . "; i"
	Send, +=+={)}{Space}{{}{Enter}
    Clipboard := lastClip
Return

#If WinActive("(?i).*\.vue")
:B0:vuetag::
	KeyWait, Space
	KeyWait, Space, D
	KeyWait, Space
	Send, ={Space}`;{Left}
return

#If



; !F24::
; If !WinExist(ahk_exe recorder.exe) {
; 	Run, C:\Program Files (x86)\Icecream Screen Recorder\recorder.exe
; }
; 	toggle := !toggle
; 	if (toggle) {
; 		Send, ^+!{F11}	
; 	} else {
; 		Send, ^+!{F12}
; 	}
; Return