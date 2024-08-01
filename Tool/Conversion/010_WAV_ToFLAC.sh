#!/bin/bash
for i in "${@}"; do
	FILE=$i
	#`dirname $0`/flac -8 $i
	flac -8 "$i"
	DESTFILE=${FILE%.*}.flac

	# 変換できてファイルが出来上がったら、プロパティをコピー
	if [ -f "$DESTFILE" ]; then
		# コピー元のファイルの作成日時、更新日時、アクセス日時を取得
		src_ctime=$(stat -c %z "$FILE")
		src_mtime=$(stat -c %y "$FILE")
		src_atime=$(stat -c %x "$FILE")
		# コピー先のファイルに作成日時、更新日時、アクセス日時を反映
		touch -c -d "$src_ctime" "$DESTFILE"
		touch -m -d "$src_mtime" "$DESTFILE"
		touch -a -d "$src_atime" "$DESTFILE"
	fi
done
