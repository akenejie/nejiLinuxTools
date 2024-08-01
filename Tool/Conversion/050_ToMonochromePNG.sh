#!/bin/bash
for i in "${@}"; do
  FILE=$i
  convert "$i" -depth 1 -threshold 50% "${FILE%.*}-monochro.png"
done
