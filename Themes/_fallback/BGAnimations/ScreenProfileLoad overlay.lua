local x = Def.ActorFrame {
	InitCommand=cmd(Center),
	--
	Def.Quad{
		InitCommand=cmd(zoomto,SCREEN_WIDTH,80;diffuse,color("0,0,0,0.5"));
		OnCommand=cmd();
		OffCommand=cmd(accelerate,TIME_NORMAL;diffusealpha,0);
	};
	LoadFont("Common Normal")..{
		Text=ScreenString("Loading Profiles");
		InitCommand=cmd(shadowlength,1);
		OnCommand=cmd(diffusealpha,0;smooth,TIME_SHORT;diffusealpha,1),
		OffCommand=cmd(stoptweening;accelerate,TIME_NORMAL;diffusealpha,0)
	};
};

x[#x+1] = Def.Actor {
	BeginCommand=function(self)
		if SCREENMAN:GetTopScreen():HaveProfileToLoad() then self:sleep(1); end;
		self:queuecommand("Load");
	end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};

return x;
