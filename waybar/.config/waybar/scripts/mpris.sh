#!/bin/bash

status=$(playerctl status 2>/dev/null) || exit 0

artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

if [ -z "$artist" ] && [ -z "$title" ]; then
    exit 0
fi

label="${artist:+$artist - }${title:-Unknown}"

case "$status" in
    Paused)
        echo "⏸  $label"
        ;;
    Stopped)
        echo "No music"
        ;;
    *)
        echo "$label"
        ;;
esac
