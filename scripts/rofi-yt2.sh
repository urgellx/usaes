#!/bin/sh
		rofi -dmenu -p 'Nom de la vidéo' -replace < /dev/null > ~/.local/share/rofi-yt-what
		wh="$(cat ~/.local/share/rofi-yt-what | sed -n '$p')"
		fold="$HOME/stuff/vid/vidéos"
		output="$fold/$wh.mp4"
		folder="$(echo "$wh" | sed 's:/[^/]*$::')"
		list="Oui\nNon"
	

		mkdir --parents "$fold"/"$folder"
		mv ~/stuff/vid/ytdl/temp.mp4  "$output"
		choose=$(echo -e "$list" | rofi -dmenu -p 'Ouvrir la vidéo ?' -replace)
	case "$choose" in
	"Oui")
		nohup mpv --no-terminal --really-quiet "$output"
		;;
	"Non")
		exit
		;;
esac

		
