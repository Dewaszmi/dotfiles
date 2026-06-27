#!/bin/bash
CONFIG_DIR="$XDG_CONFIG_HOME/waybar/modules-left"
STYLE_FILE="$CONFIG_DIR/config.jsonc"

if [ "$(readlink "$STYLE_FILE")" = "network.jsonc" ]; then
    ln -sf system.jsonc "$STYLE_FILE"
else
    ln -sf network.jsonc "$STYLE_FILE"
fi

pkill -SIGUSR2 waybar
