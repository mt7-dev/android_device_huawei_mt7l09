AOSP porting for the Ascend Mate 7
==================================
[![aosp](https://img.shields.io/badge/aosp-6.0.0__r1-blue.svg?style=flat)]()
[![android600](https://img.shields.io/badge/android-6.0.0-yellowgreen.svg?style=flat)]()
[![build success](https://img.shields.io/badge/build-success-brightgreen.svg?style=flat)]()
[![working](https://img.shields.io/badge/working-60%25-yellowgreen.svg?style=flat)]()
[![not released](https://img.shields.io/badge/released-not%20yet-orange.svg?style=flat)]()
[![version alpha](https://img.shields.io/badge/status-alpha-lightgrey.svg?style=flat)]()
[![booting](https://img.shields.io/badge/booting-yes-green.svg?style=flat)]()


Updates
-------
- 2016/07/29 - After weeks of testing I finally succeded to build a booting aosp ROM of Android 6.0. I removed proprietary blobs for vendor repo, but you can extract them from your device by running extract-files.sh (@gabry3795)

Instructions
-------
To download and build everything please clone the branch `aosp-6.0.0_r1` of the [manifest repository](https://github.com/mt7-dev/local_manifests) in your `.repo/local_manifests` then sync:
```
gabry3795@darkseat-works:~/aosp$ cd .repo/
gabry3795@darkseat-works:~/aosp/.repo$ git clone git@github.com:mt7-dev/local_manifests.git -b aosp-6.0.0_r1
gabry3795@darkseat-works:~/aosp/.repo$ cd ..
gabry3795@darkseat-works:~/aosp$ repo sync
```
