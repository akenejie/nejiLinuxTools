#!/bin/bash
for i in "${@}"; do
    pandoc -s "$i" --wrap=none --extract-media=media -t gfm -o "${i%.*}.md"
done
