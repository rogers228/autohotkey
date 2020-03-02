#SingleInstance force ;禁止多開
CoordMode, Mouse, Screen ;滑鼠位置採用全螢幕座標

Gui, 1:+AlwaysOnTop +ToolWindow ;-MaximizeBox -MinimizeBox
Gui, 1:Add, Text,x10 y10, Ctrl+M Get Pos:
Gui, 1:Add, Edit, r1 x90 y7  vT1, 9999
Gui, 1:Add, Edit, r1 x125 y7  vT2, 9999
Gui, 1:Show, x1200 y0 w162 , click it

;設定預設值
x1= 500
y1 = 300
GuiControl,, T1, %x1%
GuiControl,, T2, %y1%

^p:: ;Ctrl+P 滑鼠按一下固定位置
	Gui, Submit 
	gx = %T1%
	gy = %T2%
	MouseGetPos, cx, cy ;記住現在位置
	MouseClick, left, gx, gy, ,5 ;按下滑鼠左鍵 速度5
	MouseMove, %cx%, %cy%, 0 ;立即回去
	Gui, 1:Show
	Return
	
^m:: ; Ctrl+M 設定當前滑鼠座標
	MouseGetPos, xpos, ypos
	;MsgBox, The cursor is at X%xpos% Y%ypos%.
	GuiControl,, T1, %xpos%
	GuiControl,, T2, %ypos%
	
	Return