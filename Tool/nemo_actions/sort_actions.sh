#!/bin/bash
if ! zenity --question --no-wrap --icon-name="folder" --title="Nemoのアクションをソートしますか?" --no-wrap --text="この操作を行うには、Nemoを終了させる必要があります。\n\n続行しますか？"; then
 exit 1
fi
mkdir -p /tmp/actions/
mv "$HOME"/.local/share/nemo/actions/*.nemo_action /tmp/actions/
ACTIONS=$(find /tmp/actions -iname '*.nemo_action' | sort -n)
for i in $ACTIONS; do
 touch "$i"
done
mv /tmp/actions/*.nemo_action "$HOME"/.local/share/nemo/actions/
nemo -q 
nemo-desktop -q
nemo-desktop & disown
