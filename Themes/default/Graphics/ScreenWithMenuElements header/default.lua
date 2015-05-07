local t = Def.ActorFrame {};

local text_width = 0;

local function IsHeaderTextVisible()
	local r = Screen.String("HeaderText");
	return string.len(r) > 0 and true or false
end

-- Background
t[#t+1] = Def.ActorFrame {
	-- Background
	Def.Quad {
		InitCommand=cmd(y,48;vertalign,top;zoomto,SCREEN_WIDTH+1,8),
		OnCommand=cmd(diffuse,Color.Outline;fadebottom,1)
	},
	-- Background 1px
	Def.Quad {
		InitCommand=cmd(y,48;vertalign,top;zoomto,SCREEN_WIDTH+1,1),
		OnCommand=cmd(diffuse,Color.Outline)
	},
	-- Fill
	Def.Quad {
		InitCommand=cmd(vertalign,top;zoomto,SCREEN_WIDTH+1,48;diffuse,ThemeColor.DecorationBackgroundDark);
	},
	-- Highlight
	Def.Quad {
		InitCommand=cmd(y,48;vertalign,bottom;zoomto,SCREEN_WIDTH+1,1),
		OnCommand=cmd(diffuse,ThemeColor.DecorationBackground)
	},
}
t[#t+1] = LoadActor("_texture stripe") .. {
	Name="TextureStripe";
	InitCommand=cmd(x,-SCREEN_CENTER_X-12;y,4;horizalign,left;vertalign,top;zoomto,320,40;customtexturerect,0,0,(320/2)/8,50/32);
	OnCommand=cmd(texcoordvelocity,2,0;skewx,-0.0575;diffuse,ThemeColor.DecorationBackground;diffusealpha,1;faderight,1);
}

-- Text
t[#t+1] = Def.Quad {
	Name="Underline",
	InitCommand=cmd(x,-SCREEN_CENTER_X+24;y,36;horizalign,left),
	OnCommand=cmd(stoptweening;visible,IsHeaderTextVisible();diffuse,ThemeColor.Primary;linear,0.25;zoomtowidth,text_width),
};

t[#t+1] = LoadFont("Common Bold") .. {
	Name="HeaderText",
	Text=Screen.String("HeaderText"),
	InitCommand=cmd(x,-SCREEN_CENTER_X+24;y,26;zoom,1;horizalign,left;shadowlength,0;maxwidth,200;queuecommand,"Set"),
	OnCommand=cmd(visible,IsHeaderTextVisible();diffuse,ThemeColor.Primary),
	BeginCommand=function(self)
		text_width = self:GetWidth();
	end,
	UpdateScreenHeaderMessageCommand=function(self,param)
		self:settext(param.Header);
	end;
};
return t
