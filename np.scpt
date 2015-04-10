on textualcmd()
  
  set nowPlaying to "I'm not currently playing anything. Check that QuickTime Player, Spotify, or iTunes is open and playing something."
  set isNowPlaying to 0

  # VLC
  if isRunning("VLC") then
    tell application "VLC"
      if playing then
        set nowPlaying to "is playing " & name of current item
        set isNowPlaying to 1
      end if
    end tell
  end if

  # QuickTime Player
  if isRunning("QuickTime Player") then
    tell application "QuickTime Player"
      if playing of document 1 then
        set nowPlaying to "is playing " & name of document 1
        set isNowPlaying to 1
      end if
    end tell
  end if

  # Spotify
  if isRunning("Spotify") then
    tell application "Spotify"
      if player state is playing then
        set nowPlaying to "is listening to " & artist of current track & " - " & name of current track & ", from the album " & album of current track
        set isNowPlaying to 1
      end if
    end tell
  end if
  
  # iTunes
  if isRunning("iTunes") then
    tell application "iTunes"
      if player state is playing then
        set nowPlaying to "is listening to " & artist of current track & " - " & name of current track & ", from the album " & album of current track
        set isNowPlaying to 1
      end if
    end tell
  end if

  # Cog
  # if isRunning("Cog") then
  #   tell application "Cog"
  #     set nowPlaying to "is listening to " & artist of currententry & " - " & title of currententry & ", from the album " & album of currententry & " (" & year of currententry & ") [" & bitrate of currententry & "kbps]"
  #   end tell
  # end if

  if isNowPlaying is 0 then
    return "/debug " & nowPlaying
  else
    return "/me " & nowPlaying
  end if
  
end textualcmd

on isRunning(mediaPlayer)
  tell application "System Events"
    tell application "System Events" to return exists (processes where name is mediaPlayer)
  end tell
end isRunning
