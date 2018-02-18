#!/bin/bash

# 1. Preprocessing - grabbing the dialogue column and removing wrapping quotes

cat will_play_text.csv | cut -d \; -f 6 | sed 's/\"//g' > will_play_cleaner.csv

# 2. Processing.
# This is important. The data that will go into our LSTM defines what it
# learns. We make a reasonable attempt at getting a single sensible
# Shakespearean sentence per line, but it's not perfect.
# The comments below explain what each line in the below command pipeline is
# intended to do.

# Pipe file in and remove lines beginning with ACT, SCENE, Enter, Exit, Exeunt
#    > This does not remove all occurences of Enter, Exit, but those lines sound "Shakespeary" anyway
# Remove lines containing all capital words (of 2+ characters), i.e. those matching regex [A-Z]\{2,\}
#    > Detects lists of character names when they are used for scene setup, not
#    > plot or dialogue
# Remove number literals [0-9]
# Remove anything in square brackets [stage directions]
# Remove any left over square parens from that
# Replace double dash '--' with space
# Remove carriage returns (they're on every line)
# Replace newlines with spaces
# Replace tabs with spaces
# Replace space after each fullstop with newline
# Replace question mark after each fullstop with newline
# Replace exclamation mark after each fullstop with newline
# Replace all upper case characters with lower case characters

cat will_play_cleaner.csv | sed -E '/(^ACT|^SCENE|^Enter|^Exit|^Exeunt)/d' \
    | sed '/[A-Z]\{2,\}/d' \
    | sed 's/[0-9]//g' \
    | sed 's/\[(.*?)+\]//g' \
    | sed 's/\[[^]]*\]//g' \
    | sed -E 's/(\[|\])//g' \
    | sed 's/--/ /g' \
    | tr -d '\r' \
    | tr '\n' ' ' \
    | tr '\t' ' ' \
    | sed $'s/\. /\.\\\n/g' \
    | sed $'s/\? /\?\\\n/g' \
    | sed $'s/\! /\!\\\n/g' \
    | tr A-Z a-z> sentences.txt

# 3. Cleanup
rm will_play_cleaner.csv
