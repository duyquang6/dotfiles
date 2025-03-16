#!/bin/bash

if hyprctl monitors | grep -q "HDMI-A-1"; then
  hyprctl keyword monitor DP-1,2560x1440,0x0,1
  hyprctl keyword monitor HDMI-A-1,disable
else
  hyprctl keyword monitor HDMI-A-1,1920x1080,0x0,1
  hyprctl keyword monitor DP-1,2560x1440,1920x0,1
fi
