#!/bin/bash
for i in "${@}"; do
	FILE=$i
	#`dirname $0`/flac -d $i
	flac -d $i
done
