local tile_width = SCREEN_WIDTH
local tile_height = 48
local tile_size = 24
local tile_scroll_rate = 0.32
local t = Def.ActorFrame {}

t[#t+1] = Def.ActorFrame {
  FOV=90,
  InitCommand=cmd(Center),
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT),
		OnCommand=cmd(diffuse,ThemeColor.BackgroundDark),
	},
	Def.ActorFrame {
		LoadActor("_checkerboard") .. {
			InitCommand=cmd(y,-SCREEN_CENTER_Y;vertalign,top;zoomto,tile_width,tile_height+48),
			OnCommand=cmd(customtexturerect,0,0,tile_width/tile_size,(tile_height+48)/tile_size;texcoordvelocity,tile_scroll_rate,0;diffuse,ThemeColor.Background;fadebottom,0.25),
		},
		-- Bottom
		LoadActor("_checkerboard") .. {
			InitCommand=cmd(y,SCREEN_CENTER_Y;vertalign,bottom;zoomto,tile_width,tile_height+32),
			OnCommand=cmd(customtexturerect,0,0,tile_width/tile_size,(tile_height+32)/tile_size;texcoordvelocity,-tile_scroll_rate,0;diffuse,ThemeColor.Background;fadetop,0.25),
		}
	}
}


t[#t+1] = LoadActor("_guides")

return t
