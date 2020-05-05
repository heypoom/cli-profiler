#!/usr/bin/env bash

timeof() {
	ts=$(date +%s%N)
	$@
	printf "$((($(date +%s%N) - $ts)/1000000)) ms"
}

printf "Fish shell startup time: "
timeof fish -c exit
echo

printf "Tmux startup time: "
timeof tmux new -s temp -d fish -c exit
echo

printf "Neovim startup time: "
timeof nvim --headless +exit
echo

