#!/usr/bin/env bash

set -euo pipefail

if [ $# -gt 1 ] && { [ "$1" == "-a" ] || [ "$1" == "--ascii" ]; }; then
	if [ $# -gt 2 ] && [ -z "$2" ]; then
		jp2a --colors "http://thecatapi.com/api/images/get?format=src&type=jpg"
	else
		jp2a --colors --width="$2" "http://thecatapi.com/api/images/get?format=src&type=jpg"
	fi
else
	CONTENTS=$(wget "http://thecatapi.com/api/images/get?format=html" -q -O -)
	sed -n '/<img/s/.*src="\([^"]*\)".*/\1/p' <<<"$CONTENTS"
fi
