#!/bin/sh

    
case "$(echo -e "Shutdown\nRestart" | dmenu -i -p \
	"Status:" -l 2)" in
        Éteindre) exec poweroff;;
        Redémarrer) exec reboot;;
esac
