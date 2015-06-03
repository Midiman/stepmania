local gc = Var("GameCommand");

return Def.ActorFrame {
	LoadFont("Common Normal") .. {
		Text=THEME:GetString("ScreenTitleMenu",gc:GetText()),
		OnCommand=cmd(shadowlength,1;maxwidth,256;diffuse,ThemeColor.TextDark),
		GainFocusCommand=cmd(zoom,1;diffuseshift;effectcolor1,ThemeColor.Primary;effectcolor2,ThemeColor.PrimaryDark),
		LoseFocusCommand=cmd(stopeffect;decelerate,TIME_SHORT;zoom,0.75),
	};
};