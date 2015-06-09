local fSleepTime = THEME:GetMetric( Var "LoadingScreen","ScreenOutDelay");

local t = Def.ActorFrame {
	InitCommand=cmd();
	StartTransitioningCommand=cmd(sleep,fSleepTime);
};
return t
