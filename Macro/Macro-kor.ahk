; <COMPILER: v1.1.30.03>
#NoEnv
#NoTrayIcon
#SingleInstance Ignore
#IfWinActive ahk_class grcWindow
Gui, Font, bold
Gui, Add, Text, x22 y6 w175 h30 +Center v감지기 cDF0101, GTA5 OFF
Gui, Add, Checkbox, gC1 vC1, CEO
Gui, Add, Checkbox, gC2 vC2, MC클럽
Gui, Add, Checkbox, gC3 vC3, 기본
Gui, Add, Checkbox, vC4, 습격 세팅 매크로
Gui, Add, Button,x10 y160 w90 h30 v1인, 1인세션
GuiControl, disable, 1인
Gui, Add, Button,x110 y125 w90 h30 v인터넷, 랜뽑
GuiControl, disable, 인터넷
Gui, Add, Button,x10 y125 w90 h30 v강종, 강제종료
GuiControl, disable, 강종
Gui, Add, Button,x110 y160 w90 h30, 설명서
Gui, Show, w210 h210, GTA
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
GuiControl,, 감지기,GTA5 ON
Gui, Font, c2EFE2E
GuiControl, Font, 감지기
GuiControl, enable, 1인
GuiControl,, 1인, 1인세션
GuiControl, enable, 인터넷
GuiControl,, 인터넷, 랜뽑
GuiControl, enable, 강종
GuiControl,, 강종, 강제종료
GTAOK := 1
}
if GTAOK = 1
break
sleep, 3000
}
return

Button1인세션:
If not ProcessExist("GTA5.exe")
{
GuiControl,, 감지기, GTA5 OFF
Gui, Font, cDF0101
GuiControl, Font, 감지기
GuiControl, disable, 1인
goto, CheckLevel
}
GuiControl, disable, 1인
ProcSus("GTA5.exe")
LAN_TIME := 10
Loop, 10{
GuiControl,, 1인, %LAN_TIME%초
sleep, 1000
--LAN_TIME
}
ProcRes("GTA5.exe")
GuiControl,, 1인, 작업완료
sleep, 5000
goto, CheckLevel
return

Button랜뽑:
If not ProcessExist("GTA5.exe")
{
GuiControl,, 감지기, GTA5 OFF
Gui, Font, cDF0101
GuiControl, Font, 감지기
GuiControl, disable, 인터넷
goto, CheckLevel
}
GuiControl, disable, 인터넷
Run, %ComSpec% /c ipconfig /release
InternetSus_Time := 20
Loop, 20{
GuiControl,, 인터넷, %InternetSus_Time%초
sleep, 1000
--InternetSus_Time
}
Run, %ComSpec% /c ipconfig /renew
GuiControl,, 인터넷, 작업완료
sleep, 5000
goto, CheckLevel
return

Button강제종료:
If not ProcessExist("GTA5.exe")
{
GuiControl,, 감지기, GTA5 OFF
Gui, Font, cDF0101
GuiControl, Font, 감지기
GuiControl, disable, 강종
goto, CheckLevel
}
process,close,GTA5.exe
goto, CheckLevel
return

C1:
gui, submit, nohide
if (C2 = 1)
{
guicontrol,,C2,0
return
}
if (C3 = 1)
{
guicontrol,,C3,0
return
}


C2:
gui, submit, nohide
if (C1 = 1)
{
guicontrol,,C1,0
return
}
if (C3 = 1)
{
guicontrol,,C3,0
return
}

C3:
gui, submit, nohide
if (C1 = 1)
{
guicontrol,,C1,0
return
}
if (C2 = 1)
{
guicontrol,,C2,0
return
}

ctrl & 1::
{
Gui, Submit, NoHide
if (C1 = 1)
{
Send,m
Send {Down}{Down}{Down}{enter}{Down}{Down}{enter}{Down}
return
}
if (C2 = 1)
{
Send,m
Send {Down}{Down}{Down}{enter}{Down}{Down}{enter}{Down}
return
}
if (C3 = 1)
{
Send,m
Send {Down}{Down}{enter}{Down}{Down}{enter}{Down}
return
}
}
return

ctrl & 2::
{
Gui, Submit, NoHide
if (C1 = 1)
{
Send,m
Send {Down}{Down}{Down}{enter}{Down}{enter}{Down}{Down}{Down}{Down}{enter}{esc}{esc}{esc}
return
}
if (C2 = 1)
{
Send,m
Send {Down}{Down}{Down}{enter}{Down}{enter}{Down}{Down}{Down}{Down}{enter}{esc}{esc}{esc}
return
}
if (C3 = 1)
{
Send,m
Send {Down}{Down}{enter}{Down}{enter}{Down}{Down}{Down}{Down}{enter}{esc}{esc}{esc}
return
}
}
return

ctrl & 3::
{
Gui, Submit, NoHide
if (C1 = 1)
{
Send,m
Send {Down}{Down}{Down}{enter}{Down}{Down}{Down}{enter}{Down}{Down}{Down}{enter}
return
}
if (C2 = 1)
{
Send,m
Send {Down}{Down}{Down}{enter}{Down}{Down}{Down}{enter}{Down}{Down}{Down}{enter}
return
}
if (C3 = 1)
{
Send,m
Send {Down}{Down}{enter}{Down}{Down}{Down}{enter}{Down}{Down}{Down}{enter}
return
}
}
return

ctrl & 4::
{
Gui, Submit, NoHide
if (C1 = 1)
{
Send {Up}{Up}{enter}{Down}{Down}{enter}
return
}
if (C2 = 1)
{
Send {Up}{Up}{enter}{Down}{Down}{enter}
return
}
if (C3 = 1)
{
Send {Up}{Up}{enter}{Down}{Down}{enter}
return
}
}
return

ctrl & 5::
{
Gui, Submit, NoHide
if (C1 = 1)
{
Send,m
Send {enter}{enter}
Sleep 100
Send {Right}{Right}{enter}{esc}{esc}{esc}
return
}
if (C2 = 1)
{
Send,m
Send {enter}{Down}{enter}
Sleep 100
Send {Right}{Right}{enter}{esc}{esc}{esc}
return
}
}
return

F1::
{
Gui, Submit, NoHide
if(C4=1)
{
Send {Enter}{Right}{Enter}{Down}{Enter}{Right}{Enter}{Down}{Enter}{Left}{Enter}
}else
return
}
return

F2::
{
Gui, Submit, NoHide
if(C4=1)
{
Send {Enter}{Right}{Enter}{Down}{Enter}{Right}{Enter}{Left}{Enter}{Right}{Enter}{Down}{Enter}{Left}{Enter}
}else
return
}
return

F3::
{
Gui, Submit, NoHide
if(C4=1)
{
Send {Enter}{Left}{Enter}{Down}{Enter}{Right}{Enter}{Down}{Enter}{Left}{Enter}
}else
return
}
return

F4::
{
Gui, Submit, NoHide
if(C4=1)
{
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
}else
return
}
return

ctrl & t::
{
Gui, Submit, NoHide
if(C1=1)
{
Send, m
Send {Enter}{Down}{Down}{Down}{Down}{Enter}{Down}{Enter}
}else
return
}
return

ctrl & b::
{
Gui, Submit, NoHide
if(C1=1)
{
Send, m
Send {Enter}{Down}{Down}{Down}{Down}{Enter}{Down}{Down}{Down}{Down}{Down}{Enter}
}else
return
}
return

ctrl & v::
{
Gui, Submit, NoHide
if(C1=1)
{
Send, m
Send {Enter}{Down}{Down}{Enter}
}else
return
}
return

ctrl & g::
{
Gui, Submit, NoHide
if(C1=1)
{
Send, m
Send {Enter}{Down}{Down}{Down}{Down}{Enter}{Down}{Down}{Down}{Down}{Enter}
}else
return
}
return

Button설명서:
Gui, submit
Msgbox,
(
==============================================
습격 세팅 매크로
F1 = 카지노 습격 비밀작전
F2 = 카지노 습격 대사기극
F3 = 카지노 습격 공격전술
F4 = 구,신습격 세팅

일반 매크로
Ctrl & 1 = 스낵
Ctrl & 2 = 방탄복
Ctrl & 3 = 탄약
Ctrl & 4 = 중화기 다른 탄약 구매 매크로
Ctrl & 5 = CEO, MC클럽 초대 매크로 

CEO
Ctrl & t = 불샤크 테스트론
Ctrl & v = VIP 임무 매크로
Ctrl & b = 관계자 매수 매크로
Ctrl & g = 유령연맹 매크로
==============================================
)
Gui,Show
return


GuiClose:
ExitApp