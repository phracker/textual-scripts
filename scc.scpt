on textualcmd(user)
# Get these values by visiting https://sceneaccess.eu/irc
# and enter this into the address bar:
#   javascript:document.writeln(document.cookie)
# FYI: Chrome may remove the javascript: prefix, type it again if it does.
# Then paste the resulting values below.
set uid to ""
set pass to ""
set x to do shell script "echo $[ 1 + $[ RANDOM % 60 ]]"
set y to do shell script "echo $[ 1 + $[ RANDOM % 19 ]]"
set cmd1 to "/usr/bin/curl -i --cookie 'uid=" & uid & "; pass=" & pass & ";' 'https://sceneaccess.eu/irc'"
set cmd2 to "/usr/bin/curl --cookie 'uid=" & uid & "; pass=" & pass & ";' -d 'sceneaccess=yes&announce=yes&pre=yes&submit.x=" & x & "&submit.y=" & y & "&submit=submit' https://sceneaccess.eu/irc"
if uid is "" or pass is "" then
  return "/debug You need to configure this script in order to use it. Follow the directions in scc.scpt."
else
  do shell script cmd1
  do shell script cmd2
  return "/debug Commands sent."
end if
end textualcmd