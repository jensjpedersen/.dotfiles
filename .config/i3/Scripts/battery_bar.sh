#!/bin/zsh
bat0=$(acpi -b | awk -F ' |%' '/Battery 0/ {print $4}')
bat1=$(acpi -b | awk -F ' |%' '/Battery 1/ {print $4}')
bat=${bat0}/${bat1}
charge=$(acpi -a | awk '{print $3}')
if [ ${charge} = "on-line" ]
then
    if [ ${bat} -lt 30 ]
    then
        echo  ${bat}%
    elif [ ${bat} -gt 30 ] && [ ${bat} -lt 90 ]
    then
        echo  ${bat}%
    else
        echo  ${bat}%
    fi
else 
    if [ ${bat} -lt 30 ]
    then
        echo  ${bat}%
    elif [ ${bat} -gt 30 ] && [ ${bat} -lt 90 ]
    then
        echo  ${bat}%
    else
        echo  ${bat}%
    fi
fi

