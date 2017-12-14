#!/bin/bash

# Processing the semicolon-separated file into one lower case sentence per line.

cat will_play_text.csv | cut -d \; -f 6 | sed 's/\"//g' > will_play_cleaner.csv

# remove lines beginning with ACT, SCENE, Enter, Exit.
# TODO: remove lines containing all capital words (of 2+ characters), i.e. those matching regex [A-Z]\{2,\}
# TODO (not removing contents of brackets): remove anything in square parens [stage directions]
# and any left over square parens from that

cat will_play_cleaner.csv | sed -E '/(^ACT|^SCENE|^Enter|^Exit)/d' | sed 's/\[(.*?)+\]//g' | sed -E 's/(\[|\])//g' > will_play_cleanerer.csv

# This will not be perfect - there are edge cases.
