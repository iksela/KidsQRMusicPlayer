# KidsQRMusicPlayer
A music player for raspberry pi working with QR code recognition

## Parts
* Raspberry Pi (used a 3+)
* Camera Module (used https://www.amazon.fr/gp/product/B015R624JQ)

## How-to
### Setup
* Install raspbian-lite
* Activate camera module using `raspi-config`
* `sudo aptitude install mpg123 zbar-tools`
* add `bcm2835-v4l2` to `/etc/modules`
* Use the scripts (`music-startup.sh` is to be added to `/etc/rc.local`)
### Usage
* Put your music in `/home/pi/zik` or tweak scripts accordingly
* Print QR codes with the relative folder to `./zik`
