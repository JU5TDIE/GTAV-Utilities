; <COMPILER: v1.1.30.03>
#NoEnv
#SingleInstance Ignore
#IfWinActive ahk_class grcWindow

IniRead, sk, settings.ini, Controls, Snack
IniRead, ar, settings.ini, Controls, Armor
IniRead, ao, settings.ini, Controls, Ammo
IniRead, na, settings.ini, Controls, NextAmmo
IniRead, hrj, settings.ini, Controls, HideRevealJobs
IniRead, cwl, settings.ini, Controls, CustomWeaponLoadout
IniRead, rm, settings.ini, Controls, RequestMOC
IniRead, ra, settings.ini, Controls, RequestAvenger
IniRead, rt, settings.ini, Controls, RequestTerrorbyte
IniRead, rk, settings.ini, Controls, RequestKosatka
IniRead, pmw, settings.ini, Controls, PinMacroWindow
IniRead, ss, settings.ini, Controls, SilentSneaky
IniRead, tb, settings.ini, Controls, TheBigcon 
IniRead, ae, settings.ini, Controls, Aggressive
IniRead, ofh, settings.ini, Controls, OldFacilityHeist
IniRead, bst, settings.ini, Controls, Bullshark
IniRead, ba, settings.ini, Controls, BribeAuthorities
IniRead, vip, settings.ini, Controls, VIP
IniRead, go, settings.ini, Controls, GhostOrganization 
IniRead, rbzz, settings.ini, Controls, RequestBuzzard
IniRead, rb, settings.ini, Controls, RequestBike
IniRead, pe, settings.ini, Controls, Passive
IniRead, invf, settings.ini, Controls, InviteFriends
IniRead, sn, settings.ini, Controls, ShutDown
IniRead, ssn, settings.ini, Controls, SoloSession
IniRead, lf, settings.ini, Controls, LAN-OFF
Hotkey, %sk%,Snack,On
Hotkey, %ar%,Armor,On
Hotkey, %ao%,Ammo,On
Hotkey, %na%,NextAmmo,On
Hotkey, %hrj%,HideRevealJobs,On
Hotkey, %cwl%,CustomWeaponLoadout,On
Hotkey, %rm%,RequestMOC,On
Hotkey, %ra%,RequestAvenger,On
Hotkey, %rt%,RequestTerrorbyte,On
Hotkey, %rk%,RequestKosatka,On
Hotkey, %pmw%,PinMacroWindow,On
Hotkey, %ss%,SilentSneaky,On
Hotkey, %tb%,TheBigcon,On
Hotkey, %ae%,Aggressive,On
Hotkey, %ofh%,OldFacilityHeist,On
Hotkey, %bst%,Bullshark,On
Hotkey, %ba%,BribeAuthorities,On
Hotkey, %vip%,VIP,On
Hotkey, %go%,GhostOrganization ,On
Hotkey, %rbzz%,RequestBuzzard,On
Hotkey, %rb%,RequestBike,On
Hotkey, %pe%,Passive,On
Hotkey, %invf%,InviteFriends,On
Hotkey, %sn%,ButtonShutDown,On
Hotkey, %ssn%,ButtonSoloSession,On
Hotkey, %lf%,ButtonLan-OFF,On

Gui, Font, bold
Gui, Add, Text, x22 y6 w175 h30 +CEnter vDetected cDF0101, GTA5 OFF
Gui, Add, Button,x10 y75 w90 h30 vSolo, SoloSession
GuiControl, disable, Solo
Gui, Add, Button,x110 y40 w90 h30 vInternet, Lan-OFF
GuiControl, disable, Internet
Gui, Add, Button,x10 y40 w90 h30 vsd, ShutDown
GuiControl, disable, sd
Gui, Add, Button,x110 y75 w90 h30, Credits
Gui, Show, w210 h120, GTA

ProcessExist(Name){
Process,Exist,%Name%
return Errorlevel
}
ProcSus(PID_or_Name)
{
If InStr(PID_or_Name, ".") {
Process, Exist, %PID_or_Name%
PID_or_Name := ErrorLevel
}
If !(h := DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", PID_or_Name))
Return -1
DllCall("ntdll.dll\NtSuspendProcess", "Int", h), DllCall("CloseHandle", "Int", h)
}
ProcRes(PID_or_Name)
{
If InStr(PID_or_Name, ".") {
Process, Exist, %PID_or_Name%
PID_or_Name := ErrorLevel
}
If !(h := DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", PID_or_Name))
Return -1
DllCall("ntdll.dll\NtResumeProcess", "Int", h), DllCall("CloseHandle", "Int", h)
}

CheckLevel:
Loop {
If ProcessExist("GTA5.exe") {
GuiControl,, Detected,GTA5 ON
Gui, Font, c2EFE2E
GuiControl, Font, Detected
GuiControl, enable, Solo
GuiControl,, Solo, SoloSession
GuiControl, enable, Internet
GuiControl,, Internet, Lan-OFF
GuiControl, enable, sd
GuiControl,, sd, ShutDown
GTAOK := 1
}
if GTAOK = 1
break
sleep, 3000
}
return


ButtonSoloSession:
If not ProcessExist("GTA5.exe")
{
GuiControl,, Detected, GTA5 OFF
Gui, Font, cDF0101
GuiControl, Font, Detected
GuiControl, disable, Solo
goto, CheckLevel
}
GuiControl, disable, Solo
ProcSus("GTA5.exe")
LAN_TIME := 10
Loop, 10{
GuiControl,, Solo, %LAN_TIME% Seconds
sleep, 1000
--LAN_TIME
}
ProcRes("GTA5.exe")
GuiControl,, Solo, Succeed
sleep, 5000
goto, CheckLevel
return

ButtonLan-OFF:
If not ProcessExist("GTA5.exe")
{
GuiControl,, Detected, GTA5 OFF
Gui, Font, cDF0101
GuiControl, Font, Detected
GuiControl, disable, Internet
goto, CheckLevel
}
GuiControl, disable, Internet
Run, %ComSpec% /c ipconfig /release
InternetSus_Time := 20
Loop, 20{
GuiControl,, Internet, %InternetSus_Time% Seconds
sleep, 1000
--InternetSus_Time
}
Run, %ComSpec% /c ipconfig /renew
GuiControl,, Internet, Succeed
sleep, 5000
goto, CheckLevel
return

ButtonShutDown:
If not ProcessExist("GTA5.exe")
{
GuiControl,, Detected, GTA5 OFF
Gui, Font, cDF0101
GuiControl, Font, Detected
GuiControl, disable, sd
goto, CheckLevel
}
process,close,GTA5.exe
goto, CheckLevel
return

ButtonCredits:
Gui, submit
Msgbox,
(
https://github.com/JU5TDIE/GTAV-Macro
)
Gui,Show
return



; Default Macros
Snack:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/quickgps-eng.png
If (Errorlevel = 0)
{
Send {Down}{Down}{Enter}{Down}{Down}{Enter}{Down}
}else
Send {Down}{Down}{Down}{Enter}{Down}{Down}{Enter}{Down}
return

Armor:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/quickgps-eng.png
If (Errorlevel = 0)
{
Send {Down}{Down}{Enter}{Down}{Enter}{Down}{Down}{Down}{Down}{Enter}{Esc}{Esc}{Esc}
}else
Send {Down}{Down}{Down}{Enter}{Down}{Enter}{Down}{Down}{Down}{Down}{Enter}{Esc}{Esc}{Esc}
return

Ammo:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/quickgps-eng.png
If (Errorlevel = 0)
{
Send {Down}{Down}{Enter}{Down}{Down}{Down}{Enter}{Down}{Down}{Down}{Enter}
}else
Send {Down}{Down}{Down}{Enter}{Down}{Down}{Down}{Enter}{Down}{Down}{Down}{Enter}
return

NextAmmo:
Send {Up}{Up}{Enter}{Down}{Down}{Enter}

HideRevealJobs:
Send, m
Send {Up}{Up}{Up}{Up}{Up}{Up}{Up}{Up}{Enter}{Enter}{Enter}{Esc}{Esc}{Esc}
return

CustomWeaponLoadout:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/quickgps-eng.png
If (Errorlevel = 0)
{
Send {Down}{Down}{Enter}{Down}{Down}{Down}{Down}{Enter}{Esc}{Esc}
}else
Send {Down}{Down}{Down}{Enter}{Down}{Down}{Down}{Down}{Enter}{Esc}{Esc}
return

RequestMOC:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/quickgps-eng.png
If (Errorlevel = 0)
{
Send {Down}{Down}{Down}{Down}{Down}{Enter}{Down}{Enter}{Enter}
}else
Send {Down}{Down}{Down}{Down}{Down}{Down}{Enter}{Down}{Enter}{Enter}
return

RequestAvenger:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/quickgps-eng.png
If (Errorlevel = 0)
{
Send {Down}{Down}{Down}{Down}{Down}{Enter}{Down}{Down}{Enter}{Enter}
}else
Send {Down}{Down}{Down}{Down}{Down}{Down}{Enter}{Down}{Down}{Enter}{Enter}
return

RequestTerrorbyte:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/quickgps-eng.png
If (Errorlevel = 0)
{
Send {Down}{Down}{Down}{Down}{Down}{Enter}{Down}{Down}{Down}{Enter}{Enter}
}else
Send {Down}{Down}{Down}{Down}{Down}{Down}{Enter}{Down}{Down}{Down}{Enter}{Enter}
return

RequestKosatka:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/quickgps-eng.png
If (Errorlevel = 0)
{
Send {Down}{Down}{Down}{Down}{Down}{Enter}{Down}{Down}{Down}{Down}{Enter}{Enter}
}else
Send {Down}{Down}{Down}{Down}{Down}{Down}{Enter}{Down}{Down}{Down}{Down}{Enter}{Enter}
return

PinMacroWindow:
WinSet,AlwaysOnTop,On,ahk_class AutoHotkeyGUI


; Heist Setting Macros
SilentSneaky:
Send {Enter}{Right}{Enter}{Down}{Enter}{Right}{Enter}{Down}{Enter}{Left}{Enter}
return

TheBigCon:
Send {Enter}{Right}{Enter}{Down}{Enter}{Right}{Enter}{Left}{Enter}{Right}{Enter}{Down}{Enter}{Left}{Enter}
return

Aggressive:
Send {Enter}{Left}{Enter}{Down}{Enter}{Right}{Enter}{Down}{Enter}{Left}{Enter}
return

OldFacilityHeist:
Send {Up}{Enter}
Sleep 300
Send {Down}{Down}{Down}
Sleep 300
Send {Enter}{Esc}
Sleep 300
Send {Right}
Sleep 200
Send {Down}
Sleep 100
Send {Right}
Sleep 100
Send {Up}{Up}{Up}
Sleep 100
Send {Enter}
Sleep 1100
Send {Down}
Sleep 100
Send {Enter}
return


; CEO Macros
Bullshark:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/ceo-eng.png
If (Errorlevel = 0)
{
Send {Enter}{Down}{Down}{Down}{Down}{Enter}{Down}{Enter}
}else
Send, m
return

BribeAuthorities:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/ceo-eng.png
If (Errorlevel = 0)
{
Send {Enter}{Down}{Down}{Down}{Down}{Enter}{Down}{Down}{Down}{Down}{Down}
}else
Send, m
return

VIP:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/ceo-eng.png
If (Errorlevel = 0)
{
Send {Enter}{Down}{Down}{Enter}
}else
Send, m
return

GhostOrganization:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/ceo-eng.png
If (Errorlevel = 0)
{
Send {Enter}{Down}{Down}{Down}{Down}{Enter}{Down}{Down}{Down}{Down}
}else
Send, m
return

RequestBuzzard:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/ceo-eng.png
If (Errorlevel = 0)
{
Send {Enter}{Up}{Up}{Enter}{Down}{Down}{Down}{Down}{Enter}
}else
Send, m
return


; MC Club Macros
RequestBike:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/mcclub-eng.png
If (Errorlevel = 0)
{
Send {Enter}{Enter}
}else
Send, m
return


; CEO + MC Macros
Passive:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/quickgps-eng.png
If (Errorlevel = 0)
{
Send {Up}{Enter}{Esc}
}else
Send {Enter}{Up}{Enter}
Sleep 300
Send, m
Send {Up}{Enter}{Esc}
return

InviteFriends:
Send, m
Sleep 70
ImageSearch,vx,vy,25,137,460,190, *50 pics/ceo-eng.png
If (Errorlevel = 0)
{
    Send {Enter}{Enter}{Right}{Right}{Enter}{Esc}{Esc}{Esc}
    return
}
If (Errorlevel = 1)
{
    ImageSearch,vx,vy,25,137,460,190, *50 pics/mcclub-eng.png
    If (Errorlevel = 0)
    {
        Send {Enter}{Down}{Enter}{Right}{Right}{Enter}{Esc}{Esc}{Esc}
        return
    }
    If (Errorlevel = 1)
    {
        Send, m
        return
    }
}



GuiClose:
ExitApp