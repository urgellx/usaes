#!/bin/sh

list="Enregistrer\nTemporaire"
temp="$HOME/stuff/vid/ytdl/temp.mp4"
rm "$temp"
yt-dlp --merge-output-format mp4 -o "$temp" --embed-metadata -f mp4 -f "best[height=720]" --write-auto-subs --write-subs "$1"
choose=$(echo -e "$list" | rofi -dmenu -p "Que faire")
case "$choose" in
	"Enregistrer")
		exec ~/.local/share/rofi-yt2.sh
		;;
	"Temporaire")
		
		nohup mpv --no-terminal --really-quiet "$temp" &
		;;
esac
