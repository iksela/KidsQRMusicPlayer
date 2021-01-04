# KidsQRMusicPlayer
A music player for raspberry pi working with QR code recognition

## Parts
* Raspberry Pi (used a 3+)
* Camera Module (used https://www.amazon.fr/gp/product/B015R624JQ)

## How-to
### Setup
* Install raspbian-lite
* Activate camera module using `raspi-config`
* `sudo apt install mpv zbar-tools`
* `sudo apt remove youtube-dl`
* `sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl`
* `sudo chmod a+rx /usr/local/bin/youtube-dl`
* add `bcm2835-v4l2` to `/etc/modules`
* Use the scripts (`music-startup.sh` is to be added to `/etc/rc.local`)
### Usage
* Local
  * Put your music in `/home/pi/zik` or tweak scripts accordingly
  * Print QR codes with the relative folder to `./zik`
* Remote (YouTube Music)
  * Put `cookies.txt` with YTM info in `/home/pi`
  * Print QR codes with playlist URL (eg. _https://music.youtube.com/playlist?list=OLAK5uy_nTX_UcyURUCsI2KNerL9nZi8mpxfshIAA_)
