#!/bin/sh

# If you find that the USB is mounted then umount it and close it, open it and mount it if it isn't

list="Fermer\nOuvrir"

choose=$(echo -e "$list" | rofi -dmenu -p 'Gérer la clé usb')

case "$choose" in
	"Fermer")
		$TERMINAL -t usb -e doas umount ~/stuff/usb 
		$TERMINAL -t usb -e doas cryptsetup close /dev/mapper/usb
		notify-send "La clé USB se ferme"
	;;
"Ouvrir")

		$TERMINAL -t usb -e doas cryptsetup open /dev/sdc1 usb 
		$TERMINAL -t usb -e doas mount /dev/mapper/usb ~/stuff/usb
		notify-send "La clé USB s'ouvre"
		;;
esac
