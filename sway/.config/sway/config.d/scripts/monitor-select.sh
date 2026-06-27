#!/bin/bash
rofi_command="rofi -dmenu -p MONITOR-SELECT -theme ~/.config/rofi/custom-themes/monitor-select.rasi"

choice=$(printf "eDP-1\nHDMI-A-1\nALL DISPLAYS\n" | $rofi_command)

case "$choice" in
  "eDP-1")
    swaymsg output HDMI-A-1 disable
    swaymsg output eDP-1 enable
    ;;
  "HDMI-A-1")
    swaymsg output eDP-1 disable
    swaymsg output HDMI-A-1 enable
    ;;
  "ALL DISPLAYS")
    swaymsg output eDP-1 enable
    swaymsg output HDMI-A-1 enable
    ;;
esac
