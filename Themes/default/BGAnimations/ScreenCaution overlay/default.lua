local t = Def.ActorFrame {};

-- Fade
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,Color.Black;diffusealpha,0;linear,0.5;diffusealpha,0.75);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
	};
};
-- Emblem
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);
	OnCommand=cmd(diffusealpha,0;zoom,1.25;decelerate,1;diffusealpha,0.8;zoom,1;pulse;effectmagnitude,1,1.05,1;effectperiod,2);
	OffCommand=cmd(finishtweening;accelerate,0.25;zoom,1.8;diffusealpha,0);
	LoadActor("_warning bg") .. {
		OnCommand=cmd(diffuse,Color.Yellow);
	};
	Def.ActorFrame {
		LoadActor("_exclamation") .. {
			OnCommand=cmd(diffuse,Color.Yellow);
		};
	};
};

-- Text
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center;y,SCREEN_CENTER_Y);
	OnCommand=cmd(addy,-96);
	-- Underline
	Def.Quad {
		InitCommand=cmd(y,24;zoomto,256,2);
		OnCommand=cmd(diffuse,color("#ffd400");shadowcolor,BoostColor(color("#ffd40077"),0.25);linear,0.25;zoomtowidth,256;fadeleft,0.25;faderight,0.25);
		OffCommand=cmd(finishtweening;linear,0.25;diffusealpha,0);
	};
	LoadFont("Common Large") .. {
		Text=Screen.String("Caution");
		OnCommand=cmd(skewx,-0.125;diffuse,color("#ffd400");strokecolor,ColorDarkTone(color("#ffd400"));
			zoomx,2;zoomy,0.25;diffusealpha,0;decelerate,0.25;zoom,1;diffusealpha,1);
		OffCommand=cmd(finishtweening;linear,0.25;diffusealpha,0);
	};
	LoadFont("Common Normal") .. {
		Text=Screen.String("CautionText");
		InitCommand=cmd(y,128);
		OnCommand=cmd(strokecolor,color("0,0,0,0.5");shadowlength,1;wrapwidthpixels,SCREEN_WIDTH-80;
			diffusealpha,0;zoom,1.25;decelerate,0.25;diffusealpha,1;zoom,1);
		OffCommand=cmd(finishtweening;linear,0.25;diffusealpha,0);
	};
};
--
return t
