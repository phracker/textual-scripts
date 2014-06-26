on textualcmd(user)
	set cmd1 to "/usr/bin/curl -i --cookie 'uid=; pass=;' 'https://sceneaccess.eu/irc'"
	set cmd2 to "/usr/bin/curl --cookie 'uid=; pass=;' -d 'sceneaccess=yes&announce=yes&pre=yes&submit.x=12&submit.y=16&submit=submit' https://sceneaccess.eu/irc"
	do shell script cmd1
	do shell script cmd2
	return
end textualcmd