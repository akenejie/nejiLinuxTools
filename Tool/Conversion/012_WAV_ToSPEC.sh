#!/bin/bash
for i in "${@}"; do
	sox "$i" -n stat -freq &> ${i%.*}.csv
done
