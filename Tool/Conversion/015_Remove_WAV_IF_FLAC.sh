#!/bin/bash
for i in "${@}"; do
	FILE=$i
	FILENAME=${FILE%.*}.flac
	if [ -f "$FILENAME" ]; then
		rm "$FILE"
	fi
done
