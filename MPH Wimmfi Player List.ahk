#NoEnv
ListLines, Off
SetBatchLines, -1
#SingleInstance Force
global version := "0.2"
global onlinePlayerCount, playerData

FileInstall, img\back.png, %A_Temp%\back.png,1
FileInstall, img\bg.jpg, %A_Temp%\bg.jpg,1
FileInstall, img\battle.png, %A_Temp%\battle.png,1
FileInstall, img\bounty.png, %A_Temp%\bounty.png,1
FileInstall, img\capture.png, %A_Temp%\capture.png,1
FileInstall, img\defender.png, %A_Temp%\defender.png,1
FileInstall, img\friends.png, %A_Temp%\friends.png,1
FileInstall, img\nodes.png, %A_Temp%\nodes.png,1
FileInstall, img\primehunter.png, %A_Temp%\primehunter.png,1
FileInstall, img\rivals.png, %A_Temp%\rivals.png,1
FileInstall, img\survival.png, %A_Temp%\survival.png,1
FileInstall, img\wifi.png, %A_Temp%\wifi.png,1
FileInstall, fonts\Metroid Prime Hunters.ttf, %A_Temp%\mph.ttf,1
RutaFuente = %A_Temp%/mph.ttf
font1 := New CustomFont(RutaFuente)
Gui, +LastFound +E0x02000000 +E0x00080000
Gui +hWndhMainWnd -Caption
Gui Color, 0x373737
Gui Font, s16 c0xFFFFCA, Metroid Prime: Hunters TTF
Gui Add, ListBox, hWndhLbxItems x15 y48 w200 h326 +BackgroundTrans -VScroll -0x40000 -0x240000 -0xA40000 vguiListBoxPlayers gselectPlayer, 
ControlColor(hLbxItems, hMainWnd, 0x373737, 0xFFFFAA)
Gui Font, s18 c0xE7650C, Metroid Prime: Hunters TTF
Gui Add, Text, x16 y16 w150 h23 +0x200 +BackgroundTrans -0x40000 -0x240000 -0xA40000, Player List
Gui Font, s16 c0xE7650C, Metroid Prime: Hunters TTF
Gui Add, Text, x232 y48 w141 h23 +0x200 +BackgroundTrans, Player Name:
Gui Font, s16 c0xFFFFFF, Metroid Prime: Hunters TTF
Gui Add, Text, x376 y48 w184 h23 +0x200 +BackgroundTrans vguiPlayerName
Gui Font, s16 c0xE7650C, Metroid Prime: Hunters TTF
Gui Add, Text, x232 y80 w128 h23 +0x200 +BackgroundTrans, Friend Code:
Gui Font, s16 c0xFFFFFF, Metroid Prime: Hunters TTF
Gui Add, Text, x368 y80 w200 h23 +0x200 +BackgroundTrans vguiFc
Gui Font, s16 c0xE7650C, Metroid Prime: Hunters TTF
Gui Add, Text, x232 y112 w151 h23 +0x200 +BackgroundTrans, Online Status:
Gui Font, s16 c0xFFFFFF, Metroid Prime: Hunters TTF
Gui Add, Text, x384 y112 w230 h23 +0x200 +BackgroundTrans vguiOnlineStatus
Gui Font, s16 c0xE7650C, Metroid Prime: Hunters TTF
Gui Add, Text, x232 y144 w155 h23 +0x200 +BackgroundTrans, Player Status:
Gui Font, s16 c0xFFFFFF, Metroid Prime: Hunters TTF
Gui Add, Text, x392 y144 w221 h23 +0x200 +BackgroundTrans vguiPlayerStatus
Gui Font, s16 c0xE7650C, Metroid Prime: Hunters TTF
Gui Add, Text, x232 y176 w137 h23 +0x200 +BackgroundTrans, Join Players:
Gui Font, s16 c0xFFFFFF, Metroid Prime: Hunters TTF
Gui Add, Text, x371 y176 w221 h23 +0x200 +BackgroundTrans vguiJoinPlayers
Gui Font, s16 c0xE7650C, Metroid Prime: Hunters TTF
Gui Add, Text, x232 y208 w108 h23 +0x200 +BackgroundTrans, Game Info:
Gui Font, s16 c0xFFFFFF, Metroid Prime: Hunters TTF
Gui Add, Text, x344 y208 w273 h23 +0x200 +BackgroundTrans vguiGameInfo
Gui Font, s16 c0xE7650C, Metroid Prime: Hunters TTF
Gui Add, Text, x232 y240 w200 h23 +0x200 +BackgroundTrans, Number of Players:
Gui Font, s16 c0xFFFFFF, Metroid Prime: Hunters TTF
Gui Add, Text, x440 y240 w270 h23 +0x200 +BackgroundTrans vguiNumberOfPlayers,
Gui Add, Picture, x582 y0 w40 h40 -0x40000 -0x240000 -0xA40000 gmoverVentana, %A_Temp%\wifi.png
Gui Font, s16 c0xA4E1FF, Metroid Prime: Hunters TTF
Gui Add, Text, x142 y422 w477 h23 +0x200 +Right +BackgroundTrans, MPH Wiimmfi Player list by elModo7    v%version%
Gui Add, Picture, x16 y384 w50 h50 -0x40000 -0x240000 -0xA40000 gGuiEscape, %A_Temp%\back.png
Gui Add, Picture, x384 y280 w96 h96 -0x40000 -0x240000 -0xA40000 +BackgroundTrans vguiImgMode1 Hidden, %A_Temp%\bounty.png
Gui Add, Picture, x504 y280 w96 h96 -0x40000 -0x240000 -0xA40000 +BackgroundTrans vguiImgMode2 Hidden, %A_Temp%\battle.png
Gui Add, Picture, x232 y288 w32 h32 -0x40000 -0x240000 -0xA40000 vguiImgFriends Hidden, %A_Temp%\friends.png
Gui Add, Picture, x232 y336 w32 h32 -0x40000 -0x240000 -0xA40000 vguiImgRivals Hidden, %A_Temp%\rivals.png
Gui Font, s16 c0x5E5EFF, Metroid Prime: Hunters TTF
Gui Add, Text, x272 y292 w81 h23 +0x200 +BackgroundTrans vguiFriends Hidden, Friends
Gui Font, s16 c0xFF6262, Metroid Prime: Hunters TTF
Gui Add, Text, x272 y340 w68 h23 +0x200 +BackgroundTrans vguiRivals Hidden, Rivals
Gui Add, Text, x0 y0 w584 h23 +0x200 +Center +BackgroundTrans -0x40000 -0x240000 -0xA40000 gmoverVentana, ; Movable Area
Gui Font, s16 c0x80FF80, Metroid Prime: Hunters TTF
Gui Add, Text, x368 y0 w211 h23 +0x200 +Right +BackgroundTrans gmoverVentana vguiTime, Last updated %A_Hour%:%A_Min%
Gui, Add, Picture, x0 y0 w622 h446, %A_Temp%\bg.jpg
Gui Show, w622 h446, MPH Wiimmfi List by elModo7
gosub, refreshPlayerData
SetTimer, refreshPlayerData, 16000
SetTimer, checkMouseStatus, 100
Return

selectPlayer:
	GuiControlGet, selectedPlayerName,,guiListBoxPlayers
	if(selectedPlayerName != "")
		guiListBoxPlayers := selectedPlayerName
	player_key = 0
	for key, value in playerData
	{
		if(value[11] = guiListBoxPlayers)
		{
			player_key := key
			break
		}
	}
	for k, v in playerData[player_key]
	{
		if(k = 3)
			GuiControl,,guiFc, %v%
		else if(k = 6)
		{
			ls_stat := v
			while(strLen(v) < 7)
				v := "0" v
			if(StrLen(v) < 8)
				v := "1" v
			estados := strSplit(v)
			for key, value in estados
			{
				if(key = "1")
				{
					if(value = "1")
						GuiControl,,guiNumberOfPlayers, 1
					else if(value = "2")
						GuiControl,,guiNumberOfPlayers, 2
					else if(value = "4")
						GuiControl,,guiNumberOfPlayers, 3
					else if(value = "6")
						GuiControl,,guiNumberOfPlayers, 4
				}
				else if(key = "2")
				{
					if(value = "0")
					{
						GuiControl,, guiGameInfo, Survival / None
						GuiControl,, guiImgMode1, %A_Temp%\survival.png
						GuiControl,Hide, guiImgMode2
						GuiControl,Show, guiImgMode1
					}
					else if(value = "1")
					{
						GuiControl,, guiGameInfo, Battle / Bounty
						GuiControl,, guiImgMode1, %A_Temp%\battle.png
						GuiControl,, guiImgMode2, %A_Temp%\bounty.png
						GuiControl,Show, guiImgMode1
						GuiControl,Show, guiImgMode2
					}
					else if(value = "2")
					{
						GuiControl,, guiGameInfo, Defender / Capture
						GuiControl,, guiImgMode1, %A_Temp%\defender.png
						GuiControl,, guiImgMode2, %A_Temp%\capture.png
						GuiControl,Show, guiImgMode2
					}
					else if(value = "3")
					{
						GuiControl,, guiGameInfo, Prime Hunter / Nodes
						GuiControl,, guiImgMode1, %A_Temp%\primehunter.png
						GuiControl,, guiImgMode2, %A_Temp%\nodes.png
						GuiControl,Show, guiImgMode1
						GuiControl,Show, guiImgMode2
					}
				}
				else if(key = "7")
				{
					rivalsValue := value
					if(value = "1")
					{
						GuiControl, Show, guiImgRivals
						GuiControl, Show, guiRivals
					}
					else
					{
						GuiControl, Hide, guiImgRivals
						GuiControl, Hide, guiRivals
					}
				}
				else if(key = "8")
				{
					if(value = "8")
					{
						GuiControl, Show, guiImgFriends
						GuiControl, Show, guiFriends
					}
					else
					{
						GuiControl, Hide, guiImgFriends
						GuiControl, Hide, guiFriends
					}
					if(rivalsValue && value = "8")
					{
						GuiControl,, guiJoinPlayers, Friends and Rivals
					}
					else if(rivalsValue)
					{
						GuiControl,, guiJoinPlayers, Rivals Only
					}
					else if(value = "8")
					{
						GuiControl,, guiJoinPlayers, Friends Only
					}
				}
			}
		}
		else if(k = 7)
		{
			if(v = "o")
			{
				GuiControl,,guiOnlineStatus, Online
			}
			else if(v = "og")
			{
				GuiControl,,guiOnlineStatus, Guest of Room
			}
			else if(v = "oGv")
			{
				GuiControl,,guiOnlineStatus, In Game
			}
			else if(v = "oGvS")
			{
				GuiControl,,guiOnlineStatus, Searching for Game
			}
		}
		else if(k = 8)
		{
			if(v = "1")
			{
				GuiControl,,guiPlayerStatus, Online
			}
			else if(v = "2")
			{
				GuiControl,,guiPlayerStatus, Guest Room
			}
			else if(v = "3")
			{
				GuiControl,,guiPlayerStatus, Searching Opponents
			}
			else if(v = "5")
			{
				GuiControl,,guiPlayerStatus, Joining Game
			}
			else if(v = "6")
			{
				GuiControl,,guiPlayerStatus, Hosting Game
			}
			if(ls_stat = 0 && v = 6)
			{
				GuiControl,,guiOnlineStatus, In-Game (Host)
				GuiControl,,guiNumberOfPlayers, Unknown
				GuiControl,, guiGameInfo, Unknown
				GuiControl,Hide, guiImgMode2
				GuiControl,Hide, guiImgMode1
			}
			else if(ls_stat = 0 && v = 2)
			{
				GuiControl,,guiOnlineStatus, In-Game (Client)
				GuiControl,,guiNumberOfPlayers, Unknown
				GuiControl,, guiGameInfo, Unknown
				GuiControl,Hide, guiImgMode2
				GuiControl,Hide, guiImgMode1
			}
		}
		else if(k = 11)
			GuiControl,,guiPlayerName, %v%
	}
return

refreshPlayerData:
	wsData := URLToVar("https://wiimmfi.de/stats/game/mprimeds")
	beginTable := InStr(wsData, "id=""online""")
	if(beginTable = 0)
	{
		onlinePlayerCount := 0
	}
	else
	{
		firstResult := InStr(wsData, "tr0")-11
		wsTxtPlayerData := SubStr(wsData, firstResult, InStr(wsData, "</table>") - firstResult) 
		wsTxtPlayerData := StrSplit(wsTxtPlayerData, "`n")
		playerData := Object()
		curPlayerData := array()
		firstElem := 1
		for k, v in wsTxtPlayerData
		{
			if(!Mod(k,14))
			{
				counter := 0
				for index, value in playerData
					counter++
				playerData[counter] := curPlayerData
				curPlayerData := array()
				firstElem := 1
			}
			else
			{
				if(!firstElem)
				{
					section := StrReplace(v, "<td class=""dbnull"">")
					section := StrReplace(section, "<td>")
					section := StrReplace(section, "</td>")
					section := StrReplace(section, "&mdash;", "-")
					curPlayerData.push(section) ; Push data, skip first row
				}
				else
				{
					firstElem := 0
				}
			}
		}
	}
	names := ""
	for key, value in playerData
	{
		names .= value[11] "|"
	}
	GuiControl,,guiListBoxPlayers, % "|" names
	GuiControl,,guiTime, Last updated %A_Hour%:%A_Min%
	gosub, selectPlayer
return

moverVentana:
	PostMessage, 0xA1, 2,,, A 
Return

GuiEscape:
GuiClose:
    ExitApp

URLToVar(URL)
{
    ComObjError(0)
    WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    WebRequest.Open("GET", URL)
    WebRequest.Send()
    Return WebRequest.ResponseText()
}

ControlColor(Control, Window, bc := "", tc := "", Redraw := 1) {
    a := {}
    a["c"]  := Control
    a["g"]  := Window
    a["bc"] := (bc = "") ? "" : (((bc & 255) << 16) + (((bc >> 8) & 255) << 8) + (bc >> 16))
    a["tc"] := (tc = "") ? "" : (((tc & 255) << 16) + (((tc >> 8) & 255) << 8) + (tc >> 16))
    CC_WindowProc("Set", a, "", "")
    If (Redraw) {
        WinSet Redraw,, ahk_id %Control%
    }
}

CC_WindowProc(hWnd, uMsg, wParam, lParam) {
    Static Win := {}

    If uMsg Between 0x132 And 0x138
    If (Win[hWnd].HasKey(lParam)) {
        If (tc := Win[hWnd, lParam, "tc"]) {
            DllCall("gdi32.dll\SetTextColor", "Ptr", wParam, "UInt", tc)
        }
        If (bc := Win[hWnd, lParam, "bc"]) {
            DllCall("gdi32.dll\SetBkColor",   "Ptr", wParam, "UInt", bc)
        }
        Return Win[hWnd, lParam, "Brush"] ; Return the HBRUSH to notify the OS that we altered the HDC.
    }

    If (hWnd = "Set") {
        a := uMsg
        Win[a.g, a.c] := a
        If (Win[a.g, a.c, "tc"] == "") And (Win[a.g, a.c, "bc"] == "")
            Win[a.g].Remove(a.c, "")
        If Not Win[a.g, "WindowProcOld"]
            Win[a.g,"WindowProcOld"] := DllCall("SetWindowLong" . (A_PtrSize == 8 ? "Ptr" : "")
            , "Ptr", a.g, "Int", -4, "Ptr", RegisterCallback("CC_WindowProc", "", 4), "UPtr")
        If Win[a.g, a.c, "Brush"]
            DllCall("gdi32.dll\DeleteObject", "Ptr", Brush)
        If (Win[a.g, a.c, "bc"] != "")
            Win[a.g, a.c, "Brush"] := DllCall("gdi32.dll\CreateSolidBrush", "UInt", a.bc, "UPtr")
        Return
    }
    Return DllCall("CallWindowProc", "Ptr", Win[hWnd, "WindowProcOld"], "Ptr", hWnd, "UInt", uMsg, "Ptr", wParam, "Ptr", lParam, "Ptr")
}

:*X:em7::MsgBox, If you are reading this`, you got the easter egg! `nelModo7 20/09/2020


Class CustomFont
{
	static FR_PRIVATE  := 0x10

	__New(FontFile, FontName="", FontSize=30) {
		if RegExMatch(FontFile, "i)res:\K.*", _FontFile) {
			this.AddFromResource(_FontFile, FontName, FontSize)
		} else {
			this.AddFromFile(FontFile)
		}
	}

	AddFromFile(FontFile) {
		DllCall( "AddFontResourceEx", "Str", FontFile, "UInt", this.FR_PRIVATE, "UInt", 0 )
		this.data := FontFile
	}

	AddFromResource(ResourceName, FontName, FontSize = 30) {
		static FW_NORMAL := 400, DEFAULT_CHARSET := 0x1

		nSize    := this.ResRead(fData, ResourceName)
		fh       := DllCall( "AddFontMemResourceEx", "Ptr", &fData, "UInt", nSize, "UInt", 0, "UIntP", nFonts )
		hFont    := DllCall( "CreateFont", Int,FontSize, Int,0, Int,0, Int,0, UInt,FW_NORMAL, UInt,0
		            , Int,0, Int,0, UInt,DEFAULT_CHARSET, Int,0, Int,0, Int,0, Int,0, Str,FontName )

		this.data := {fh: fh, hFont: hFont}
	}

	ApplyTo(hCtrl) {
		SendMessage, 0x30, this.data.hFont, 1,, ahk_id %hCtrl%
	}

	__Delete() {
		if IsObject(this.data) {
			DllCall( "RemoveFontMemResourceEx", "UInt", this.data.fh    )
			DllCall( "DeleteObject"           , "UInt", this.data.hFont )
		} else {
			DllCall( "RemoveFontResourceEx"   , "Str", this.data, "UInt", this.FR_PRIVATE, "UInt", 0 )
		}
	}

	; ResRead() By SKAN, from http://www.autohotkey.com/board/topic/57631-crazy-scripting-resource-only-dll-for-dummies-36l-v07/?p=609282
	ResRead( ByRef Var, Key ) {
		VarSetCapacity( Var, 128 ), VarSetCapacity( Var, 0 )
		If ! ( A_IsCompiled ) {
			FileGetSize, nSize, %Key%
			FileRead, Var, *c %Key%
			Return nSize
		}

		If hMod := DllCall( "GetModuleHandle", UInt,0 )
			If hRes := DllCall( "FindResource", UInt,hMod, Str,Key, UInt,10 )
				If hData := DllCall( "LoadResource", UInt,hMod, UInt,hRes )
					If pData := DllCall( "LockResource", UInt,hData )
						Return VarSetCapacity( Var, nSize := DllCall( "SizeofResource", UInt,hMod, UInt,hRes ) )
							,  DllCall( "RtlMoveMemory", Str,Var, UInt,pData, UInt,nSize )
		Return 0
	}
}

checkMouseStatus()
{
	global playerListSelected
	MouseGetPos, ,,,c 
	if ( c = "ListBox1")
	{
		if (!playerListSelected)
		{
			playerListSelected := 1
		}
	}
	else
	{
		playerListSelected := 0
	}
}

#If playerListSelected && WinActive("MPH Wiimmfi List by elModo7")
	WheelDown::Send, {Down}
	WheelUp::Send, {Up}
#If