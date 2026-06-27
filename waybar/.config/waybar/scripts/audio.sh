#!/bin/bash

current_volume=$(/usr/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@)

volume="$(echo $current_volume | cut -f 2 -d " " | sed 's/\.//g')"

if [[ $current_volume == *"MUTED"* ]]; then
    echo "  ---"
fi

if [ "$volume" -lt "100" ]; then
    volume="${volume:1}"
fi

if [ "$volume" -lt "10" ]; then
    volume="${volume:1}"
fi

echo "AUDIO: $volume%"
