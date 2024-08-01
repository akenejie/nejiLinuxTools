#!/bin/bash
for i in "${@}"; do
  python3 -u `dirname $0`/LaTeX-Workshop-master-dev/pkgcommand.py -i "$i" -o "`dirname ${i%.*}`"
done

