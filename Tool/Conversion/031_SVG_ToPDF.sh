#!/bin/bash
for i in "${@}"; do
	# --export-latex オプションをつけると *.pdf_tex ファイルを作成できる
	#inkscape "$i" -D --export-latex --export-filename="${i%.*}_svg-tex.pdf"
	inkscape "$i" -D --export-filename="$i.pdf"
done

