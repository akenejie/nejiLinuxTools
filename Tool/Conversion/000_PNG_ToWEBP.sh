#!/bin/bash
for i in "${@}"; do
	`dirname $0`/WEBP/cwebp -lossless "$i" -o "${i%.*}.webp"
done
