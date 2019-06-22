; 19/06/14 - Trimming unused functions, prepping for laptop use and slimmer keyboard
; Removing F19 - F24 specific keys

SendMode Input
SetWorkingDir %A_ScriptDir%
SetNumLockState, AlwaysOn	
global vCurX, vCurY, hWnd, vCtlClassNN
global _hwnd := "", 
global _title := ""
global MasterTitle := ""
global myDoc := "C:\Users\TRSch\OneDrive\Documents"
#SingleInstance Force


; No longer included, search @@ to find here instead
; #Include KeyMaps.ahk
; #Include CEPdev.ahk


; These need to be RegEx/Code Specific for code gen and nav-specific for Code.exe
VSCodeKeys :=   {"#!Left" : "{{}{Enter}"
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
AfterEffectsKeys :=				{"F13" : "{Enter}"
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

XDKeys := 			{"F13" : "{Enter}"
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

; ///// REPLACE WITH CODE SPECIFIC HOTKEYS
; SetTitleMatchMode, RegEx
; HTMLKeys :=				  		{"^Numpad7" : "<link href=""./resources/css/style.css"" type=""text/css"" rel=""stylesheet"">"
; 								,"<!Left" : "{Home}"
; 								,"<!Right" : "{End}"
; 								,"^RButton" : "^/"}
; Hotkey, IfWinActive, (?i).*\.html
; bindHotkeysFromKeyMap(HTMLKeys)
; Hotkey, If

^#F17::	
    Gosub, KillAHKs
    runScript("Piper-4.1", myDoc . "\Piper-4.0")
Return

^#MButton::
		MsgBox What the fuck
    runScript("Piper-4.1", myDoc . "\Piper-4.0")
Return

^#F14::
    ; runScript("guiTest", myDoc . "\AHK\iconFontGUI")
Return 

^#F13::
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

; #IfWinActive, Adobe XD
; ^F14:: sendTool("t", "LControl")


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


convertSlashes(path) {
  Return StrReplace(path, "\", "/")
}

tempNum() {
	filecount = 0
	dest := A_AppData . "\Adobe\CEP\extensions\_certs\*.p12"
	Loop, Files, %dest%
		filecount++
	Return filecount
}


!^+Insert::
Send, {PrintScreen}
return

^+!Del::
F20::
NewCEPBuild:
	InputBox, fullPath, Full path to extension:,,,, 100
	if ErrorLevel {
		MsgBox, 16, Aborting, Aborting CEP build  
		Return
	}
	thisRepo := RegExReplace(fullPath, "(\w|\\|\:)*\\", "")
	thisRoot := SubStr(fullPath, 1, StrLen(fullPath) - StrLen(thisRepo))
	clone := thisRoot . thisRepo . "temp"
	cloneAlreadyExists := InStr(FileExist(clone . "\_builds"), "D")
	if (cloneAlreadyExists) {
		FileRemoveDir, % clone, 1
		If ErrorLevel {
			MsgBox % 16,, Remove clone failed
		}
	}
	FileCopyDir, % fullPath, % clone

	buildcount = 0
	hasOmitPath := [clone . "\_builds", clone . "\.git", clone . "\sandbox", clone . "\node_modules"]
	Loop % hasOmitPath.length() {
		thisPath := hasOmitPath[A_Index]
		thisState := InStr(FileExist(thisPath), "D")
		if (thisState) {
			if (InStr(thisPath, "builds")) {
				Loop, Files, % thisPath . "\*.zxp"
					buildcount++
			}
			FileRemoveDir, % thisPath, 1
			If ErrorLevel {
				MsgBox % 16,, % "Remove " . A_Index . " failed"
			}
		}
	}
	hasILST := InStr(FileExist(clone . "\host\ILST"), "D")
	hasAEFT := InStr(FileExist(clone . "\host\AEFT"), "D")
	hasPHXS := InStr(FileExist(clone . "\host\PHXS"), "D")
	hasHost := [hasILST, hasAEFT, hasPHXS]
	isHost := ["ILST", "AEFT", "PHXS"]
	Loop % hasHost.length() {
		thisHost := isHost[A_Index]
		FileDelete, % clone . "\host\" . thisHost . "\host.ts"
		FileDelete, % clone . "\host\" . thisHost . "\tsconfig.json"
	}

	hasGlobals := [clone . "\package.json", clone . "\package-lock.json", clone . "\.gitignore", clone . "\tsconfig.json"]
	Loop % hasGlobals.length() {
		thisState := FileExist(hasGlobals[A_Index])
		if (thisState) {
			FileDelete, % hasGlobals[A_Index]
			if ErrorLevel {
				MsgBox % "Deleting global " . A_Index . " failed"
			}
		}
	}

	hasDead := [clone . "\client\dead.css", clone . "\client\dead.js"]
	Loop % hasDead.length() {
		thisState := FileExist(hasDead[A_Index])
		if (thisState) {
			FileDelete, % hasDead[A_Index]
			if ErrorLevel {
				MsgBox % "Deleting dead " . A_Index . " failed"
			}
		}
	}

	hasIcons := InStr(FileExist(clone . "\assets\icons"), "D")
	if (hasIcons) {
		FileRemoveDir, % clone . "\assets\icons", 1
		if ErrorLevel {
			MsgBox % "Deleting icon folder failed"
		}
	}

	hasVSCconfig := InStr(FileExist(clone . "\.vscode"), "D")
	if (hasVSCconfig) {
		FileRemoveDir, % clone . "\.vscode", 1
		if ErrorLevel {
			MsgBox % "Deleting vscode config folder failed"
		}
	}

	svgs = 0
	Loop, Files, % clone . "\assets\*.svg"
		svgs++
	if (svgs > 0) {
		FileDelete, % clone . "\assets\*.svg"
		if ErrorLevel {
			MsgBox % "Deleting the " . svgs . " .svg files failed"
		}
	}

	markdowns = 0
	Loop, Files, % clone . "\*.md"
		markdowns++
	if (markdowns > 0) {
		FileDelete, % clone . "\*.md"
		if ErrorLevel {
			MsgBox % "Deleting the " . markdowns . " .md files failed"
		}
	}

	builder := (buildcount < 10) ? "1.0" . buildcount++ : "1." . buildcount++
	writeBuildNumber(clone, builder)
	newBuild := autoSignUltra(thisRepo, builder)
	buildPath := A_AppData . "\Adobe\CEP\extensions\_builds\" . newBuild
	buildTarget := fullPath . "\_builds\" . newBuild

	MsgBox, 4,, Append this permanent version?
	IfMsgBox, Yes 
	{
		FileCopy, % buildPath, % buildTarget
		If ErrorLevel {
			MsgBox % 16,, % "Final copy failed"
		}
		MsgBox % newBuild . " is a ready as a production build"
	} else {
		MsgBox % newBuild . " is a ready as a temporary build"
	}
	FileRemoveDir, % clone, 1
Return 

writeBuildNumber(root, thisBuild) {
	FileRead, xml, % root . "\CSXS\manifest.xml"
	If ErrorLevel {
		MsgBox % 16,, % "read failed"
	}
	xml_replaced := RegExReplace(xml, "1\.0\.0", thisBuild)	
	xml_replaced := RegExReplace(xml_replaced, "1\.0\.0", thisBuild)	
	FileDelete, % root . "\CSXS\manifest.xml"
	FileAppend, % xml_replaced, % root . "\CSXS\manifest.xml"
	If ErrorLevel {
		MsgBox % 16,, % "append failed"
	}
	Return
}

autoSignUltra(original, buildnum) {
	CurrExt := original . "temp"
	only := false
	InputBox, password, Password for %original%,,,, 100
	if ErrorLevel {
		MsgBox, 16, You've cancelled autoSign.
		Return
	}
	certCount := tempNum()
	stages := 	{ output:["./ZXPSignCmd{space}-selfSignedCert{space}US{space}AZ{space}inventsable{space}ThomasScharstein{space}" . password . "{space}_certs/temp" . certCount . ".p12{Enter}"
						,"./ZXPSignCmd{space}-sign{space}" . CurrExt . "{space}_builds/" . original . ".zip{space}_certs/temp" . certCount . ".p12{space}" . password . "{space}-tsa{space}http://time.certum.pl{Enter}"
						,"./ZXPSignCmd{space}-sign{space}" . CurrExt . "{space}_builds/" . original . ".zxp{space}_certs/temp" . certCount . ".p12{space}" . password . "{space}-tsa{space}http://time.certum.pl{Enter}"
						,"./ZXPSignCmd{space}-verify{space}_builds/" . original . ".zxp{space}-certinfo{Enter}"]
				,rootDir:A_AppData . "\Adobe\CEP\extensions\"
				,file:["temp" . certCount . ".p12", original . ".zip", original . "zxp", original . "zxp"]
				,parentDir:["_certs\","_builds\", "_builds\", "_builds\"] }

	If !WinExist("ahk_exe mintty.exe") {
		Run, git-bash.exe, C:\Program Files\Git\
		WinWait, ahk_exe mintty.exe
		WinActivate, ahk_exe mintty.exe
	} Else {
		WinActivate, ahk_exe mintty.exe
	}
	WinWaitActive, ahk_exe mintty.exe, ,2

	if WinActive("ahk_exe mintty.exe") {
		SendInput % "cd " . convertSlashes(stages.rootDir) . "{Enter}"
		Loop % stages.output.length() {
			if (!only) {
				Sleep, 50
				SendInput % convertSlashes(stages.output[A_Index])
				resultFile := stages.rootDir . stages.parentDir[A_Index] . stages.file[A_Index]
				caller = 0
				While !FileExist(resultFile) {
					if (only)
						break
					if (caller > 70)
						break
					caller++
					Sleep, 50
				}
				continue
			} else {
				break
			}
		only := true
		SendInput % convertSlashes(stages.output[4])
		}
	}
	; Don't close window for screenshot
	; WinClose, ahk_exe mintty.exe, , 2
	Return original . ".zxp"
}