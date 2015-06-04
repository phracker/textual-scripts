on textualcmd(user)
  set json to do shell script "curl -s https://whatstatus.info/api/status | tr -d '\n '"
  if json = "{\"site\":\"1\",\"irc\":\"1\",\"tracker\":\"1\"}" then
    set str to "💎 What.CD: ✅ Site ✅ IRC ✅ Tracker"
  end if
  if json = "{\"site\":\"0\",\"irc\":\"1\",\"tracker\":\"1\"}" then
    set str to "💎 What.CD: ⛔ Site ✅ IRC ✅ Tracker"
  end if
  if json = "{\"site\":\"1\",\"irc\":\"0\",\"tracker\":\"1\"}" then
    set str to "💎 What.CD: ✅ Site ⛔ IRC ✅ Tracker"
  end if
  if json = "{\"site\":\"1\",\"irc\":\"1\",\"tracker\":\"0\"}" then
    set str to "💎 What.CD: ✅ Site ✅ IRC ⛔ Tracker"
  end if
  if json = "{\"site\":\"0\",\"irc\":\"0\",\"tracker\":\"1\"}" then
    set str to "💎 What.CD: ⛔ Site ⛔ IRC ✅ Tracker"
  end if
  if json = "{\"site\":\"1\",\"irc\":\"0\",\"tracker\":\"0\"}" then
    set str to "💎 What.CD: ✅ Site ⛔ IRC ⛔ Tracker"
  end if
  if json = "{\"site\":\"0\",\"irc\":\"1\",\"tracker\":\"0\"}" then
    set str to "💎 What.CD: ⛔ Site ✅ IRC ⛔ Tracker"
  end if
  if json = "{\"site\":\"0\",\"irc\":\"0\",\"tracker\":\"0\"}" then
    set str to "💎 What.CD: ⛔ Site ⛔ IRC ⛔ Tracker"
  end if
  return str
end textualcmd