; <COMPILER: v1.1.30.03>
#NoEnv
#NoTrayIcon
#SingleInstance Ignore
#IfWinActive ahk_class grcWindow
Gui, Font, bold
Gui, Add, Text, x22 y6 w175 h30 +Center v������ cDF0101, GTA5 OFF
Gui, Add, Checkbox, gC1 vC1, CEO
Gui, Add, Checkbox, gC2 vC2, MCŬ��
Gui, Add, Checkbox, gC3 vC3, �⺻
Gui, Add, Checkbox, vC4, ���� ���� ��ũ��
Gui, Add, Button,x10 y160 w90 h30 v1��, 1�μ���
GuiControl, disable, 1��
Gui, Add, Button,x110 y125 w90 h30 v���ͳ�, ����
GuiControl, disable, ���ͳ�
Gui, Add, Button,x10 y125 w90 h30 v����, ��������
GuiControl, disable, ����
Gui, Add, Button,x110 y160 w90 h30, ����
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
GuiControl,, ������,GTA5 ON
Gui, Font, c2EFE2E
GuiControl, Font, ������
GuiControl, enable, 1��
GuiControl,, 1��, 1�μ���
GuiControl, enable, ���ͳ�
GuiControl,, ���ͳ�, ����
GuiControl, enable, ����
GuiControl,, ����, ��������
GTAOK := 1
}
if GTAOK = 1
break
sleep, 3000
}
return

Button1�μ���:
If not ProcessExist("GTA5.exe")
{
GuiControl,, ������, GTA5 OFF
Gui, Font, cDF0101
GuiControl, Font, ������
GuiControl, disable, 1��
goto, CheckLevel
}
GuiControl, disable, 1��
ProcSus("GTA5.exe")
LAN_TIME := 10
Loop, 10{
GuiControl,, 1��, %LAN_TIME%��
sleep, 1000
--LAN_TIME
}
ProcRes("GTA5.exe")
GuiControl,, 1��, �۾��Ϸ�
sleep, 5000
goto, CheckLevel
return

Button����:
If not ProcessExist("GTA5.exe")
{
GuiControl,, ������, GTA5 OFF
Gui, Font, cDF0101
GuiControl, Font, ������
GuiControl, disable, ���ͳ�
goto, CheckLevel
}
GuiControl, disable, ���ͳ�
Run, %ComSpec% /c ipconfig /release
InternetSus_Time := 20
Loop, 20{
GuiControl,, ���ͳ�, %InternetSus_Time%��
sleep, 1000
--InternetSus_Time
}
Run, %ComSpec% /c ipconfig /renew
GuiControl,, ���ͳ�, �۾��Ϸ�
sleep, 5000
goto, CheckLevel
return

Button��������:
If not ProcessExist("GTA5.exe")
{
GuiControl,, ������, GTA5 OFF
Gui, Font, cDF0101
GuiControl, Font, ������
GuiControl, disable, ����
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

Button����:
Gui, submit
Msgbox,
(
==============================================
���� ���� ��ũ��
F1 = ī���� ���� �������
F2 = ī���� ���� �����
F3 = ī���� ���� ��������
F4 = ��,�Ž��� ����

�Ϲ� ��ũ��
Ctrl & 1 = ����
Ctrl & 2 = ��ź��
Ctrl & 3 = ź��
Ctrl & 4 = ��ȭ�� �ٸ� ź�� ���� ��ũ��
Ctrl & 5 = CEO, MCŬ�� �ʴ� ��ũ�� 

CEO
Ctrl & t = �һ�ũ �׽�Ʈ��
Ctrl & v = VIP �ӹ� ��ũ��
Ctrl & b = ������ �ż� ��ũ��
Ctrl & g = ���ɿ��� ��ũ��
==============================================
)
Gui,Show
return


GuiClose:
ExitApp