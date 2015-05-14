local x = Def.ActorFrame{
	OnCommand=cmd(Center;zoomy,0;decelerate,0.5;zoomy,1),
	OffCommand=cmd(finishtweening;zoomy,1;accelerate,0.35;zoomy,0),
	--
	Def.Quad{
		InitCommand=cmd(zoomto,SCREEN_WIDTH,80;diffuse,color("0,0,0,0.5"));
		OnCommand=cmd();
		OffCommand=cmd();
	};
	LoadFont("Common Normal")..{
		Text=ScreenString("Loading Profiles");
		InitCommand=cmd(diffuse,color("1,1,1,1");shadowlength,1);
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
