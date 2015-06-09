local fSleepTime = THEME:GetMetric( Var "LoadingScreen","ScreenInDelay");

local t = Def.ActorFrame {
	InitCommand=cmd();
	StartTransitioningCommand=cmd(sleep,fSleepTime);
};
return t
