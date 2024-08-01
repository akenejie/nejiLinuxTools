#!/bin/bash
for i in "${@}"; do
	cd "$(dirname "$i")"
	#python3 -m demucs -d cpu "$i"
	python3 -m demucs.separate -d cpu "$1" --out . --filename "{track}_{stem}.{ext}"
	ib="$(basename "$i")"
	cd ./htdemucs/
	for j in ${ib%.*}_*.wav; do
		if [ -f "$j" ]; then
			"`dirname $0`/010_WAV_ToFLAC.sh" "$j"
			"`dirname $0`/015_Remove_WAV_IF_FLAC.sh" "$j"
			j=$(basename "$j")
			mv "${j%.*}.flac" ../.
		fi
	done
	cd ..
	rmdir ./htdemucs/
done
