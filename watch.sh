#!/usr/bin/env bash
# This script watches for any updates to any markdown or bib files in the current directory.
# If any are updated, the name of the file passed to this script is recompiled with make.sh.
# Otherwise, thesis.md will be recompiled.

if [ -z "$1" ]; then
	THESIS_BASENAME="thesis"
else
	THESIS_BASENAME=$(basename -s .md $1)
fi

# If using watchman:
# watchman-make -p '*.md' '*.bib' --run ./make.sh ${THESIS_BASENAME}

fswatch --event Updated -o *.md *.bib | xargs -I{} ./make.sh ${THESIS_BASENAME}
