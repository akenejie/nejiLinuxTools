#!/bin/bash
for i in "${@}"; do
	cat "$i" | xclip -selection clipboard
	# xclip が非同期なのか、コピーせずに終了することがあるため終了を待機する。
	# sleepより良い解決法があれば変える。
	sleep 0.1;
done
