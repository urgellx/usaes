#!/bin/sh

arg=$(grep -v '^#' ~/.local/share/bookmark | cut -d' ' -f2 |  fzf --prompt Favoris --reverse )
if [[ $arg =~ "gemini://" ]]; then
   amfora "$arg"
fi
list="Firefox\nCopier"
fin=$(echo -e "$list" | fzf --prompt Choisir --reverse )
case "$fin" in
	"Firefox")
		firefox "$arg"
		notify-send "Lien ouvert avec Firefox"
	;;
"Copier")
		echo "$arg" |  xsel -b -i
		notify-send "Copié, ready for a paste"
	;;
esac
