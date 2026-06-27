#!/usr/bin/env bash

# Default values
POS="100 100"
SIZE="800 600"

# Parse arguments for the script
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -g|--geometry) SIZE="$2"; shift ;;
        -p|--position) POS="$2"; shift ;;
        *) break ;; # Stop parsing if we hit the command
    esac
    shift
done

# The remaining arguments ($@) are the app and its own args
"$@" &
pid=$!

# Use a subshell to wait for the window and apply rules
(
    # Subscribe and wait for the specific PID
    id=$(swaymsg -t subscribe -m '[ "window" ]' | \
        jq -r --unbuffered --argjson pid "$pid" '.container | select(.pid == $pid) | .id' | \
        head -n 1)

    # Apply the rules using the captured ID
    swaymsg "[con_id=$id] floating enable, resize set $SIZE, move position $POS"
) &

# Wait for our process to close
tail --pid=$pid -f /dev/null
