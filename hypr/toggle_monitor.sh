#!/bin/bash

CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"

# As duas versões da linha
STATE_ON="monitor=eDP-1, 1920x1080@144,0x0,1"
STATE_OFF="monitor=eDP-1, disable"

# Verifica se o monitor está atualmente desativado no arquivo
if grep -q "^$STATE_OFF" "$CONFIG_FILE"; then
  # Se estiver 'disable', muda para as configs de 144Hz
  sed -i "s|^$STATE_OFF|$STATE_ON|" "$CONFIG_FILE"
else
  # Se estiver ligado, muda para 'disable'
  sed -i "s|^$STATE_ON|$STATE_OFF|" "$CONFIG_FILE"
fi

killall waybar && waybar &
