local fSleepTime = THEME:GetMetric( Var "LoadingScreen","ScreenInDelay");

local t = Def.ActorFrame {
	InitCommand=cmd();
	OnCommand=cmd(sleep,fSleepTime);
};
return t
