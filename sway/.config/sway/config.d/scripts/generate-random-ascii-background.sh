#!/bin/bash

WALLPAPER_DIR=$XDG_CONFIG_HOME/sway/config.d/wallpapers/
TMP_DIRECTORY=/tmp/ascii-random-wallpaper

if ! command -v ascii-image-converter >/dev/null 2>&1
then
	echo "ascii-image-converter binary not found, ensure it's installed"
	exit 1
fi

random_wallpaper=$(find $WALLPAPER_DIR -type f | shuf -n 1)

mkdir -p $TMP_DIRECTORY
ln -sf $random_wallpaper $TMP_DIRECTORY/random-wallpaper
ascii-image-converter $TMP_DIRECTORY/random-wallpaper -s $TMP_DIRECTORY -W $1
