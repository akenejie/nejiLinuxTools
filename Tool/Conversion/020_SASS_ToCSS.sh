#!/bin/bash
for i in "${@}"; do
	# Dart-Sass を用いる
	sass "$i":"${i%.*}.css" --no-source-map --style compressed
done
