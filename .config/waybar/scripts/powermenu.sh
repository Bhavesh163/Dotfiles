#!/bin/bash
choice=$(echo -e "Shutdown\nRestart\nLogout\nSuspend\nLock" | wofi --show dmenu --prompt="Power Menu")
case $choice in
    Shutdown) systemctl poweroff ;;
    Restart) systemctl reboot ;;
    Logout) hyprctl dispatch exit ;;
    Suspend) systemctl suspend ;;
    Lock) swaylock ;;
esac
