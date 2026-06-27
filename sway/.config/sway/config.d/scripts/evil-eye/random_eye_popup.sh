#!/bin/bash

random_x=$(shuf -i 10-1200 -n 1)
random_y=$(shuf -i 10-700 -n 1)

sh run_floating.sh -g "600 400" -p "$random_x $random_y" mpv animation.gif
