AOSP porting for the Ascend Mate 7
==================================
[![aosp](https://img.shields.io/badge/aosp-6.0.0__r1-blue.svg?style=flat)]()
[![android600](https://img.shields.io/badge/android-6.0.0-yellowgreen.svg?style=flat)]()
[![build success](https://img.shields.io/badge/build-success-brightgreen.svg?style=flat)]()
[![working](https://img.shields.io/badge/working-60%25-yellowgreen.svg?style=flat)]()
[![not released](https://img.shields.io/badge/released-not%20yet-orange.svg?style=flat)]()
[![version alpha](https://img.shields.io/badge/status-alpha-lightgrey.svg?style=flat)]()
[![booting](https://img.shields.io/badge/booting-yes-green.svg?style=flat)]()

Instructions
-------
If you want to:
- build AOSP from source [go to local_manifest repo](https://github.com/mt7-dev/local_manifests)
- download and flash AOSP images for MT7-L09 (Black or White, not Gold) [go to releases_mtl09 repo](https://github.com/mt7-dev/releases_mt7l09)

Updates
-------
- 2016/08/01 - Today is an important day for Mate7 developing scene. A few weeks ago I re-started to work on cm but I realized that cyanogenmod framework (based on Android 6.0.1) is incompatible with the stock libraries provided in the stock ROM (based on Android 6.0) and that you are obliged to use to get the GPU work, so if huawei will change his way to write libraries (especially adapting them to Android AND NOT adapting Android to them) mainly for the next generation of phones, we could see a true implementation of other ROMs. As I didn't want to throw all the work done to the wind I switched to the Android AOSP the same version of the stock ROM, 6.0. So i worked for about an entire week, day and night, to get the stock ROM to boot and on the 29th of July I succeded. Then was very easy to get the wifi and bluetooth to work but the main problem was the telephony layer. After millions of trials and errors I get the ril-daemon to work but the aosp framework didn't recognize the signals sent by the modem, as they talk two different languages. I decided to decompile the huawei framework and there, after searching in millions of lines and after two entire days I realized were the problem was. 
Today I built a perfectly booting AOSP ROM for the Mate7 where WiFi, Bluetooth, Telephony and 4G are working. But there are other things to fix, the system often crashes so I don't want to release anything for now but when I will reach an acceptable system I will start releasing the ROM. Here some screens: [http://imgur.com/a/rP4KJ](http://imgur.com/a/rP4KJ)
- 2016/07/29 - After weeks of testing I finally succeded to build a booting aosp ROM of Android 6.0. I removed proprietary blobs for vendor repo, but you can extract them from your device by running extract-files.sh (@gabry3795)
