#!/usr/bin/env bash
# Requirements:
# Pandoc
# TexLive
# fswatch (https://github.com/emcrisostomo/fswatch) or watchman (https://facebook.github.io/watchman/docs/install.html)

if [ -z "$1" ]; then
	THESIS_BASENAME="thesis"
else
	THESIS_BASENAME=$(basename $1)
fi

# pandoc $THESIS_BASENAME.md -t latex --pdf-engine=lualatex --biblatex --number-sections --standalone --filter pandoc-crossref --filter pandoc-xnos -o $THESIS_BASENAME.tex
pandoc $THESIS_BASENAME.md -t latex --pdf-engine=lualatex --biblatex --number-sections --standalone --filter pandoc-crossref -o $THESIS_BASENAME.tex
lualatex $THESIS_BASENAME --interaction=nonstopmode
biber $THESIS_BASENAME
lualatex $THESIS_BASENAME --interaction=nonstopmode
lualatex $THESIS_BASENAME --interaction=nonstopmode
rm $THESIS_BASENAME.{aux,bbl,bcf,blg,lof,log,lot,run.xml,toc}
