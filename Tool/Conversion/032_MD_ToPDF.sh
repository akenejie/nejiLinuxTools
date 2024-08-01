#!/bin/bash
for i in "${@}"; do
    # LuaLaTeX のインストールが必要
    pandoc "$i" -o "${i%.*}.pdf" -V documentclass=jlreq --pdf-engine=lualatex --include-in-header=`dirname $0`/032_MD_ToPDF.sty
done

