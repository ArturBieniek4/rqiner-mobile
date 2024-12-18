#!/bin/bash

# Set thresholds
LOW_BATTERY=40
HIGH_BATTERY=70
HIGH_TEMP=40
SAFE_TEMP=39

IS_RUNNING=0

# Specify the process name or command
COMMAND_TO_RUN="source /root/rqiner-mobile/start.sh"

# Infinite loop to monitor battery status
while true; do
    # Get battery information
    BATTERY_INFO=$(termux-battery-status)
    BATTERY_PERCENT=$(echo "$BATTERY_INFO" | jq '.percentage')
    BATTERY_TEMP=$(echo "$BATTERY_INFO" | jq '.temperature')
    echo "Battery ($BATTERY_PERCENT%) Temp ($BATTERY_TEMP°C)."
    # Stop process if battery is low or temperature is high
    if [[ "$BATTERY_PERCENT" -le "$LOW_BATTERY" ]] || \
       (( $(echo "$BATTERY_TEMP >= $HIGH_TEMP" | bc -l) )); then
        echo "Conditions met to stop process: Battery Low ($BATTERY_PERCENT%) or High Temp ($BATTERY_TEMP°C)."
        if [[ "$IS_RUNNING" -eq 1 ]]; then
            IS_RUNNING=0
            pkill -x rqiner
            pkill -x ccminer
        fi
    # Start process if battery is sufficient and temperature is safe
    elif [[ "$BATTERY_PERCENT" -ge "$HIGH_BATTERY" ]] && \
         (( $(echo "$BATTERY_TEMP <= $SAFE_TEMP" | bc -l) )); then
        if [[ "$IS_RUNNING" -eq 0 ]]; then
            IS_RUNNING=1
            echo "Conditions met to start process: Battery Sufficient ($BATTERY_PERCENT%) and Safe Temp ($BATTERY_TEMP°C)."
            $COMMAND_TO_RUN &
        fi
    fi

    # Wait before checking again
    sleep 60
done
