#!/bin/bash

# set template dir
TEMPLATE_DIR="./templates"

# if it does not exist
[ ! -d "$TEMPLATE_DIR" ] && mkdir -p "$TEMPLATE_DIR"

# copy template to current dir with fzf
copy_template() {
	lang_dir="$1"
	selected_file=$(find "$TEMPLATE_DIR/$lang_dir" -type f | fzf --prompt="Select a template: " --ansi --preview-window=right:50% --delimiter / --with-nth -1 --preview="bat --color=always --style=header,grid --line-range :300 {}")

	if [[ -n $selected_file ]]; then
		target_file=$(basename "$selected_file")

		if [ -e "$target_file" ]; then
			echo "File '$target_file' already exists."

			read -rp "Choose an option [D]o Nothing, [O]verwrite, [R]ename: " choice

			case $choice in
			[Dd])
				echo "Template not copied."
				;;
			[Oo])
				cp "$selected_file" .
				echo "Template overwritten."
				;;
			[Rr])
				read -rp "Enter a new name for the file (press Enter to keep the existing name): " new_name
				if [ -n "$new_name" ]; then
					target_file="$new_name.typ"
				else
					base_name=${target_file%.*}
					extension=${target_file##*.}

					counter=1
					while [ -e "$base_name-$counter.$extension" ]; do
						((counter++))
					done

					target_file="$base_name-$counter.$extension"
				fi

				cp "$selected_file" "$target_file"
				echo "Template copied with the new name: $target_file."
				;;
			*)
				echo "Invalid option."
				;;
			esac
		else
			cp "$selected_file" .
			echo "Template copied."
		fi
	else
		echo "No template selected."
	fi
}

# select language
selected_lang=$(find "$TEMPLATE_DIR" -maxdepth 1 -mindepth 1 -type d | xargs -I{} basename {} | fzf --prompt="Select a language: ")

if [[ -n $selected_lang ]]; then
	copy_template "$selected_lang"
else
	echo "No language selected."
fi
