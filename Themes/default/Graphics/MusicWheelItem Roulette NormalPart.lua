return Def.ActorFrame {	
	LoadActor(THEME:GetPathG("MusicWheelItem","Song ColorPart")) .. {
		InitCommand=cmd(rainbow);
	};
	LoadActor(THEME:GetPathG("MusicWheelItem","Song ColorPart")) .. {
		InitCommand=cmd(blend,Blend.Add);
	};
};
