#!/bin/bash
for i in "${@}"; do
	`dirname $0`/WEBP/dwebp "$i" -o "${i%.*}.png"
done
