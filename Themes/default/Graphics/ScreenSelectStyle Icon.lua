local gc = Var("GameCommand");

local string_name = gc:GetText();
local string_expl = THEME:GetString("StyleType", gc:GetStyle():GetStyleType());
local icon_color = color("#FFCB05");
local icon_color2 = color("#F0BA00");

local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame { 
	GainFocusCommand=THEME:GetMetric(Var "LoadingScreen","IconGainFocusCommand");
	LoseFocusCommand=THEME:GetMetric(Var "LoadingScreen","IconLoseFocusCommand");

	LoadActor(THEME:GetPathG("ScreenSelectPlayMode", "icon/_background base"))..{
		--OnCommand=cmd(diffuse,ThemeColor.DecorationBackgroundDark),
		GainFocusCommand=cmd(stoptweening;smooth,TIME_SHORT;diffuse,ThemeColor.Primary),
		LoseFocusCommand=cmd(stoptweening;decelerate,TIME_NORMAL;diffuse,ThemeColor.DecorationBackgroundDark)
	},
	LoadActor(THEME:GetPathG("ScreenSelectPlayMode", "icon/_background effect"));

	LoadActor(THEME:GetPathG("ScreenSelectPlayMode", "icon/_stroke")) .. {
		GainFocusCommand=cmd(stoptweening;smooth,TIME_SHORT;diffuse,ThemeColor.Primary),
		LoseFocusCommand=cmd(stoptweening;decelerate,TIME_NORMAL;diffuse,ThemeColor.DecorationBackground)
	},
	LoadActor(THEME:GetPathG("ScreenSelectPlayMode", "icon/_gloss")) .. {
		OnCommand=cmd(blend,Blend.Add),
		GainFocusCommand=cmd(glowshift;visible,true),
		LoseFocusCommand=cmd(stopeffect;visible,false)
	},
	LoadActor(THEME:GetPathG("ScreenSelectPlayMode", "icon/_cutout"));

	LoadFont("Common Large")..{
		Text=string.upper(string_name);
		InitCommand=cmd(y,-12;maxwidth,232);
		OnCommand=cmd(diffuse,ThemeColor.Text;strokecolor,Color.Outline);
	};
	LoadFont("Common Normal")..{
		Text=string.upper(string_expl);
		InitCommand=cmd(y,28;maxwidth,232/0.75;zoom,0.75),
		OnCommand=cmd(diffuse,ThemeColor.TextDark)
	};

	LoadActor(THEME:GetPathG("ScreenSelectPlayMode", "icon/_background base"))..{
		DisabledCommand=cmd(diffuse,color("0,0,0,0.5"));
		EnabledCommand=cmd(diffuse,color("1,1,1,0"));
	};
};
return t