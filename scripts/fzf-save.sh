#!/bin/sh
touch="$(touch ~/.local/share/book/link && touch ~/.local/share/book/title)"
text="$(read -p "Nom: " && echo "<$REPLY>" >> ~/.local/share/book/title)"
clip="$(xclip -o)"
newline="$(echo -e "$clip"  >> ~/.local/share/book/link)"
link="$(cat ~/.local/share/book/link | sed -n '$p')"
title="$(cat ~/.local/share/book/title | sed -n '$p' && rm ~/.local/share/book/title)"
file="$HOME/.local/share/bookmark"
list="Enregistrer\nSupprimer\nModifier le fichier"
fzf=$(echo -e "$list" | fzf --prompt Favoris --reverse)
case "$fzf" in
	"Enregistrer")
		if grep -q "$link" "$file"; then
			notify-send "Déjà enregistré"
		else
			echo -e "$title" >> "$file"
sed -i -e '$a'$link''  "$file"
notify-send "Enregistré" "$link"

		fi
		;;
	"Modifier le fichier")
		nvim ~/.local/share/bookmark
		notify-send "Fichier ouvert avec NVIM"
		;;
esac
