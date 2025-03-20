#!/bin/bash

yad --title "Power Options" \
  --text "<span font=\"15\">Time to farewell ?</span>\n" \
  --borders "30" \
  --text-align "center" \
  --center \
  --fixed \
  --button "Cancel":1 \
  --button "Reboot":2 \
  --button "Suspend":3 \
  --button "Power Off":0

case $? in
0) systemctl poweroff ;; # Power off when "Power Off" (exit code 0) is clicked
2) systemctl reboot ;;   # Reboot when "Reboot" (exit code 2) is clicked
3) systemctl suspend ;;
1) exit 0 ;; # Exit when "Cancel" (exit code 1) is clicked
esac
