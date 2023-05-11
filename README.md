# Summary

This data collects the flat and bias frames for the i filter, 
ccd number 3 **only**. Observations were made on the night of 
19. 03. 2021. by the DEEP survey using DECam.

The same data can be identified and downloaded again by invoking
the `scripts/download_data.py` script:

```bash
git clone https://github.com/dirac-institute/kbmod_210318_master_calibs
cd kbmod_20210318_master_calibs

python scripts/download_data.py \
    --download-bias rawData/210318/calib/bias \
    --download-flats rawData/210318/calibs/flat \
    --filters i
```

Trimming the data involves setting the data of all but the
selected detectors to zero and creating Astropy's `CompImageHDU`
objects to compress them and reduce the total size of the dataset.
For example, following the setup before: 

```bash
cp -r rawData trimmedRawData
scripts/trim_ccds.py rawTrimmedData/210318/calib/flat 3 --verbose --overwrite
scripts/trim_ccds.py rawTrimmedData/210318/calib/bias 3 --verbose --overwrite
```

To build and export the master calibration_files required 
for processing of science data run the `create_master_calibs.sh`
script:

```bash
scripts/create_master_calibs.sh 
```

The created `calibs_20210318` directory will contain
the master calibration files as packaged in the (kbmod_210318_master_calibs)[]
repository.


# Contents

                          BIAS RAW
############################################################
    archive_filename                                                         md5sum                            caldat      proposal    ifilter
--  -----------------------------------------------------------------------  --------------------------------  ----------  ----------  -------------------
 0  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_191405_zri.fits.fz  1ea5780799f7b46799c8a972da32b931  2021-03-18  2020A-0906  solid plate 0.0 0.0
 1  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_191318_zri.fits.fz  2b5eafce9f32dad9a8ad2a96fb424cb0  2021-03-18  2020A-0906  solid plate 0.0 0.0
 2  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_191255_zri.fits.fz  7a08ca7430f60bcff5d4664185f4453c  2021-03-18  2020A-0906  solid plate 0.0 0.0
 3  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_191208_zri.fits.fz  96502171abc97b49374c2be10509eebe  2021-03-18  2020A-0906  solid plate 0.0 0.0
 4  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_191144_zri.fits.fz  a0c59e2e433e860f9104b0af5b79ed95  2021-03-18  2020A-0906  solid plate 0.0 0.0
 5  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_191342_zri.fits.fz  d7ccb573ebe8868072167b4640caa6ba  2021-03-18  2020A-0906  solid plate 0.0 0.0
 6  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_191232_zri.fits.fz  e44561298fe9538385dfdf37173e0d1f  2021-03-18  2020A-0906  solid plate 0.0 0.0
 7  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_191121_zri.fits.fz  389616a979d9f1fc22604f549d55f002  2021-03-18  2020A-0906  solid plate 0.0 0.0
 8  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_191058_zri.fits.fz  526352744666ce5bb5d18540dbbf2c98  2021-03-18  2020A-0906  solid plate 0.0 0.0
 9  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_191011_zri.fits.fz  8c1917bbb2824f7493157a8182178404  2021-03-18  2020A-0906  solid plate 0.0 0.0
10  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_191034_zri.fits.fz  f977b38c6b707162752a91bfcef9b90b  2021-03-18  2020A-0906  solid plate 0.0 0.0
11  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_204941_zri.fits.fz  0070316e8fccc3d0d7a8840dfd98fe20  2021-03-18  2020A-0906  solid plate 0.0 0.0
12  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_205051_zri.fits.fz  0c3e9919bbaf0f46e45a9c4e6b2c384e  2021-03-18  2020A-0906  solid plate 0.0 0.0
13  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_205004_zri.fits.fz  8fa9a8cbd460f46ee0941d185cf5a579  2021-03-18  2020A-0906  solid plate 0.0 0.0
14  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_205028_zri.fits.fz  9a6a401b644e516b437839267f4274d3  2021-03-18  2020A-0906  solid plate 0.0 0.0
15  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_204917_zri.fits.fz  0d2c5849d52854721136f5cd9284e6a5  2021-03-18  2020A-0906  solid plate 0.0 0.0
16  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_204854_zri.fits.fz  3e323a820beff11c7c8dff7fb0c0cfaa  2021-03-18  2020A-0906  solid plate 0.0 0.0
17  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_204720_zri.fits.fz  62121a343a8188fb188f256b965dd965  2021-03-18  2020A-0906  solid plate 0.0 0.0
18  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_204657_zri.fits.fz  95b8b7beaa56d376df12793a1b89ab4a  2021-03-18  2020A-0906  solid plate 0.0 0.0
19  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_204807_zri.fits.fz  a5fd5afb8ad84d8571749f09ce1af3a1  2021-03-18  2020A-0906  solid plate 0.0 0.0
20  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_204744_zri.fits.fz  b77f01e765e2961413c1074a1a684a9a  2021-03-18  2020A-0906  solid plate 0.0 0.0
21  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_204830_zri.fits.fz  c53f9986f47cd1a0f4afb26cd619609f  2021-03-18  2020A-0906  solid plate 0.0 0.0

                          FLAT RAW
############################################################
    archive_filename                                                         md5sum                            caldat      proposal    ifilter
--  -----------------------------------------------------------------------  --------------------------------  ----------  ----------  --------------------------------
 0  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_195459_fri.fits.fz  04bdc4bb9f46684393b5d3e0dcb6e7fa  2021-03-18  2020A-0906  i DECam SDSS c0003 7835.0 1470.0
 1  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_195404_fri.fits.fz  536393d934e6ee0157f6a4bfb1145bc4  2021-03-18  2020A-0906  i DECam SDSS c0003 7835.0 1470.0
 2  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_195553_fri.fits.fz  808ace9f155e54aa5a2576b88056e3af  2021-03-18  2020A-0906  i DECam SDSS c0003 7835.0 1470.0
 3  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_195310_fri.fits.fz  e6f15444f38024a37dc77074066a42a3  2021-03-18  2020A-0906  i DECam SDSS c0003 7835.0 1470.0
 4  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_195028_fri.fits.fz  2aaa78091c2d5aa1d89e39e342b663ae  2021-03-18  2020A-0906  i DECam SDSS c0003 7835.0 1470.0
 5  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_195122_fri.fits.fz  65f7e60f007de34409c62c7d05ec3379  2021-03-18  2020A-0906  i DECam SDSS c0003 7835.0 1470.0
 6  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_194745_fri.fits.fz  6a39262550e048e7c9847ee9daa81a03  2021-03-18  2020A-0906  i DECam SDSS c0003 7835.0 1470.0
 7  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_194651_fri.fits.fz  760067bea7c79173a9b78550e4ff206b  2021-03-18  2020A-0906  i DECam SDSS c0003 7835.0 1470.0
 8  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_194840_fri.fits.fz  8c027c6726dc9e2094721dd6a647b8aa  2021-03-18  2020A-0906  i DECam SDSS c0003 7835.0 1470.0
 9  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_194934_fri.fits.fz  a1d90ec8dea4009e70d25e89ecad331b  2021-03-18  2020A-0906  i DECam SDSS c0003 7835.0 1470.0
10  /net/archive/mtn/20210318/ct4m/2020A-0906/c4d_210318_195216_fri.fits.fz  f080a68a473809d0f87ceb2bbaff7b89  2021-03-18  2020A-0906  i DECam SDSS c0003 7835.0 1470.0