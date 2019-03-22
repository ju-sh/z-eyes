#!/bin/bash

# got to redirect stderr of zenity to /dev/null. Otherwise error message about lack of parent window will show up in the terminal

while true
do
	sleep 20m && zenity --question --text="Your eyes are tired. Rest?" --title="Eye Care" 2> /dev/null

###TO DO
# If user says no or cancels the above dialog, '20s is up' notificiation should not be shown.


############################### one begins ##########################################
##	zenity --notification --text "Look at far-away object for 20s" 2> /dev/null && sleep 5s 
##
##	sleep 20s && zenity --notification --text "20 seconds is up." 2> /dev/null
#
#	zenity --notification --text "Look at a far-away object for 20s" 2> /dev/null
#
#	sleep 25s && zenity --notification --text "20 seconds is up." 2> /dev/null
###############################  one ends  ##########################################


	for i in {0..100..5} # equiv of 20s
	do
		echo $i
		sleep 1s
	done |
	zenity --title='Eye care'  --text='Look 20 feet away for 20 seconds' --progress --auto-close 2> /dev/null

###TO DO
# If user cancels the progress bar, '20s is up' message should not be shown.

	zenity --notification --text "20 seconds is up." 2> /dev/null

done
