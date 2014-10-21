on textualcmd()
  
  set nowPlaying to "I'm not currently playing anything."
  
  # QuickTime Player
  if isRunning("QuickTime Player") then
    tell application "QuickTime Player"
      if playing of document 1 then set nowPlaying to "is playing " & name of document 1
    end tell
  end if

  # Spotify
  if isRunning("Spotify") then
    tell application "Spotify"
      if player state is playing then set nowPlaying to "is listening to " & artist of current track & " - " & name of current track & " from the album " & album of current track
    end tell
  end if
  
  # iTunes
  if isRunning("iTunes") then
    tell application "iTunes"
      if player state is playing then set nowPlaying to "is listening to " & artist of current track & " - " & name of current track & " from the album " & album of current track
    end tell
  end if

  # Cog
  # if isRunning("Cog") then
  #   tell application "Cog"
  #     set nowPlaying to "is listening to " & artist of currententry & " - " & title of currententry & " from the album " & album of currententry & " (" & year of currententry & ") [" & bitrate of currententry & "kbps]"
  #   end tell
  # end if

  return "/me " & nowPlaying
  
end textualcmd

on isRunning(mediaPlayer)
  tell application "System Events"
    tell application "System Events" to return exists (processes where name is mediaPlayer)
  end tell
end isRunning
