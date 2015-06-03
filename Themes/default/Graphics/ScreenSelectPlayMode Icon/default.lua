local gc = Var("GameCommand");

local string_name = gc:GetText()
local string_expl = THEME:GetString(Var "LoadingScreen", gc:GetName().."Explanation")
local icon_color = ModeIconColors[gc:GetName()];

local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
	GainFocusCommand=cmd(stoptweening;pulse;effectmagnitude,0.875,1,0;effectperiod,TIME_LONG;decelerate,0.05;zoom,1);
	LoseFocusCommand=cmd(stoptweening;stopeffect;decelerate,0.1;zoom,0.6);

	LoadActor("_background base") .. {
		InitCommand=cmd(diffuse,icon_color),
		GainFocusCommand=cmd(stoptweening;smooth,TIME_SHORT;diffuse,icon_color),
		LoseFocusCommand=cmd(stoptweening;decelerate,TIME_NORMAL;diffuse,ThemeColor.DecorationBackgroundDark)
	};
	LoadActor("_background effect");
	LoadActor("_stroke") .. {
		InitCommand=cmd(diffuse,icon_color),
		GainFocusCommand=cmd(stoptweening;smooth,TIME_SHORT;diffuse,icon_color),
		LoseFocusCommand=cmd(stoptweening;decelerate,TIME_NORMAL;diffuse,ColorDarkTone(icon_color))
	};
	LoadActor("_gloss") .. {
		OnCommand=cmd(blend,Blend.Add),
		GainFocusCommand=cmd(glowshift;visible,true),
		LoseFocusCommand=cmd(stopeffect;visible,false)
	},
	LoadActor("_cutout");

	-- todo: generate a better font for these.
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
	LoadActor("_background base") .. {
		DisabledCommand=cmd(diffuse,color("0,0,0,0.5"));
		EnabledCommand=cmd(diffuse,color("1,1,1,0"));
	};
};
return t