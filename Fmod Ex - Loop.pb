EnableExplicit 

IncludeFile "fmodex-min.pbi"

Define fmodSystem.i, channel.i, Sound.i, Volume.f = 0.5, isPlaying
Define file.s = "sncf.wav" 

OpenWindow(0, 0, 0, 20, 20, "")

;Declarer FMOD system
FMOD_System_Create(@fmodsystem)

;Initialisation FMOD System
FMOD_System_Init(fmodSystem, 1, #FMOD_INIT_NORMAL, 0)

; Creation du flux 
FMOD_System_CreateStream(fmodSystem, Ascii(File), #FMOD_SOFTWARE, 0, @sound)

; Jouer le flux mode loop
FMOD_System_PlaySound(fmodsystem, #FMOD_CHANNEL_FREE, sound, #False, @channel)
FMOD_Sound_SetMode(sound, #FMOD_LOOP_NORMAL)

;Et on ajuste le volume sur le channel (le son est compris entre 0.0 et 1.0)
FMOD_Channel_SetVolume(channel, 0.5)

; Boucle évenementielle
Repeat : Until WaitWindowEvent(1) = #PB_Event_CloseWindow 

; IDE Options = PureBasic 6.30 (Windows - x64)
; CursorPosition = 20
; EnableXP
; CompileSourceDirectory