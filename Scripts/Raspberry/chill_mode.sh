#!/bin/bash
xrandr --output LVDS-1 --off --output VGA-1 --off --output DP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-2 --off --output DP-3 --off
redshift -P -O 3000 -b 0.5
i3-msg workspace chill-mode
chromium --start-fullscreen "https://www.netflix.com/watch/80061132?trackId=14170286&tctx=1%2C0%2C13b266cc-2e54-4a5f-9bb4-c1802d81e810-98424529%2C443a0e27-311e-4c0c-aa22-17ec5fc1fc4f_321761X3XX1626639613536%2C443a0e27-311e-4c0c-aa22-17ec5fc1fc4f_ROOT%2C"
 
