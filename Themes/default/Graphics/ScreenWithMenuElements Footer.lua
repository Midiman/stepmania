local t = Def.ActorFrame {};

-- Shadow
t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(y,-32;vertalign,bottom;zoomto,SCREEN_WIDTH,8),
		OnCommand=cmd(diffuse,Color.Outline;fadetop,1)
	},
	-- 1px
	Def.Quad {
		InitCommand=cmd(y,-32;vertalign,bottom;zoomto,SCREEN_WIDTH,1),
		OnCommand=cmd(diffuse,Color.Outline)
	}
}

-- Fill
t[#t+1] = Def.Quad {
	InitCommand=cmd(vertalign,bottom;zoomto,SCREEN_WIDTH,32;diffuse,ThemeColor.DecorationBackgroundDark);
};

-- Highlight
t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(y,-32;vertalign,top;zoomto,SCREEN_WIDTH,1),
		OnCommand=cmd(diffuse,ThemeColor.DecorationBackground)
	}
}
return t;
