#!/bin/bash
# this scripts gets its input from zbarcam (see music-startup.sh)
echo "Ready..."
while true; do
	read qr
	if [[ "$qr" =~ ^QR ]]; then
		# stop the current music (if any) and play a notification sound so that we know the QR got recognized
		pkill mpv
		mpv /home/pi/notif.mp3

		# read the folder to play
		echo $qr
		folder=$(echo $qr | cut -c 9-)

		if [[ "$folder" == "STOP" ]]; then
			echo "STOP"
		elif [[ "$folder" =~ ^http.* ]]; then
			echo "Got a YTM link : " $folder
			# use MPV to play YouTube Music link, expect a cookie to be placed in user's home
			mpv --no-video --ytdl-raw-options="cookies=~/cookies.txt" $folder &
		else
			echo "Got a new folder to play" $folder
			# will play any mp3 in the folder in random
			find "/home/pi/zik/$folder" -name "*.mp3" | sort --random-sort | xargs -d '\n' mpv &
		fi
	else
		echo "Unexpected error got:" $qr
	fi
done
