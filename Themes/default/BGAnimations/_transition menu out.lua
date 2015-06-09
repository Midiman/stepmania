local fSleepTime = THEME:GetMetric( Var "LoadingScreen","ScreenOutDelay")

local t = Def.ActorFrame {
	InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y),
	StartTransitioningCommand=cmd(sleep,fSleepTime)
}

local swipe = Def.ActorFrame {
	InitCommand=cmd(x,-SCREEN_WIDTH * 2),
	OnCommand=cmd(accelerate,TIME_TRANSITION;x,0),
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
