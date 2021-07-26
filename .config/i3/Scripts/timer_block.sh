#!/bin/bash
if $(task next | grep -q Active); then
    echo "祥 $(task next +ACTIVE | awk '{if(NR==4) print $2}' | head -n 4)"
fi
