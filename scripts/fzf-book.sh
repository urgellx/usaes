#!/bin/sh
# Open the bookmark file and gives you options to open links

arg=$(grep -v '^#' ~/.local/share/bookmark |  fzf --prompt Favoris --reverse )

if [[ $arg =~ "gemini://" ]]; then
   amfora "$arg"
fi
if [[ $arg =~ "<" ]]; then
	notify-send "Non cliquable"
	exec ~/.local/share/fzf-book.sh
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
