#!/bin/zsh

# MONITOR Environment
export DISPLAY=:0 # GET VALUE WITH >>> echo $DISPLAY
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus # GET VALUE WITH >>> echo $DBUS_SESSION_BUS_ADDRESS AND >>> id -u

# Alert levels
LOW_BATTERY=20
CRITICAL_BATTERY=10

# Send notification
send_notification() {
    local percentage=$1
    local urgency=$2
    local icon=$3

    /usr/bin/notify-send -u "$urgency" -i "$icon" "Low Battery" "$percentage% remaining"
    exit 0
}

# Obtain battery percentage
get_battery_percentage() {
    /usr/bin/cat /sys/class/power_supply/BAT0/capacity
}

# Main
monitor_battery() {
    while true; do
        battery_percentage=$(get_battery_percentage)

        if [ "$battery_percentage" -le "$CRITICAL_BATTERY" ]; then
            send_notification "$battery_percentage" "critical" "/usr/share/icons/Papirus/24x24/panel/battery-caution.svg"
        elif [ "$battery_percentage" -le "$LOW_BATTERY" ]; then
            send_notification "$battery_percentage" "normal" "/usr/share/icons/Papirus/24x24/panel/battery-low.svg"
        fi
    done
}

# Execute
monitor_battery
