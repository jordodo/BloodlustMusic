BloodlustMusic = { };

BloodlustMusic.songPathTable = {
    [[GasHero.ogg]],        --1
    [[90sHero.ogg]],        --2
    [[BrainPowerHero.ogg]], --3
    [[BirdHero.ogg]],       --4
    [[SandHero.ogg]],       --5
    [[NightHero.ogg]],      --6
    [[ElephantHero.ogg]],   --7
    [[SaiyanHero.ogg]],     --8
    [[JellyfishHero.ogg]],  --9
    [[TopHero.ogg]],        --10
    [[DDDHero.ogg]],        --11
    [[Up&DanceHero.ogg]],   --12
    [[HardcoreHero.ogg]],   --13
    [[PerfectHero.ogg]],    --14
    [[SpeedyHero.ogg]],     --15
    [[CascadaHero.ogg]],    --16
    [[SunRainHero.ogg]],    --17
    [[DontStopHero.ogg]],   --18
    [[InvadersHero.ogg]],   --19
    [[CallOnMeHero.ogg]],   --20
    [[KissKillHero.ogg]],   --21
    [[LookaHero.ogg]],      --22
    [[AnchorHero.ogg]],     --23
    [[FullMetalHero.ogg]],  --24
    [[KickstartHero.ogg]],  --25
    [[RiderHero.ogg]],      --26
    [[RisingSunHero.ogg]],  --27
    [[BloodSugarHero.ogg]], --28
    [[DejaVuHero.ogg]],     --29
    [[RumbleHero.ogg]],     --30
    [[HurricaneHero.ogg]],  --31
    [[DontTurnHero1.ogg]],  --32
    [[DontTurnHero2.ogg]],  --33
    [[EuronightHero.ogg]],  --34
    [[BeatinWildHero.ogg]], --35
    [[KingHero.ogg]],       --36
    [[SuperRiderHero.ogg]], --37
    [[PistonGoHero.ogg]],   --38
    [[DancingHero.ogg]],    --39
    [[BeatCrazyHero.ogg]],  --40
    [[SpitfireHero.ogg]],   --41
    [[ShockOutHero.ogg]],   --42
    [[SpeedLoverHero.ogg]], --43
	[[ShrekHero.ogg]],      --44
	[[BonkersHero.ogg]],    --45
    [[HyperSuperHero.ogg]], --46
    [[SuperstarHero.ogg]],  --47
	[[AdrenalineHero.ogg]], --48
	[[LoveDangerHero.ogg]]  --49

}

BloodlustMusic.songNameTable = {
    [[Manuel - GAS GAS GAS]],
    [[Max Coveri - Running in the 90's]],
    [[Noma - Brainpower]],
    [[Lynyrd Skynyrd - Freebird]],
    [[Darude - Sandstorm]],
    [[Niko - Night of Fire]],
    [[The Elephant Rave]],
    [[Fartwad - Stereo Saiyan 3D]],
    [[The Jellyfish Jam]],
    [[Ken Blast - The Top]],
    [[Mega NRG Man - DDD Initial D]],
    [[Lou Master - Up & Dance, Up & Go]],
    [[Fastway - Rockin' Hardcore]],
    [[Chris Stanton - A Perfect Hero]],
    [[Marco Polo - Speedy Speed Boy]],
    [[Cascada - Everytime we Touch]],
    [[Manuel - Sun In The Rain]],
    [[Lou Grant - Don't Stop The Music]],
    [[The Prodigy - Invaders must die]],
    [[Eric Prydz - Call On Me]],
    [[Odyssey - Kiss Me Kill Me]],
    [[Go2 - Looka Bomba]],
    [[ALESTORM - Fucked With An Anchor]],
    [[Daniel - Full Metal Cars]],
    [[Mötley Crüe - Kickstart my Heart]],
    [[Ace - Rider Of The Sky]],
    [[Dave Rodgers - Beat Of The Rising Sun]],
    [[Pendulum - Blood Sugar]],
    [[Dave Rodgers - Deja Vu]],
    [[Jock Jams - Let's Get Ready To Rumble]],
    [[Gold-Rake - Hurricane Man]],
    [[Go2 - Don't Turn It Off (Chorus)]],
    [[Go2 - Don't Turn It Off (Solo)]],
    [[Eurogroove - Euronight]],
    [[Fastway - Rock Beatin' Wild]],
    [[Jordan - King Of Eurobeat]],
    [[Mark Astley - Super Rider]],
    [[Gordon Jim - Piston Go]],
    [[Vicky Vale - Dancing]],
    [[Fastway - Go Beat Crazy]],
    [[Go2 - Spitfire]],
    [[Fastway - Shock Out]],
    [[Speedman - Speed Lover]],
	[[Jennifer Saunders - Holding Out for a Hero]],
	[[Dizzee Rascal & Armand van Helden - Bonkers]],
    [[Fastway - Hyper Super Power]],
    [[Go2 & DJ Boss - Superstar]],
	[[Ace - Adrenaline]],
	[[Priscilla - Love is in Danger]]
}
BloodlustMusic.soundChannelTable = {
    "master",
    "sfx",
    "music",
    "ambience",
    "dialog"
}
BloodlustMusic.soundVolumeTable = {
    "Sound_MasterVolume",
    "Sound_SFXVolume",
    "Sound_MusicVolume",
    "Sound_AmbienceVolume",
    "Sound_DialogVolume"
}
BloodlustMusic.soundChannelNames = {
    "Master",
    "SFX",
    "Music",
    "Ambience",
    "Dialog"
}
BloodlustMusic.soundEnabledTable = {
    "Sound_EnableAllSound",
    "Sound_EnableSFX",
    "Sound_EnableMusic",
    "Sound_EnableAmbience",
    "Sound_EnableDialog"
}
BloodlustMusic.isSongPlaying = false
BloodlustMusic.currentSongSpellID = 0
BloodlustMusic.announcerHeader = "|cFFff2f00BloodlustMusic:|r "

--Create a slash command
SLASH_BLOODLUSTMUSIC1, SLASH_BLOODLUSTMUSIC2 = '/blm', '/bloodlust';
function SlashCmdList.BLOODLUSTMUSIC(msg, editbox)
	InterfaceOptionsFrame:Show()
	InterfaceOptionsFrame_OpenToCategory(BloodlustMusic.panel);
end

--Declaring Variables
local f = CreateFrame("Frame");
local playerGUID;
local tried = 0
local randomNumber = 0
local willPlay = 0
local defaultFilePath = "interface/addons/bloodlustmusic/sounds/"
local currentFilePath = " "
local currentlyPlaying = " "
local minute = 0
local songNumber = 0
local spellIDS = {80353, 32182, 2825, 264667, 146555, 178207, 256740, 230935, 309658, 350249}

C_Timer.After(.1, function() -- wait a bit
	playerGUID = UnitGUID("player");
end)

--Stops the song when Hero ends or is cancelled, resets variables and CVars to previous levels
function StopSong(Showtext)
	BloodlustMusic.isSongPlaying = false
	BloodlustMusic.currentSongSpellID = 0
	StopSound(BloodlustSoundhandle)
	SetCVar(BloodlustMusic.soundVolumeTable[BloodlustSoundchannelNumber], BloodlustVolumecache)
  	SetCVar("Sound_NumChannels", BloodlustSoundchannelscache)
	if (Showtext) then
		print(BloodlustMusic.announcerHeader .. "Song Stopped")
	end
end

--Repeatable function to play the song
function SongPlayerRepeatable(song)
    currentFilePath = defaultFilePath;
	currentlyPlaying = BloodlustMusic.announcerHeader ..  "Now Playing: "

    if(BloodlustMusicSongEnabledTable[song])
    then
        currentlyPlaying = currentlyPlaying .. BloodlustMusic.songNameTable[song]

        currentFilePath = currentFilePath .. BloodlustMusic.songPathTable[song]
    else
        currentlyPlaying = currentlyPlaying .. "No Song"

        currentFilePath = currentFilePath .. "NoSong.ogg"
	end

	willPlay, BloodlustSoundhandle = PlaySoundFile(currentFilePath, BloodlustMusic.soundChannelTable[BloodlustSoundchannelNumber])
end

--Fundamental logic to prime the addon to play a song, calls SongPlayerRepeatable
function SongPlayerPrimer(heroSpellID)
    if (BloodlustMusic.isSongPlaying) then
        print(BloodlustMusic.announcerHeader .. "A song is already playing.")
    elseif(BloodlustMusicMute) then
        print(BloodlustMusic.announcerHeader .. "No song was selected. BloodlustMusic is currently muted.")
    else
	    --Resetting some variables
	    tried = 0
	    randomNumber = 0
	    defaultFilePath = "interface/addons/bloodlustmusic/sounds/"
	    currentFilePath = " "
	    currentlyPlaying = " "
	    BloodlustVolumecache = tonumber(GetCVar(BloodlustMusic.soundVolumeTable[BloodlustSoundchannelNumber]))

	    --gets the current local time (minute)
	    minute = (date("%M"))


	    --makes sure songNumber is never zero and makes sure songNumber can't be higher than 47. Lua tables start at 1 and there are only 47 songs
	    songNumber = minute + 1
	    if (songNumber > table.getn(BloodlustMusicSongEnabledTable))
	    then
	    	songNumber = songNumber - (60 - (table.getn(BloodlustMusicSongEnabledTable)))
	    end

	    --plays the song
	    BloodlustVolumecache = tonumber(GetCVar(BloodlustMusic.soundVolumeTable[BloodlustSoundchannelNumber]))
	    BloodlustSoundchannelscache = GetCVar("Sound_NumChannels")

	    SetCVar(BloodlustMusic.soundVolumeTable[BloodlustSoundchannelNumber], BloodlustVolumecache < BloodlustChannelVolume and BloodlustChannelVolume or BloodlustVolumecache)


	    if (BloodlustMaxSoundchannelBoolean) then
  	    	SetCVar("Sound_NumChannels", 128)
	    end

	    SongPlayerRepeatable(songNumber)

	    --checks if song actually played
	    if(not willPlay == true)
	    then
	    	--if song didn't play, a random one is selected below
	    	repeat

	    		--generates a random number
	    		randomNumber=math.random(1,table.getn(BloodlustMusicSongEnabledTable))

	    		--plays the song
	    		SongPlayerRepeatable(randomNumber)
	    		tried = tried + 1

	    		--ends the loop if a song played or after 20 tries
	    	until((not willPlay == false) or (tried >= 20))
	    end

	    --displays the current song playing, or that it failed to play any
	    if(tried >= 20)
	    then
	    	BloodlustSoundhandle = 0
	    	StopSong(false)
           if(tonumber(GetCVar(BloodlustMusic.soundEnabledTable[BloodlustSoundchannelNumber]))== 0) then
                print(BloodlustMusic.announcerHeader .. "No song was selected. Your " .. BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber] .. " volume channel is muted.")
           elseif (tonumber(GetCVar("Sound_EnableAllSound"))== 0) then
                print(BloodlustMusic.announcerHeader .. "No song was selected. Your WoW sound is muted.")
          else
	    	    print(BloodlustMusic.announcerHeader .. "No song was selected. The Addon can't find any songs, or you've disabled too many.")
          end
	    else
	    	BloodlustMusic.isSongPlaying = true
	    	BloodlustMusic.currentSongSpellID = heroSpellID
            print(currentlyPlaying)
	    end
    end
end

--Event to listen to all buffs on player, filters out Bloodlusts
function f:OnEvent()
	local _, event, _, _, _, _, _, destinationGUID, _, _, _, spellID, spellName, _, _ = CombatLogGetCurrentEventInfo();

		if (event == "SPELL_AURA_APPLIED" and destinationGUID == playerGUID)
		then
			for key,value in pairs(spellIDS) do
				if (value == spellID) then
				        SongPlayerPrimer(value);
				end
			end
		elseif (event == "SPELL_AURA_REMOVED" and destinationGUID == playerGUID)
		then
			for key,value in pairs(spellIDS) do
				if (value == spellID and value == BloodlustMusic.currentSongSpellID)
				then
				StopSong(true);
				end
			end
		end
end
f:SetScript("OnEvent", f.OnEvent);


--Main/Options Panel
local panelWidth = InterfaceOptionsFramePanelContainer:GetWidth()
local panelHeight = InterfaceOptionsFramePanelContainer:GetHeight()
BloodlustMusic.panel = CreateFrame( "Frame", "BloodlustMusicPanel", UIParent, BackdropTemplateMixin and "BackdropTemplate" );
BloodlustMusic.panel.name = "BloodlustMusic";
BloodlustMusic.panel:SetSize(panelWidth, panelHeight);
InterfaceOptions_AddCategory(BloodlustMusic.panel);


--What to do on Login, Reload or Zoning
local Loading_EventFrame = CreateFrame("Frame")
Loading_EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
Loading_EventFrame:SetScript("OnEvent",
	function(self, event, isInitialLogin, isReloadingUi)
			StopSong(false)
			f:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
			C_Timer.After(1, function()
				f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
			end)
	end)

--What to do on Logout
local Logout_EventFrame = CreateFrame("Frame")
Logout_EventFrame:RegisterEvent("PLAYER_LOGOUT")
Logout_EventFrame:SetScript("OnEvent",
	function(self, event, ...)
		StopSong(false)
	end)


