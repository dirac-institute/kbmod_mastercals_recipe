#!/bin/bash
# Create a butler repo containing only calibs, then create master calibrations and export them
butler create masterCalibsRepo

butler register-instrument masterCalibsRepo "lsst.obs.decam.DarkEnergyCamera"

# this will also create the base collections like "DECam" "Decam/calib"
butler write-curated-calibrations masterCalibsRepo "DECam"

# put each dataset into individual collection
butler ingest-raws masterCalibsRepo trimmedRawData/210318/calib/bias/ --transfer link --output-run "DECam/calib/bias/raw/20210318" -j 28
butler ingest-raws masterCalibsRepo trimmedRawData/210318/calib/flat/ --transfer link --output-run "DECam/calib/flat/raw/20210318" -j 28

# make a dir to dump processing logs to
mkdir -p processing_logs

# take the individual flats and biases and create certified master flats and biases for calibration
# biases go first because flats need master bias. We also need defects mask so include that collection too
pipetask run \
    -b masterCalibsRepo \
    -i "DECam/calib/bias/raw/20210318,DECam/calib" \
    -o "DECam/calib/bias/master/20210318" \
    -p $CP_PIPE_DIR/pipelines/cpBias.yaml \
    -d "instrument='DECam' AND detector=35" \
    --register-dataset-types \
    -j 28 2>&1 | tee processing_logs/master_bias.log

# certify the master bias files to add validity dates to the dataset
butler certify-calibrations masterCalibsRepo "DECam/calib/bias/master/20210318" "DECam/calib/bias/20210318" "bias" 

# we can start on the flats, first correct for crosstalk, we need DECam/calib for camera definition files
pipetask run \
    -b masterCalibsRepo \
    -i "DECam/calib/flat/raw/20210318,DECam/calib" \
    -o "DECam/calib/flat/crosstalk/20210318" \
    -p $CP_PIPE_DIR/pipelines/DarkEnergyCamera/RunIsrForCrosstalkSources.yaml \
    -d "instrument='DECam' AND detector=35" \
    --register-dataset-types \
    -j 28 2>&1 | tee processing_logs/master_bias.log

# then run master flat building, again - we need the whole calib to get the camera definition files
pipetask run \
    -b masterCalibsRepo \
    -i "DECam/calib/flat/crosstalk/20210318,DECam/calib/bias/20210318,DECam/calib" \
    -o "DECam/calib/flat/master/20210318" \
    -p $CP_PIPE_DIR/pipelines/DarkEnergyCamera/cpFlat.yaml \
    -d "instrument='DECam' AND detector=35" \
    --register-dataset-types \
    -j 28 2>&1 | tee processing_logs/master_bias.log

# certify the master flat files to add validity dates to the dataset
butler certify-calibrations masterCalibsRepo "DECam/calib/flat/master/20210318" "DECam/calib/flat/20210318" "flat" 

# The collection of calibs that contains the certified master flats and biases 
butler collection-chain dataRepo "DECam/calib/20210318" "DECam/calib/bias/20210318","DECam/calib/flat/20210318"

# Export the created calibs 
butler export-calibs masterCalibsRepo calibs_20210318 "DECam/calib/20210318" > exported_calibrations.log
