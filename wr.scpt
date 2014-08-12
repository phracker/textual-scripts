# wr - A Weather Information Script for Textual
# Coded by Xeon3D, phracker

# | SCRIPT START | 
# |Properties| 
property ClientName : name of current application
property scriptname : "wr"
property ScriptDescription : "A Weather Information Script for Textual"
property ScriptHomepage : "https://github.com/phracker/textual-scripts"
property ScriptAuthor : "Xeon3D, phracker"
property ScriptAuthorHomepage : "https://github.com/phracker"
property CurrentVersion : "0.1.0"
property CodeName : "Milky is a babe!"
property SupportChannel : "irc://irc.freenode.org/#textual"

#  Colors
property CBlack : (ASCII character 3) & "01"
property CNBlue : (ASCII character 3) & "02"
property CGreen : (ASCII character 3) & "03"
property CRed : (ASCII character 3) & "04"
property CBrown : (ASCII character 3) & "05"
property CPurple : (ASCII character 3) & "06"
property COrange : (ASCII character 3) & "07"
property CYellow : (ASCII character 3) & "08"
property CLGreen : (ASCII character 3) & "09"
property CTeal : (ASCII character 3) & "10"
property CCyan : (ASCII character 3) & "11"
property CBlue : (ASCII character 3) & "12"
property CPink : (ASCII character 3) & "13"
property CGrey : (ASCII character 3) & "14"
property CLGrey : (ASCII character 3) & "15"
property CWhite : (ASCII character 3)
property NoColor : (ASCII character 3) & "00"

on textualcmd(cmd,channel)
	
	#- Formatting
	set FBold to (ASCII character 2)
	set FItalic to (ASCII character 1)
	set NewLine to (ASCII character 10)
	
	set Simple to false
	
	if cmd is ""
    set msg to "/debug Usage: `/wr <location>` | Location can be a zip code, the name of a city, etc."
    return msg
  end if

	if cmd contains "simple" then
		set UsedColor to ""
		set FreeColor to ""
		set SeparatorColor to ""
		set CWhite to ""
		set FBold to ""
		set FItalic to ""
		set Simple to true
		set AppleScript's text item delimiters to "simple"
		set cmd to text item 1 of cmd & text item 2 of cmd
	end if
	
	if cmd contains "  " then
		set AppleScript's text item delimiters to "  "
		set cmd to text item 1 of cmd & " " & text item 2 of cmd
	end if
	
	if cmd contains "," then
		set AppleScript's text item delimiters to ","
		set City to text item 1 of cmd
		set Country to text item 2 of cmd
	else
		set City to cmd
		set Country to ""
	end if
	
	if City contains " " then
		set AppleScript's text item delimiters to " "
		set City to text item 1 of City & "%20" & text item 2 of City
	end if
	
	if Country contains " " then
		set AppleScript's text item delimiters to " "
		set Country to text item 1 of Country & "%20" & text item 2 of Country
	end if
	
	set units to "F"
	set FindWOEID to do shell script "curl http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20geo.places%20where%20text=%22" & City & "%20" & Country & "%22"
	set AppleScript's text item delimiters to "<woeid>"
	set WOEID to text item 2 of FindWOEID
	set AppleScript's text item delimiters to "</woeid>"
	set WOEID to text item 1 of WOEID
	
	set Weather to do shell script "curl " & quote & "http://weather.yahooapis.com/forecastrss?w=" & WOEID & "&u=" & units & "&" & quote
	set AppleScript's text item delimiters to "<lastBuildDate>"
	set Weather to text item 2 of Weather
	set AppleScript's text item delimiters to "</lastBuildDate>"
	set InfoDate to text item 1 of Weather
	set Weather to text item 2 of Weather
	set AppleScript's text item delimiters to "city=\""
	set Weather to text item 2 of Weather
	set AppleScript's text item delimiters to "\\\" region=\"\""
	set City to the text item 1 of Weather
	set AppleScript's text item delimiters to "\" region"
	set City to the text item 1 of City
	set Region to word ((count words in City) + 3) of Weather
	set AppleScript's text item delimiters to "country=\""
	set Weather to text item 2 of Weather
	set Country to the text item 1 of Weather
	set AppleScript's text item delimiters to "\"/>" & return & "<yweather:units"
	set Country to text item 1 of Weather
	set Weather to text item 2 of Weather
	set AppleScript's text item delimiters to "<yweather:wind"
	set Weather to text item 2 of Weather
	set Wind to first word of Weather
	set WindNumber to 3rd word of Weather
	set WindDirection to 6th word of Weather
	set WindSpeed to 9th word of Weather
	set AppleScript's text item delimiters to "<yweather:atmosphere"
	set Weather to text item 2 of Weather
	set Humidity to 3rd word of Weather
	set Visibility to 6th word of Weather
	set Visibility to round (Visibility)
	set Pressure to 9th word of Weather
	set rising to 12th word of Weather
	set AppleScript's text item delimiters to "<yweather:astronomy"
	set Weather to text item 2 of Weather
	set Sunrise to word 3 of Weather & ":" & word 4 of Weather & word 5 of Weather
	set Sunset to word 8 of Weather & ":" & word 9 of Weather & word 10 of Weather
	set AppleScript's text item delimiters to "<geo:lat>"
	set Weather to text item 2 of Weather
	set Latitude to 1st word of Weather
	set AppleScript's text item delimiters to "<geo:long>"
	set Weather to text item 2 of Weather
	set AppleScript's text item delimiters to "</geo:long>"
	set Longitude to text item 1 of Weather
	set AppleScript's text item delimiters to "<yweather:condition  text=\""
	set Weather to text item 2 of Weather
	set AppleScript's text item delimiters to "\"  code=\""
	set Condition to text item 1 of Weather
	set Weather to text item 2 of Weather
	set AppleScript's text item delimiters to "temp=\""
	set Weather to text item 2 of Weather
	set Temperature to 1st word of Weather
	set AppleScript's text item delimiters to "<img src=\""
	set Weather to text item 2 of Weather
	set AppleScript's text item delimiters to "\"/><br />"
	set ConditionPic to text item 1 of Weather
	set Weather to text item 2 of Weather
	set AppleScript's text item delimiters to "Forecast:</b><BR />" & return
	set Weather to text item 2 of Weather
	set AppleScript's text item delimiters to "<br />" & return
	set ForecastDay1 to text item 1 of Weather
	set ForecastDay2 to text item 2 of Weather
	set ForecastDay3 to text item 3 of Weather
	set ForecastDay4 to text item 4 of Weather
	set ForecastDay5 to text item 5 of Weather
	set AppleScript's text item delimiters to ""
	
  set PressureRising to " "
	if rising equals "0"
		set PressureRising to " "
  else if rising equals "1"
    set PressureRising to " (rising) "
  else if rising equals "2"
    set PressureRising to " (falling) "
	end if

  if WindDirection is greater than 348.75 or WindDirection is less than 11.25
    set WindDirection to "North"
  else if WindDirection is greater than 11.25 and WindDirection is less than 33.75
    set WindDirection to "North-northeast"
  else if WindDirection is greater than 33.75 and WindDirection is less than 56.25
    set WindDirection to "Northeast"
  else if WindDirection is greater than 56.25 and WindDirection is less than 78.75
    set WindDirection to "East-northeast"
  else if WindDirection is greater than 78.75 and WindDirection is less than 101.25
    set WindDirection to "East"
  else if WindDirection is greater than 101.25 and WindDirection is less than 123.75
    set WindDirection to "East-southeast"
  else if WindDirection is greater than 123.75 and WindDirection is less than 146.25
    set WindDirection to "Southeast"
  else if WindDirection is greater than 146.25 and WindDirection is less than 168.75
    set WindDirection to "South-southeast"
  else if WindDirection is greater than 168.75 and WindDirection is less than 191.25
    set WindDirection to "South"
  else if WindDirection is greater than 191.25 and WindDirection is less than 213.75
    set WindDirection to "South-southwest"
  else if WindDirection is greater than 213.75 and WindDirection is less than 236.25
    set WindDirection to "Southwest"
  else if WindDirection is greater than 236.25 and WindDirection is less than 258.75
    set WindDirection to "West-southwest"
  else if WindDirection is greater than 258.75 and WindDirection is less than 281.25
    set WindDirection to "West"
  else if WindDirection is greater than 281.25 and WindDirection is less than 303.75
    set WindDirection to "West-northwest"
  else if WindDirection is greater than 303.75 and WindDirection is less than 326.25
    set WindDirection to "Northwest"
  else if WindDirection is greater than 326.25 and WindDirection is less than 348.75
    set WindDirection to "North-northwest"
  end if

  if Country is "United States"
    set Country to "US"
  end if

  set ColoredTemperature to CLGrey & Temperature & "¼" & units & NoColor
  if Temperature is less than 32
    set ColoredTemperature to CBlue & Temperature & "¼" & units & NoColor
  else if Temperature is greater than 32 and Temperature is less than 51
    set ColoredTemperature to CPurple & Temperature & "¼" & units & NoColor
  else if Temperature is greater than 50 and Temperature is less than 61
    set ColoredTemperature to CLGreen & Temperature & "¼" & units & NoColor
  else if Temperature is greater than 60 and Temperature is less than 71
    set ColoredTemperature to CGreen & Temperature & "¼" & units & NoColor
  else if Temperature is greater than 70 and Temperature is less than 81
    set ColoredTemperature to CYellow & Temperature & "¼" & units & NoColor
  else if Temperature is greater than 80 and Temperature is less than 91
    set ColoredTemperature to COrange & Temperature & "¼" & units & NoColor
  else if Temperature is greater than 90
    set ColoredTemperature to CRed & Temperature & "¼" & units & NoColor
  end if

  set ColoredHumidity to CLGrey & Humidity & "%" & NoColor
  if Humidity is less than 21
    set ColoredHumidity to CGrey & Humidity & "%" & NoColor
  else if Humidity is greater than 20 and Humidity is less than 36
    set ColoredHumidity to CBlue & Humidity & "%" & NoColor
  else if Humidity is greater than 35 and Humidity is less than 51
    set ColoredHumidity to CLGreen & Humidity & "%" & NoColor
  else if Humidity is greater than 50 and Humidity is less than 66
    set ColoredHumidity to CGreen & Humidity & "%" & NoColor
  else if Humidity is greater than 65 and Humidity is less than 81
    set ColoredHumidity to CYellow & Humidity & "%" & NoColor
  else if Humidity is greater than 80 and Humidity is less than 91
    set ColoredHumidity to COrange & Humidity & "%" & NoColor
  else if Humidity is greater than 90
    set ColoredHumidity to CRed & Humidity & "%" & NoColor
  end if

  set IVisibility to ( round (Visibility * 0.62137) )
  set ColoredVisibility to CLGrey & IVisibility & space & "mi" & NoColor
  if IVisibility is less than 1
    set ColoredVisibility to CRed & IVisibility & space & "mi" & NoColor
  else if IVisibility is equal to 1 or (IVisibility is greater than 1 and IVisibility is less than 2)
    set ColoredVisibility to COrange & IVisibility & space & "mi" & NoColor
  else if IVisibility is equal to 2 or (IVisibility is greater than 2 and IVisibility is less than 5)
    set ColoredVisibility to CYellow & IVisibility & space & "mi" & NoColor
  else if IVisibility is equal to 5 or (IVisibility is greater than 5 and IVisibility is less than 10)
    set ColoredVisibility to CLGreen & IVisibility & space & "mi" & NoColor
  else if IVisibility is equal to 10 or (IVisibility is greater than 10 and IVisibility is less than 30)
    set ColoredVisibility to CGreen & IVisibility & space & "mi" & NoColor
  else if IVisibility is equal to 30 or IVisibility is greater than 30
    set ColoredVisibility to CNBlue & IVisibility & space & "mi" & NoColor
  end if

  set ColoredRising to CLGrey & PressureRising & NoColor
  if rising equals "1"
    set ColoredRising to CNBlue & PressureRising & NoColor
  else if rising equals "2"
    set ColoredRising to CRed & PressureRising & NoColor
  end if

  set ColoredWindSpeed to CLGrey & WindSpeed & NoColor
  if (WindSpeed as integer) is less than 2
    set ColoredWindSpeed to CNBlue & WindSpeed & space & "mph" & NoColor
  else if (WindSpeed as integer) is equal to 2 or ((WindSpeed as integer) is greater than 2 and (WindSpeed as integer) is less than 5)
    set ColoredWindSpeed to CLGreen & WindSpeed & space & "mph" & NoColor
  else if (WindSpeed as integer) is equal to 5 or ((WindSpeed as integer) is greater than 5 and (WindSpeed as integer) is less than 10)
    set ColoredWindSpeed to CGreen & WindSpeed & space & "mph" & NoColor
  else if (WindSpeed as integer) is equal to 10 or ((WindSpeed as integer) is greater than 10 and (WindSpeed as integer) is less than 20)
    set ColoredWindSpeed to CYellow & WindSpeed & space & "mph" & NoColor
  else if (WindSpeed as integer) is equal to 20 or ((WindSpeed as integer) is greater than 20 and (WindSpeed as integer) is less than 30)
    set ColoredWindSpeed to COrange & WindSpeed & space & "mph" & NoColor
  else if (WindSpeed as integer) is equal to 30 or ((WindSpeed as integer) is greater than 30)
    set ColoredWindSpeed to CRed & WindSpeed & space & "mph" & NoColor
  else
    set ColoredWindSpeed to CLGrey & WindSpeed & NoColor
  end if

  set IPressure to Pressure
  set ColoredPressure to CLGrey & IPressure & space & "in" & ColoredRising & NoColor
  if IPressure is less than (980 / 33.86)
    set ColoredPressure to CRed & IPressure & space & "in" & ColoredRising & NoColor
  else if IPressure is equal to (980 / 33.86) or (IPressure is greater than (980 / 33.86) and IPressure is less than (1000 / 33.86))
    set ColoredPressure to CYellow & IPressure & space & "in" & ColoredRising & NoColor
  else if IPressure is equal to (1000 / 33.86) or (IPressure is greater than (1000 / 33.86) and IPressure is less than (1010 / 33.86))
    set ColoredPressure to CLGreen & IPressure & space & "in" & ColoredRising & NoColor
  else if IPressure is equal to (1010 / 33.86) or (IPressure is greater than (1010 / 33.86) and IPressure is less than (1020 / 33.86))
    set ColoredPressure to CGreen & IPressure & space & "in" & ColoredRising & NoColor
  else if IPressure is equal to (1020 / 33.86) or (IPressure is greater than (1020 / 33.86) and IPressure is less than (1030 / 33.86))
    set ColoredPressure to CYellow & IPressure & space & "in" & ColoredRising & NoColor
  else if IPressure is equal to (1030 / 33.86) or IPressure is greater than (1030 / 33.86)
    set ColoredPressure to CRed & IPressure & space & "in" & ColoredRising & NoColor
  end if

  if Region equals "country"
    set Report to NoColor & FBold & City & ", " & Country & ":" & FBold & space & Condition & ", " & ColoredTemperature & space & FBold & "Humidity:" & FBold & space & ColoredHumidity & space & FBold & "Visibility:" & FBold & space & ColoredVisibility & space & FBold & "Pressure:" & FBold & space & ColoredPressure & FBold & "Wind: " & FBold & WindDirection & " @ " & ColoredWindSpeed & "\n"
	else 
    set Report to NoColor & FBold & City & ", " & Region & ", " & Country & ":" & FBold & space & Condition & ", " & ColoredTemperature & space & FBold & "Humidity:" & FBold & space & ColoredHumidity & space & FBold & "Visibility:" & FBold & space & ColoredVisibility & space & FBold & "Pressure:" & FBold & space & ColoredPressure & FBold & "Wind: " & FBold & WindDirection & " @ " & ColoredWindSpeed & "\n"
  end if

	return Report

end textualcmd
