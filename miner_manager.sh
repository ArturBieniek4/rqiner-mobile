#!/bin/bash

# Set thresholds
LOW_BATTERY=40
HIGH_BATTERY=70
HIGH_TEMP=42
SAFE_TEMP=38

# Specify the process name or command
COMMAND_TO_RUN="bash ~/init.sh"

# Infinite loop to monitor battery status
while true; do
    # Get battery information
    BATTERY_INFO=$(termux-battery-status)
    BATTERY_PERCENT=$(echo "$BATTERY_INFO" | jq '.percentage')
    BATTERY_TEMP=$(echo "$BATTERY_INFO" | jq '.temperature')

    if [ "$BATTERY_PERCENT" -le "$LOW_BATTERY" ] || [ "$BATTERY_TEMP" -ge "$HIGH_TEMP" ]; then
        echo "Conditions met to stop process: Battery Low ($BATTERY_PERCENT%) or High Temp ($BATTERY_TEMP°C)."
        pkill -x "$PROCESS_NAME"
    elif [ "$BATTERY_PERCENT" -ge "$HIGH_BATTERY" ] && [ "$BATTERY_TEMP" -le "$SAFE_TEMP" ]; then
        echo "Conditions met to start process: Battery Sufficient ($BATTERY_PERCENT%) and Safe Temp ($BATTERY_TEMP°C)."
        $COMMAND_TO_RUN &
    fi

    # Wait before checking again
    sleep 60
done