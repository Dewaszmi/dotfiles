#!/bin/bash

scaling_styles=("stretch" "fit" "tile")
random_scaling=$(printf "%s\n" "${scaling_styles[@]}" | shuf -n 1) 

case $random_scaling in
	tile)
		width=50
		;;
	*)
		width=100
		;;
esac

sh $XDG_CONFIG_HOME/sway/config.d/scripts/generate-random-ascii-background.sh $width
swaylock --image /tmp/ascii-random-wallpaper/random-wallpaper-ascii-art.png --scaling $random_scaling
