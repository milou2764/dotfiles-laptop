#!/usr/bin/env sh

send_notification() {
    brightness=$(cat /sys/class/backlight/amdgpu_bl1/brightness)
    brightness=$((brightness*100/255))
    echo $brightness
    dunstify -t 2000 -u low -r "9993" -h int:value:"$brightness" "Brightness: ${brightness}%"
}

show_usage() {
    echo "Usage: $(basename "$0") [up|down]" >&2
    echo "  up         Increase brightness by 2.5%"
    echo "  down       Decrease brightness by 2.5%"
}

case $1 in
up)
    brightnessctl s +2.5%
    send_notification "$1"
    exit 0
    ;;
down)
    brightnessctl s 2.5%-
    send_notification "$1"
    exit 0
    ;;
*)
    show_usage
    exit 1
    ;;
esac

