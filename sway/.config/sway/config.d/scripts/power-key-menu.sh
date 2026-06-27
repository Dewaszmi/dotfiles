#!/bin/bash

rofi_command="rofi -dmenu -p PAPI_I'LL_MISS_YOU -theme ~/.config/rofi/custom-themes/power-key-menu.rasi"

eye-animation () {
    "$XDG_CONFIG_HOME/sway/config.d/scripts/evil-eye/run_animation.sh"
}

choice=$(printf "Suspend\nReboot\nShutdown\nLogout" | $rofi_command)

case "$choice" in
  Suspend)
    eye-animation &
    sleep 2 && systemctl suspend
  ;;
  Reboot)
    eye-animation &
    sleep 2 && systemctl reboot
  ;;
  Shutdown)
    eye-animation &
    sleep 2 && systemctl poweroff
  ;;
  Logout)
    swaymsg exit
  ;;
esac
