#!/bin/bash
for i in "${@}"; do
	dir="${i%.*}"
	mkdir -p "$dir"
	ffmpeg -i "$i" -vf "select=not(mod(n\,150)),mpdecimate=max=0:hi=30000:lo=640:frac=1" -vcodec png -vsync vfr "$dir/slide_%03d.png"
	for j in "$dir"/*.png; do
		tesseract "$j" "${j%.*}" -l jpn
		"`dirname $0`/000_PNG_ToWEBP.sh" "$j"
		if [ -f "${j%.*}.webp" ]; then
			rm "$j"
		fi
	done
	cat "$dir/"*.txt > "$dir/all_script_slide.log"
	img2pdf "$dir/"*.webp -o "$dir/all_slides.pdf"
	# all_script_audio.log
done
