#!/bin/bash
for i in "${@}"; do
	tesseract "$i" "$i" -l jpn
done
