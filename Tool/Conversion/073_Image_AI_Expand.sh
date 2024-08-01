#!/bin/bash

# 「拡大率の選択」GUIダイアログ表示関数
select_scale() {
	scale=$(zenity --question --title="拡大率の選択" --text="拡大率を選択してください" \
		--extra-button="2倍 (_2)" --extra-button="3倍 (_3)" --extra-button="4倍 (_4)" --switch)
	case $scale in
		"2倍 (_2)")
			scale="2"
			;;
		"3倍 (_3)")
			scale="3"
			;;
		"4倍 (_4)")
			scale="4"
			;;
	esac
	echo $scale
}

scale=$(select_scale)
if [ -z "$scale" ]; then
	echo "No scale selected. Exiting."
	exit 1
fi

# 拡大実行
for i in "${@}"; do
	`dirname $0`/realesrgan/realesrgan-ncnn-vulkan -i "$i" -o "${i%.*}_x${scale}.webp" -s $scale
done

