#!/bin/bash
xrandr --output LVDS-1 --off --output VGA-1 --off --output DP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-2 --off --output DP-3 --off
redshift -P -O 3000 -b 0.5
i3-msg workspace Media
chromium --start-fullscreen "https://www.netflix.com/watch/81189987?trackId=1417028i"
