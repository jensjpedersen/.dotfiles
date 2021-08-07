#!/bin/bash
xrandr --output LVDS-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-1 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off
#xrandr --output LVDS-1 
redshift -P -O 3000 -b 1
#sleep 5
sleep 5
systemctl suspend
