#!/usr/bin/env bash

LOCK_FILE="$HOME/.cache/tmux-screensaver-on"
THRESHOLD=7
TIMEOUT=9

[ -f "$LOCK_FILE" ] && exit 0

now=$(date +%s)
eligible_panes=()
trigger_required=false

# 1. Get all panes, their IDs, and their TTYs
# Format: session:window.pane TTY
panes=$(tmux list-panes -F "#{session_name}:#{window_index}.#{pane_index} #{pane_tty} #{pane_current_command}")

while read -r line; do
    pane_id=$(echo $line | awk '{print $1}')
    tty=$(echo $line | awk '{print $2}')
    cmd=$(echo $line | awk '{print $3}')

    # Skip panes that aren't running a shell (optional, but safer)
    [[ ! "$cmd" =~ ^(bash|zsh|sh|tmux)$ ]] && continue

    # 2. Get the last access time of the TTY
    last_active=$(stat -c %X "$tty")
    idle_time=$((now - last_active))

    # 3. Check eligibility
    if [ "$idle_time" -gt "$THRESHOLD" ]; then
        eligible_panes+=("$pane_id")
    fi

    # 4. Check if any pane has hit the absolute limit
    if [ "$idle_time" -ge "$TIMEOUT" ]; then
        trigger_required=true
    fi
done <<< "$panes"

# 5. Execution Logic
if [ "$trigger_required" = true ] && [ ${#eligible_panes[@]} -gt 0 ]; then
    touch "$LOCK_FILE"
    target_pane=$(printf "%s\n" "${eligible_panes[@]}" | shuf -n 1)

    # Note: We send a 'touch' to the TTY at the end to reset the 'atime' for everyone
    tmux send-keys -t "$target_pane" "clear && sh $HOME/.config/tmux/scripts/random-screensaver.sh; rm -f $LOCK_FILE; tmux list-panes -a -F '#{pane_tty}' | xargs touch" Enter
fi
