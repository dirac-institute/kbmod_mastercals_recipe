#!/bin/bash

# Download calibs and science data to rawData dir
python scripts/download_data.py \
    --download-bias rawData/210318/calib/bias \
    --download-flats rawData/210318/calibs/flat \
    --filters i

cp -r rawData trimmedRawData

scripts/trim_ccds.py trimmedRawData/210318/calib/flat 3 --verbose --overwrite
scripts/trim_ccds.py trimmedRawData/210318/calib/bias 3 --verbose --overwrite
