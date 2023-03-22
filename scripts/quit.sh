#!/bin/sh
# A small rofi / dmenu script
# Replace awesome with your WM
    
case "$(echo -e "Éteindre\nRedémarrer\nDéconnecter" | rofi -dmenu\
	-p 'Quitter' -l 10 \
	"Status:" )" in
        Éteindre) exec systemctl poweroff;;
        Redémarrer) exec systemctl reboot;;
	Logout) exec pkill awesome;;
esac
