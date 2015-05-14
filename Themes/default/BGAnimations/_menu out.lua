local fTileSize = 48;
local iTilesX = math.ceil( SCREEN_WIDTH/fTileSize );
local iTilesY = math.ceil( SCREEN_HEIGHT/fTileSize );
local fSleepTime = THEME:GetMetric( Var "LoadingScreen","ScreenOutDelay");

local t = Def.ActorFrame {
	InitCommand=cmd(x,-fTileSize/2);
	OffCommand=cmd(sleep,0.25+fSleepTime);
};

local grid = Def.ActorFrame {}

for i=1,iTilesY do
	for j=1,iTilesX do
		local _x = (j-1) * fTileSize + (fTileSize/2)
		local _y = (i-1) * fTileSize + (fTileSize/2)

		local odd = ((i+j) % 2) == 0
		local tween_time = ((j)/(iTilesX+iTilesY)) + (odd and 0 or 0.5)
		local remain_time = 1

		grid[#grid+1] = Def.Quad {
			InitCommand=cmd(x,_x;y,_y;zoom,fTileSize),
			OnCommand=cmd(diffuse,Color.Black;diffusealpha,0;linear,tween_time * 0.5;diffusealpha,1)
		}
	end
end

t[#t+1] = grid .. {}

return t
