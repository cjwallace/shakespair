# Shakespair

This repo implements a character LSTM trained on a corpus of the complete plays
of Shakespeare. The dataset was obtained from
[datahub](https://old.datahub.io/dataset/william-shakespeare-plays/resource/514d3c17-8469-4ae8-b83f-57678af50735)
on 14th December 2017, but is included in the data directory of this repo.

## Setup
Assuming you are on a Unix system, the data dump in `data/will_play_text.csv`
can be prepared by `cd`ing into that directory and running `make sentences`.
This should generate a file called `sentences.csv`, with one lower case
Shakespearean sentence per line.
