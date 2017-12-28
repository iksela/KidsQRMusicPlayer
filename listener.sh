#!/bin/bash
# this scripts gets its input from zbarcam (see music-startup.sh)
echo "Ready..."
while true; do
	read qr
	if [[ "$qr" =~ ^QR ]]; then
		# stop the current music (if any) and play a notification sound so that we know the QR got recognized
		pkill mpg123
		mpg123 -q /home/pi/notif.mp3

		# read the folder to play
		folder=$(echo $qr | cut -d':' -f 2)

		if [[ "$folder" == "STOP" ]]; then
			echo "STOP"
		else
			echo "Got a new folder to play" $folder
			# will play any mp3 in the folder in random
			find "/home/pi/zik/$folder" -name "*.mp3" | sort --random-sort | xargs -d '\n' mpg123 -q &
		fi
	else
		echo "Unexpected error got:" $qr
	fi
done
