local fSleepTime = THEME:GetMetric( Var "LoadingScreen","ScreenInDelay")

local t = Def.ActorFrame {
	InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y),
	StartTransitioningCommand=cmd(sleep,fSleepTime)
}

local swipe = Def.ActorFrame {
	OnCommand=cmd(decelerate,TIME_TRANSITION;x,SCREEN_WIDTH * 2),
	--
	Def.Quad {
		InitCommand=cmd(zoomto,SCREEN_CENTER_X,SCREEN_HEIGHT;x,-SCREEN_CENTER_X;horizalign,right),
		OnCommand=cmd(diffuse,Color.Black;fadeleft,1)
	},
	Def.Quad {
		InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT),
		OnCommand=cmd(diffuse,Color.Black)
	}
}

t[#t+1] = swipe .. {}

return t
