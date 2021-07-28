#!/bin/bash
setxkbmap -layout no
sleep 1
setxkbmap -option caps:escape
sleep 1
setxkbmap -option lv3:lalt_switch
#sleep 1
#setxkbmap -option ctrl:rctrl_ralt
sleep 1
setxkbmap -model pc105
