local t = Def.ActorFrame {};

local _height = MENU_FOOTER_HEIGHT

-- Shadow
t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(y,-_height;vertalign,bottom;zoomto,SCREEN_WIDTH,8),
		OnCommand=cmd(diffuse,Color.Outline;fadetop,1)
	},
	-- 1px
	Def.Quad {
		InitCommand=cmd(y,-_height;vertalign,bottom;zoomto,SCREEN_WIDTH,1),
		OnCommand=cmd(diffuse,Color.Outline)
	}
}

-- Fill
t[#t+1] = Def.Quad {
	InitCommand=cmd(vertalign,bottom;zoomto,SCREEN_WIDTH,_height;diffuse,ThemeColor.DecorationBackgroundDark);
};

-- Highlight
t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(y,-_height;vertalign,top;zoomto,SCREEN_WIDTH,1),
		OnCommand=cmd(diffuse,ThemeColor.DecorationBackground)
	}
}
return t;
