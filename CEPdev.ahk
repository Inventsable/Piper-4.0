; F24::autoSign()


; adobe_Menu     := ["Reboot Templates", "New Vue Inline", "New Vue Webpack", "New Vanilla CEP", "Auto Sign and Package"]
; adobe_Label     := ["ReStrapTemplates", "NewVueInline", "NewVueWebpack", "NewAdobePanel", "AdobeZXP"]
; main_Menu    := ["CEP", "Minimize"]
; main_Label    := [":Favorites", "Minimize"]

; goSub createMenu

; createMenu:
; Loop, % adobe_Menu.Length()
; 	{
; 		Menu, Favorites, Add, % adobe_Menu[A_Index], % adobe_Label[A_Index]
; 		; Menu, Favorites, Icon, % adobe_Menu[A_Index], %A_WorkingDir%\resources\icons\ContextMenu\f%A_Index%.ico
; 	}

; ; main menu
; ; Menu, Main, Add
; Loop, % main_Menu.Length()
; 	{
; 		; If ((A_Index = 3) || (A_Index = 6) || (A_Index = 9))
; 		; 	Menu, Main, Add
; 		Menu, Tray, Add, % main_Menu[A_Index], % main_Label[A_Index]
; 		Menu, Tray, Icon, % main_Menu[A_Index], %A_WorkingDir%\resources\icons\ContextMenu\z%A_Index%.ico
; 	}


; Menu, Main, Add, CEP, :Favorites
; Menu, Main, Add, Minimize All, Minimize

Menu, Tray, Add, Hello, gHello
Return

gHello:
	MsgBox % "Hello"
Return

Minimize:
    WinMinimizeAll
Return

AdobeZXP:
	autoSign()
Return

; ^#RButton::
; 	; Menu, Main, Show
; 	; Gosub, HideGui
; 	Return


; ^#RButton Up::
; 	; Gosub, HideGui
; 	Return

templateType := ["style.css", "reset.css", "main.js", "index.html"
                , "CSInterface.js", "manifest.xml", "AEFT.jsx", "ILST.jsx", "PHXS.jsx"
                , "scribe.js", ".debug", "ReqLibs.js", "menu_Flyout.js", "menu_Context.js", "eventManager.js"
                , "json2.jsx", "Console.jsx", "README.md", "LICENSE"
                , "magicMirror.js", "adobeStyle.css", "anima.css", "mightyFunctions.js", "mightyFiles.js"
                , "Adobe-Font.svg", "Adobe-Font.ttf", "Adobe-Font.woff", "iconLight.png"]


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

GitTitle() {
	WinActivate, ahk_exe mintty.exe
	WinGetTitle, CurrTitle, A
	; /([^\/]+$)/gm
	StringGetPos, GitFolderNum, CurrTitle, /, R
	GitFolderLength := (StrLen(CurrTitle) - GitFolderNum)
	title := SubStr(CurrTitle, GitFolderNum + 2, GitFolderLength + 1)
    ; MsgBox %title%
	return title
}

autoSign() {
	only := false
	CurrExt := GitTitle()
	InputBox, password, Password for %CurrExt%,,,, 100
	if ErrorLevel {
		MsgBox, 16, You've cancelled autoSign.
		Return
	}
	filecount := tempNum()
	stages := { output:["./ZXPSignCmd{space}-selfSignedCert{space}US{space}AZ{space}Inventsable{space}SomeCommonName{space}" . password . "{space}_certs/temp" . filecount . ".p12{Enter}"
						,"./ZXPSignCmd{space}-sign{space}" . CurrExt . "{space}_builds/" . CurrExt . ".zip{space}_certs/temp" . filecount . ".p12{space}" . password . "{space}-tsa{space}http://time.certum.pl{Enter}"
						,"./ZXPSignCmd{space}-sign{space}" . CurrExt . "{space}_builds/" . CurrExt . ".zxp{space}_certs/temp" . filecount . ".p12{space}" . password . "{space}-tsa{space}http://time.certum.pl{Enter}"
						,"./ZXPSignCmd{space}-verify{space}_builds/" . CurrExt . ".zxp{space}-certinfo{Enter}"]
				,rootDir:A_AppData . "\Adobe\CEP\extensions\"
				,file:["temp" . filecount . ".p12", CurrExt . ".zip", CurrExt . "zxp", CurrExt . "zxp"]
				,parentDir:["certs\","_builds\", "_builds\", "_builds\"] }

	WinActivate, ahk_exe mintty.exe
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
	Return
}

F19::
	goSub NewVueInline
Return 

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
	xml_replaced := RegExReplace(xml, "ExtensionBundleVersion\=\""1\.0\.0\""", thisBuild)	
	xml_replaced := RegExReplace(xml_replaced, "Version\=\""1\.0\.0\""", thisBuild)	
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
						,"./ZXPSignCmd{space}-sign{space}" . CurrExt . "{space}_builds/" . original . buildnum . ".zip{space}_certs/temp" . certCount . ".p12{space}" . password . "{space}-tsa{space}http://time.certum.pl{Enter}"
						,"./ZXPSignCmd{space}-sign{space}" . CurrExt . "{space}_builds/" . original . buildnum . ".zxp{space}_certs/temp" . certCount . ".p12{space}" . password . "{space}-tsa{space}http://time.certum.pl{Enter}"
						,"./ZXPSignCmd{space}-verify{space}_builds/" . original . buildnum . ".zxp{space}-certinfo{Enter}"]
				,rootDir:A_AppData . "\Adobe\CEP\extensions\"
				,file:["temp" . certCount . ".p12", original . buildnum . ".zip", original . buildnum . "zxp", original . buildnum . "zxp"]
				,parentDir:["_certs\","_builds\", "_builds\", "_builds\"] }

	if WinExist("ahk_exe mintty.exe") {
		WinActivate, ahk_exe mintty.exe
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
	Return original . buildnum . ".zxp"
}

; TestCopy:
; 	FileCopyDir, % "C:\Users\TRSch\AppData\Roaming\Adobe\CEP\extensions\Vue-Inline-Template", % "C:\Users\TRSch\AppData\Roaming\Adobe\CEP\extensions\test"
; 	MsgBox % "Done"
; Return

NewVueInline:
	; CurrDirectory := A_AppData . "\Roaming\Adobe\CEP\extensions"
	CurrDirectory := "C:\Users\TRSch\AppData\Roaming\Adobe\CEP\extensions"
	RepoVar := ""
	InputBox, RepoVar, New Vue CDN:,,,, 100
	if ErrorLevel {
		MsgBox, 16, Then no extension for you, Cancelling CEP template
		Return
	}
	InputBox, DescVar, Description,,,, 100
	if ErrorLevel {
		MsgBox, 16, Then no extension for you, Cancelling CEP template
		Return
	}
	name := RepoVar
	ExtensionVar := Format("{:L}", StrReplace(RepoVar, A_Space, "."))
	RepoVar :=  StrReplace(RepoVar, A_Space, "-")
	; namelow := ExtensionVar
	FileCopyDir, % CurrDirectory . "\Vue-Inline-Template", % CurrDirectory . "\" . RepoVar
	newRepo := CurrDirectory . "\" . RepoVar

	TotalFolders := CurrDirectory . "\*.*"
	FolderCount:=""
	Loop, Files, %TotalFolders%, D
		FolderCount++

	DebugPort := FolderCount + 2040

	files := ["\client\index.html", "\client\main.js", "\CSXS\manifest.xml", "\README.md", "\.debug"]
	vOutput := ""
	Loop, % files.length() {
		FileRead, temp, % newRepo . files[A_Index]
		if (InStr(temp, "namehere"))
			temp := RegExReplace(temp, "namehere", RepoVar)
		if (InStr(temp, "namelow"))
			temp := RegExReplace(temp, "namelow", ExtensionVar)
		if (InStr(temp, "exthere"))
			temp := RegExReplace(temp, "exthere", ExtensionVar)
		if (InStr(temp, "deschere")) 
			temp := RegExReplace(temp, "deschere", DescVar)
		if (files[A_Index] = "\.debug")
			temp := RegExReplace(temp, "numb", DebugPort)
		FileDelete, % newRepo . files[A_Index]
		FileAppend, % temp, % newRepo . files[A_Index]
	}
	MsgBox % RepoVar . " has been created"
Return


LoadingToolTip:
	ToolTip, % "Loading Webpack..."
Return


; F22::
NewVueWebpack:
	CurrDirectory := A_AppData . "\Roaming\Adobe\CEP\extensions"
	RepoVar := ""

	InputBox, RepoVar, New Vue/Webpack:,,,, 100
		if ErrorLevel {
			MsgBox, 16, Then no extension for you
			Return
		}
	InputBox, DescVar, Description,,,, 100
		if ErrorLevel {
			MsgBox, 16, Then no extension for you
			Return
		}
	name := RepoVar
	ExtensionVar := Format("{:L}", StrReplace(RepoVar, A_Space, "."))
	RepoVar :=  StrReplace(RepoVar, A_Space, "-")
	
	SetTimer, LoadingToolTip, On
	FileCopyDir, % CurrDirectory . "\Vue-Webpack-Template", % CurrDirectory . "\" . RepoVar
	newRepo := CurrDirectory . "\" . RepoVar
	SetTimer, LoadingToolTip, Off
	ToolTip

	TotalFolders := CurrDirectory . "\*.*"
	FolderCount:=""
	Loop, Files, %TotalFolders%, D
		FolderCount++

	DebugPort := (FolderCount * 2) + 1940
	FramePort := DebugPort - 1

	files := ["\index.html", "\CSXS\manifest.xml", "\README.md", "\.debug", "\package-lock.json", "\package.json", "\webpack.config.js"]
	vOutput := ""
	Loop, % files.length() {
		FileRead, temp, % newRepo . files[A_Index]
		if (InStr(temp, "namehere"))
			temp := RegExReplace(temp, "namehere", RepoVar)
		if (InStr(temp, "exthere"))
			temp := RegExReplace(temp, "exthere", ExtensionVar)
		if (InStr(temp, "deschere")) 
			temp := RegExReplace(temp, "deschere", DescVar)
		if (files[A_Index] = "\index.html" || files[A_Index] = "\webpack.config.js")
			temp := RegExReplace(temp, "porthere", FramePort)

		if (files[A_Index] = "\.debug")
			temp := RegExReplace(temp, "numb", DebugPort)

		FileDelete, % newRepo . files[A_Index]
		FileAppend, % temp, % newRepo . files[A_Index]
	}
	MsgBox % RepoVar . " has been created"

Return


NewAdobePanel:
CurrDirectory := A_AppData . "\Roaming\Adobe\CEP\extensions"
BackDirectory := myDoc . "\Adobe-Panels\master"
RepoVar := ""

InputBox, RepoVar, Name of CEP Extension,,,, 100
	if ErrorLevel {
		MsgBox, 16, Then no extension for you
		Return
	}
nameVar := RepoVar
Gosub, ModifyXML
RepoVar :=  StrReplace(RepoVar, A_Space, "-")
FileCreateDir, %CurrDirectory%\%RepoVar%
pathType := ["CSXS", "client", "host", "log", "icons"]
Loop, % pathType.Length() {
	this := pathType[A_Index]
	here := CurrDirectory . "\" . RepoVar . "\" . this
	FileCreateDir, % here
}
FileCreateDir, % CurrDirectory . "\" . RepoVar . "\client\myTstack"
FileCreateDir, % CurrDirectory . "\" . RepoVar . "\client\myTstack\fonts"
FileCreateDir, % CurrDirectory . "\" . RepoVar . "\host\universal"
; FileCreateDir, % CurrDirectory . "\" . RepoVar . "\icons"


pathTo := CurrDirectory . "\" . RepoVar . "\"
from := myDoc . "Adobe-Panels"
Loop, % templateType.Length() {
	this := templateType[A_Index]
	if (this = "manifest.xml")
	here := pathTo . "CSXS", pathManifest2 := here
	else if ((this = "AEFT.jsx") || (this = "ILST.jsx") || (this = "PHXS.jsx"))
	here := pathTo . "host"
	else if ((this = "json2.jsx") || (this = "Console.jsx"))
	here := pathTo . "host\universal"
	else if ((this = ".debug") || (this = "README.md") || (this = "LICENSE"))
	here := pathTo
	else if (this = "scribe.js")
	here := pathTo . "log"
	else if (this = "iconLight.png")
	here := pathTo . "icons"
	else if ((this = "index.html") || (this = "main.js") || (this = "style.css"))
	here := pathTo . "client"
	else if ((this = "Adobe-Font.svg") || (this = "Adobe-Font.ttf") || (this = "Adobe-Font.woff"))
	here := pathTo . "client\myTstack\fonts"
	else
	here := pathTo . "client\myTstack"
	FileCopy, % from . "\" . this, % here
}


; FileCopyDir, % from . "\fonts", % pathTo . "client\myTstack"

Gosub, RebootTemplates
MsgBox % RepoVar " created"
Return


; ^!F24::
RebootTemplates:
; templateType := ["style.css", "reset.css", "main.js", "index.html", "CSInterface.js", "manifest.xml", "index.jsx"]
Loop, % templateType.Length() {
	this := templateType[A_Index]
	; CurrDirectory := A_AppData . "\Roaming\Adobe\CEP\extensions"
	from := myDoc . "Adobe-Panels\_master\"
	here := myDoc . "Adobe-Panels"
	FileDelete, % here . "\" . this
	FileCopy, % from . "\" . this, % here
}
; MsgBox % "Templates rebooted"
Return


ReStrapTemplates:
Gosub, RebootTemplates
MsgBox % "Templates rebooted"
Return





; ^!F23::
ModifyXML:
pathManifest := myDoc . "Adobe-Panels\"
ExtensionVar := Format("{:L}", StrReplace(RepoVar, A_Space, "."))

FileRead, xml, % pathManifest . "manifest.xml"

xml_replaced := RegExReplace(xml, "my\.test", ExtensionVar)
xml_replaced := RegExReplace(xml_replaced, "name\.here", RepoVar)
FileDelete, % pathManifest . "manifest.xml"
FileAppend, % xml_replaced, % pathManifest . "manifest.xml"

FileRead, html, % pathManifest . "index.html"
html_replaced := RegExReplace(html, "title\.here", nameVar)
FileDelete, % pathManifest . "index.html"
FileAppend, % html_replaced, % pathManifest . "index.html"

FileRead, debug, % pathManifest . ".debug"
debug_replaced := RegExReplace(debug, "my\.test", ExtensionVar)
FileDelete, % pathManifest . ".debug"
FileAppend, % debug_replaced, % pathManifest . ".debug"

FileRead, readme, % pathManifest . "README.md"
readme_replaced := RegExReplace(readme, "name\.here", RepoVar)
FileDelete, % pathManifest . "README.md"
FileAppend, % readme_replaced, % pathManifest . "README.md"
Return 
