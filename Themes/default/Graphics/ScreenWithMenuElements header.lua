local t = Def.ActorFrame {};

local _height = MENU_HEADER_HEIGHT

local text_width = 0;

local function IsHeaderTextVisible()
	local r = Screen.String("HeaderText");
	return string.len(r) > 0 and true or false
end

-- Background
t[#t+1] = Def.ActorFrame {
	-- Background
	Def.Quad {
		InitCommand=cmd(y,_height;vertalign,top;zoomto,SCREEN_WIDTH+1,8),
		OnCommand=cmd(diffuse,Color.Outline;fadebottom,1)
	},
	-- Background 1px
	Def.Quad {
		InitCommand=cmd(y,_height;vertalign,top;zoomto,SCREEN_WIDTH+1,1),
		OnCommand=cmd(diffuse,Color.Outline)
	},
	-- Fill
	Def.Quad {
		InitCommand=cmd(vertalign,top;zoomto,SCREEN_WIDTH+1,_height;diffuse,ThemeColor.DecorationBackgroundDark);
	},
	-- Highlight
	Def.Quad {
		InitCommand=cmd(y,_height;vertalign,bottom;zoomto,SCREEN_WIDTH+1,1),
		OnCommand=cmd(diffuse,ThemeColor.DecorationBackground)
	},
}
t[#t+1] = LoadActor("_texture stripe") .. {
	Name="TextureStripe";
	InitCommand=cmd(x,-SCREEN_CENTER_X-12;y,_height * 0.125;horizalign,left;vertalign,top;zoomto,320,_height * 0.75;customtexturerect,0,0,(320/2)/8,50/32);
	OnCommand=cmd(texcoordvelocity,2,0;skewx,-0.0575;diffuse,ThemeColor.DecorationBackground;faderight,1;
		accelerate,TIME_SHORT;diffuse,Color.Alpha(ThemeColor.Primary,0.5);decelerate,TIME_NORMAL;diffuse,ThemeColor.DecorationBackground);
}

-- Text
t[#t+1] = Def.ActorFrame {
	BeginCommand=function(self)
		local c = self:GetChildren();
		local width = c.HeaderText:GetWidth()
		
		c.Underline:basezoomx(c.HeaderText:GetWidth())
	end,
	--
	OnCommand=cmd(finishtweening;addx,-16;diffusealpha,0;decelerate,TIME_NORMAL;addx,16;diffusealpha,1),
	OffCommand=cmd(finishtweening;accelerate,TIME_NORMAL;addx,64;diffusealpha,0),
	--
	Def.Quad {
		Name="Underline",
		InitCommand=cmd(x,-SCREEN_CENTER_X+24;y,_height * 0.75;horizalign,left),
		OnCommand=cmd(stoptweening;visible,IsHeaderTextVisible();diffuse,ThemeColor.Primary;zoomx,0;sleep,0.25;smooth,0.25;zoomx,1)
	},
	LoadFont("Common Bold") .. {
		Name="HeaderText",
		Text=Screen.String("HeaderText"),
		InitCommand=cmd(x,-SCREEN_CENTER_X+24;y,_height * 0.5 + 2;zoom,1;horizalign,left;shadowlength,0;maxwidth,200;queuecommand,"Set"),
		OnCommand=cmd(visible,IsHeaderTextVisible();diffuse,ThemeColor.Primary),
		UpdateScreenHeaderMessageCommand=function(self,param)
			self:settext(param.Header);
		end;
	}
}

return t
