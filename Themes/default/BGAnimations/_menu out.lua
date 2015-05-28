local fSleepTime = THEME:GetMetric( Var "LoadingScreen","ScreenInDelay")

local t = Def.ActorFrame {
	InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y),
	OnCommand=cmd(sleep,0.25+fSleepTime)
}

local swipe = Def.ActorFrame {
	InitCommand=cmd(x,-SCREEN_WIDTH * 2),
	OnCommand=cmd(linear,0.5;x,0),
	--
	Def.Quad {
		InitCommand=cmd(zoomto,SCREEN_CENTER_X,SCREEN_HEIGHT;x,SCREEN_CENTER_X;horizalign,left),
		OnCommand=cmd(diffuse,Color.Black;faderight,1)
	},
	Def.Quad {
		InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT),
		OnCommand=cmd(diffuse,Color.Black)
	}
}

t[#t+1] = swipe .. {}

return t
