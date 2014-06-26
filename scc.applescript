on textualcmd(user)
# Get these values by visiting https://sceneaccess.eu/irc
# and enter this into the address bar:
# javascript:document.writeln(document.cookie)
# Then paste the resulting values below.
set uid to ""
set pass to ""
set x to do shell script "echo $[ 1 + $[ RANDOM % 60 ]]"
set y to do shell script "echo $[ 1 + $[ RANDOM % 19 ]]"
set cmd1 to "/usr/bin/curl -i --cookie 'uid=" & uid & "; pass=" & pass & ";' 'https://sceneaccess.eu/irc'"
set cmd2 to "/usr/bin/curl --cookie 'uid=" & uid & "; pass=" & pass & ";' -d 'sceneaccess=yes&announce=yes&pre=yes&submit.x=" & x & "&submit.y=" & y & "&submit=submit' https://sceneaccess.eu/irc"
do shell script cmd1
do shell script cmd2
return
end textualcmd