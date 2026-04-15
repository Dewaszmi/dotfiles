#!/usr/bin/sh

pond_command="pond -s"
cbonsai_command="cbonsai -l"

selected_screensaver=$(shuf -n1 -e "$pond_command" "$cbonsai_command")
exec $selected_screensaver
