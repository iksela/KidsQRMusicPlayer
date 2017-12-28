#!/bin/bash
# simple startup script, add "/home/pi/music-startup.sh" to "/etc/rc.local"
# audio signal that the device is ready
mpg123 -q /home/pi/startup.mp3 &
# launch player
zbarcam --nodisplay -Sdisable -Sqrcode.enable --prescale=320x240 /dev/video0 | /home/pi/listener.sh
