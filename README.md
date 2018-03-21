# Shakespair

This repo implements a character LSTM trained on a corpus of the complete plays
of Shakespeare. The dataset was obtained from
[datahub](https://old.datahub.io/dataset/william-shakespeare-plays/resource/514d3c17-8469-4ae8-b83f-57678af50735)
on 14th December 2017, but is included in the data directory of this repo.

An interactive interface for playing with the resulting model is available
on ObservableHQ at
[Shakespair](https://beta.observablehq.com/@cjwallace/shakespair).

## Setup
Assuming you are on a Unix system, the data dump in `data/will_play_text.csv`
can be prepared by `cd`ing into that directory and running `make sentences`.
This should generate a file called `sentences.csv`, with one lower case
Shakespearean sentence per line.

## Environment
Included `environment.yml` worked on my machine (TM) for local development.
To train, I recommend using the AWS Deep Learning AMI on a GPU EC2 box, with the
Python 3 TensorFlow environment. That will include everything needed to run
the notebook.

## Keras JS
The training process will save (~10MB each) h5 files to the data directory.
These can be binarised for use in the browser with Keras JS.
The process was totally straightforward - run one python script against the h5 file.
See the [Keras JS documentation](https://transcranial.github.io/keras-js-docs/).
