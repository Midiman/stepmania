local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","Background")),
	Def.Sprite {
		Condition=not GAMESTATE:IsCourseMode();
		InitCommand=cmd(Center);
		OnCommand=function(self)
			if GAMESTATE:GetCurrentSong() then
				local song = GAMESTATE:GetCurrentSong();
				if song:HasBackground() then
					self:LoadBackground(song:GetBackgroundPath());
				end;
				self:scale_or_crop_background();
				(cmd(fadebottom,0.25;fadetop,0.25;diffusealpha,0.25))(self);
			else
				self:visible(false);
			end
		end;
	},
	LoadActor(THEME:GetPathB("","_checkerboard")) .. {
		InitCommand=cmd(Center)
	}
};
return t
