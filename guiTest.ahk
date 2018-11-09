#NoEnv
#WinActivateForce
#SingleInstance, Force	
SendMode, Input
SetBatchLines, -1
SetTitleMatchMode, 2
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Screen

global opt1 = "D19A66", opt2 = "98C379", opt3 = "C678DD", bg = "21252B", bgmask = "282C34", idle = "636D83"

; This GUI is made entirely of text
Gui, -Caption +AlwaysOnTop
Gui, Color, %bgmask%, %bgmask% 
Gui +LastFound
Gui, Font, s9 q5, Arial
Gui, Add, Progress, w120 h15 Background%bg%, 0
Gui, Add, Text, xp+3 yp w120 h15 BackgroundTrans c%idle% vTitle, %thisTitle%
Gui, Font, s9 q5, Font Awesome 5 Free Solid
Gui, Add, Text, yp xp+120 w20 h20 c%idle% gExit, % Chr(0xf410)
Gui, Font, s40 q5, Font Awesome 5 Free Solid
Gui, Add, Text, xm c%idle% vIconMods, % Chr(0xf007)
Gui, Font, s40 q5, Font Awesome 5 Free Solid
Gui, Add, Text, xm+60 yp vIconScan, % Chr(0xf53f)
Gui, Show, x0 y350 w150 h100
SetTimer, mouseTrack, 20

Return

ShowGui:
    Gui, Show, NoActivate
Return
Exit:
    Gui, Show, Hide
Return

mouseTrack:
    CoordMode, Mouse, Screen
    MouseGetPos, vCurX, vCurY, hWnd, vCtlClassNN
    CoordMode, Pixel, Screen
    PixelGetColor, currColor, %vCurX%, %vCurY%, RGB
    GuiControl, +c%currColor%, IconScan
    if (CtrlState) {
        GuiControl,, IconScan, % Chr(0xf1fc)
    } else if (ShiftState) {
        GuiControl,, IconScan, % Chr(0xf5aa)
    } else if (AltState) {
        GuiControl,, IconScan, % Chr(0xf53f)
    } else {
        GuiControl,, IconScan, % Chr(0xf1fb)
    }
    WinGetTitle, WinTitle, A
    GuiControl,, Title, % WinTitle
Return

~*Control::
    CtrlState := true
    Gosub, KeyCheck
Return
~*Control Up::
    CtrlState := false
    Gosub, KeyCheck
Return

~*Shift::
    ShiftState := true
    Gosub, KeyCheck
Return
~*Shift Up::
    ShiftState := false
    Gosub, KeyCheck
Return

~*Alt::
    AltState := true
    Gosub, KeyCheck
Return
~*Alt Up::
    AltState := false
    Gosub, KeyCheck
Return

~LWin::
~*LWin::
    WinState := true
    Gosub, KeyCheck
Return
~*LWin Up::
    WinState := false
    Gosub, KeyCheck
Return

KeyCheck:
    Gui, Font, s30               ; Change size by setting Gui, Font
    GuiControl, Font, IconMods   ; then GuiControl, Font, (variable)
    if (CtrlState) {
        ; changing the color
        GuiControl, +c%opt1%, IconMods
        ; changing the character
        GuiControl,, IconMods, % Chr(0xf728)
    } else if (ShiftState) {
        GuiControl, +c%opt2%, IconMods
        GuiControl,, IconMods, % Chr(0xf508)
    } else if (AltState) {
        GuiControl, +c%opt3%, IconMods
        GuiControl,, IconMods, % Chr(0xf21b)
    } else {
        GuiControl, +c%idle%, IconMods
        GuiControl,, IconMods, % Chr(0xf007)
    }
Return

^esc::reload