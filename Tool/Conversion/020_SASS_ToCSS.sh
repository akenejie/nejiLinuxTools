#!/bin/bash
for i in "${@}"; do
	sass "$i":"${i%.*}.css" --no-source-map --style compressed
done
