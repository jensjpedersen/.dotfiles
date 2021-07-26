#!/bin/bash
bluetoothctl power on 
bluetoothctl disconnect
bluetoothctl scan on &
sleep 30
bluetoothctl connect 70:26:05:88:B4:0D

