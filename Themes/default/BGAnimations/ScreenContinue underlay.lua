local timer_seconds = THEME:GetMetric(Var "LoadingScreen","TimerSeconds");
local t = Def.ActorFrame {};

--
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center;y,SCREEN_CENTER_Y-24);
	-- Underline
	Def.Quad {
		InitCommand=cmd(y,16;zoomto,256,1);
		OnCommand=cmd(diffuse,color("#ffd400");shadowlength,1;shadowcolor,BoostColor(color("#ffd40077"),0.25);linear,0.25;zoomtowidth,256;fadeleft,0.25;faderight,0.25);
	};
	LoadFont("Common Bold") .. {
		Text="Continue?";
		OnCommand=cmd(skewx,-0.125;diffuse,color("#ffd400");shadowlength,2;shadowcolor,BoostColor(color("#ffd40077"),0.25));
	};
};
--
return t
