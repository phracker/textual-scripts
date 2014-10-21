textual-scripts
---

So I've spent some time getting serious about writing scripts for Textual IRC.  These are mainly in AppleScript with other languages pinched in here and there.

Drop these scripts in your `~/Library/Application Scripts/com.codeux.irc.textual` folder and let the fireworks begin! If this folder isn't present on your machine, create it and add these scripts.

```
$ git clone https://github.com/phracker/textual-scripts "~/Library/Application Scripts/com.codeux.irc.textual/textual-scripts"
$ mv "~/Library/Application Scripts/com.codeux.irc.textual/textual-scripts/*" "~/Library/Application Scripts/com.codeux.irc.textual/" && rm -rf "~/Library/Application Scripts/com.codeux.irc.textual/textual-scripts"
```

`/dns <Domain Name or IP Address>` gets the dns entry for its argument.

`/hash <algorithm> <data>` hashes data using the specified algorithm. Options are md5, sha1, sha224, sha256, sha384, and sha512.

`/isgd <url>` shortens a link using [is.gd](http://is.gd).

`/np` is my Now Playing script. Compatible with Quicktime Player, Spotify, and iTunes.

`/py <python expression>` evaluates a python expression.

`/rb <ruby expression>` evaluates a ruby expression.

`/scc` will autojoin their IRC chans without using the web dialog, you just need to fill in your cookie info.

`/whatup` checks the status of what.cd's site, tracker, and irc network.

`/wr <location>` reports the weather for the provided location.

Some of these scripts were pulled from these guys, but needed some updating to work properly.
* [kylef](https://github.com/kylef)
* [Xeon3D](https://github.com/Xeon3D)
