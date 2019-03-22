#!/bin/bash

# got to redirect stderr of zenity to /dev/null. Otherwise error message about lack of parent window will show up in the terminal

rest_time=20m
distant_stare_time=20

function show_progress_bar {
	for i in {0..100..5} # equiv of 20s because 1s per iterations as there are 20 iterations for this loop.
	do
		echo $i
		#sleep 1s
		sleep $(( $distant_stare_time / 20 ))
	done |
	zenity --title='Eye care'  --text='Look 20 feet away for 20 seconds' --progress --auto-close 2> /dev/null

	if [ "$?" -eq 0 ]	# Didn't cancel
	then
		zenity --notification --text "20 seconds is up." 2> /dev/null
	else				# Cancelled
		zenity --notification --text "20 seconds was not completed." 2> /dev/null
	fi
}

while true
do
	sleep "$rest_time" && zenity --info --text "Your eyes are tired. Rest?" --title="Eye Care" 2> /dev/null

	show_progress_bar
done
