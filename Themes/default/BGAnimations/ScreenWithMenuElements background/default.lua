local t = Def.ActorFrame {}

t[#t+1] = Def.ActorFrame {
	FOV=90,
	InitCommand=cmd(Center),
	--
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT),
		OnCommand=cmd(diffuse,ThemeColor.BackgroundDark),
	}
}

t[#t+1] = LoadActor( THEME:GetPathB("","_checkerboard") ) .. {
	InitCommand=cmd(Center)
}

t[#t+1] = LoadActor("_guides")

return t
