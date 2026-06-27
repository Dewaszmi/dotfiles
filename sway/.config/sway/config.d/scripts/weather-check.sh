#!/bin/bash

# weather check via wttr.in (using fallback domain as recommended via README)
# args:
# 0 - only show current weather
# q - don't show initial "Weather report" prompt
# T - switch terminal sequences off (no colors)
notify-send "WEATHER CHECK" "$(curl 'wttr.is/?0qT')"
