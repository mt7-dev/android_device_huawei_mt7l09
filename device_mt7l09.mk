#
# Copyright (C) 2015 The Aosp Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Variables
LOCAL_PATH := device/huawei/mt7l09

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)
$(call inherit-product-if-exists, vendor/huawei/mt7l09/mt7l09-vendor.mk)

# Disabled overlay for now
#DEVICE_PACKAGE_OVERLAYS += device/huawei/mt7l09/overlay

TARGET_PREBUILT_KERNEL 	:= device/huawei/mt7l09/kernel

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

# ========================================== .PROP OVVERRIDES ==========================================
PRODUCT_BUILD_PROP_OVERRIDES += \
	BUILD_UTC_DATE=0 \
	
## From stock system.prop
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.adb.secure=0 \
	ro.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	persist.sys.usb.config=mtp,adb \
	persist.logd.logpersistd=logcatd \
	debug.graphic_log=1

# Debug options
PRODUCT_PROPERTY_OVERRIDES += \
	ro.adb.secure=0 \
	ro.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	persist.sys.usb.config=mtp,adb \
	persist.logd.logpersistd=logcatd \
	debug.graphic_log=1
	
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	ro.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	persist.sys.usb.config=mtp,adb \
	persist.logd.logpersistd=logcatd \
	debug.graphic_log=1
	

# ---------------------------------------------------------------------------

PRODUCT_COPY_FILES_OVERRIDES += \
    root/fstab.goldfish \
    root/fstab.ranchu \
    root/init.goldfish.rc \
    root/init.ranchu.rc \
    root/ueventd.goldfish.rc \
    root/ueventd.ranchu.rc \
    recovery/root/fstab.goldfish \
    recovery/root/fstab.ranchu \
    recovery/root/ueventd.goldfish.rc \
    recovery/root/ueventd.ranchu.rc

# This device is xxhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xxhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
DEVICE_RESOLUTION := 1080x1920

# ======================================== PACKAGES ============================================
## Shim libs
PRODUCT_PACKAGES += \
	libboringssl-compat \
	libhw_cutils \
	libhw_gui \
	libhw_log

# Graphics
PRODUCT_PACKAGES += \
	libion \
	libgenlock \
	liboverlay \
	libGLES_mali

# NFC
#PRODUCT_PACKAGES += \
	#libnfc-nci \
	#libnfc_nci_jni \
  #NfcNci \
  #Tag \
  #com.android.nfc_extras 
# ======================================= CUSTOM PACKAGES ======================================


# ========================================== RECOVERY ==========================================
 PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/etc/recovery.fstab:recovery/root/etc/recovery.fstab \
	$(LOCAL_PATH)/recovery/etc/mke2fs.conf:recovery/root/etc/mke2fs.conf \
	$(LOCAL_PATH)/recovery/sbin/hdbd:recovery/root/sbin/hdbd \
	$(LOCAL_PATH)/recovery/sbin/teecd:recovery/root/sbin/teecd \
	$(LOCAL_PATH)/recovery/sbin/oeminfo_nvm_server:recovery/root/sbin/oeminfo_nvm_server \
	$(LOCAL_PATH)/recovery/sbin/check_root:recovery/root/sbin/check_root \
	$(LOCAL_PATH)/recovery/sbin/kmsgcat:recovery/root/sbin/kmsgcat \
	$(LOCAL_PATH)/recovery/sbin/cust:recovery/root/sbin/cust \
	$(LOCAL_PATH)/recovery/sbin/ntfs-3gd:recovery/root/sbin/ntfs-3gd \
	$(LOCAL_PATH)/recovery/sbin/hw_ueventd:recovery/root/sbin/hw_ueventd \
	$(LOCAL_PATH)/recovery/sbin/logctl_service:recovery/root/sbin/logctl_service \
	$(LOCAL_PATH)/recovery/sbin/factory_reset:recovery/root/sbin/factory_reset \
	$(LOCAL_PATH)/recovery/sbin/emmc_partation:recovery/root/sbin/emmc_partation \
	$(LOCAL_PATH)/recovery/sbin/volisnotd:recovery/root/sbin/volisnotd \

	
# ========================================== RAMDISK ==========================================
# To clean
 PRODUCT_COPY_FILES += \
  	$(LOCAL_PATH)/root/fstab.hi3630:root/fstab.hi3630 \
 	$(LOCAL_PATH)/root/init.41031.rc:root/init.41031.rc \
 	$(LOCAL_PATH)/root/init.4843.rc:root/init.4843.rc \
 	$(LOCAL_PATH)/root/init.71422.rc:root/init.71422.rc \
 	$(LOCAL_PATH)/root/init.chip.usb.rc:root/init.chip.usb.rc \
 	$(LOCAL_PATH)/root/init.connectivity.bcm4334.rc:root/init.connectivity.bcm4334.rc \
 	$(LOCAL_PATH)/root/init.connectivity.gps.rc:root/init.connectivity.gps.rc \
 	$(LOCAL_PATH)/root/init.connectivity.rc:root/init.connectivity.rc \
 	$(LOCAL_PATH)/root/init.device.rc:root/init.device.rc \
 	#$(LOCAL_PATH)/root/init.environ.rc:root/init.environ.rc \
 	$(LOCAL_PATH)/root/init.extmodem.rc:root/init.extmodem.rc \
 	$(LOCAL_PATH)/root/init.hi3630.rc:root/init.hi3630.rc \
 	$(LOCAL_PATH)/root/init.hisi.rc:root/init.hisi.rc \
 	$(LOCAL_PATH)/root/init.manufacture.rc:root/init.manufacture.rc \
 	$(LOCAL_PATH)/root/init.platform.rc:root/init.platform.rc \
 	$(LOCAL_PATH)/root/init.post-fs-data.rc:root/init.post-fs-data.rc \
 	$(LOCAL_PATH)/root/init.rc:root/init.rc \
 	$(LOCAL_PATH)/root/init.trace.rc:root/init.trace.rc \
 	$(LOCAL_PATH)/root/init.usb.rc:root/init.usb.rc \
 	$(LOCAL_PATH)/root/init.hi3630.usb.rc:root/init.hi3630.usb.rc \
 	$(LOCAL_PATH)/root/ueventd.hi3630.rc:root/ueventd.hi3630.rc \
 	$(LOCAL_PATH)/root/resetFactory.cfg:root/resetFactory.cfg \
	$(LOCAL_PATH)/root/sbin/hdbd:root/sbin/hdbd \
	$(LOCAL_PATH)/root/sbin/teecd:root/sbin/teecd \
	$(LOCAL_PATH)/root/sbin/oeminfo_nvm_server:root/sbin/oeminfo_nvm_server \
	$(LOCAL_PATH)/root/sbin/check_root:root/sbin/check_root \
	$(LOCAL_PATH)/root/sbin/kmsgcat:root/sbin/kmsgcat \
	$(LOCAL_PATH)/root/sbin/ntfs-3gd:root/sbin/ntfs-3gd \
	$(LOCAL_PATH)/root/sbin/hw_ueventd:root/sbin/hw_ueventd \
	$(LOCAL_PATH)/root/sbin/logctl_service:root/sbin/logctl_service \
	$(LOCAL_PATH)/root/sbin/e2fsck_s:root/sbin/e2fsck_s \
	$(LOCAL_PATH)/root/sbin/emmc_partation:root/sbin/emmc_partation \
	$(LOCAL_PATH)/root/sbin/volisnotd:root/sbin/volisnotd 

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.external.xml:system/etc/permissions/android.hardware.camera.external.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
	frameworks/native/data/etc/android.software.webview.xml:system/etc/permissions/android.software.webview.xml \
	frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
	#frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
	#frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	#frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
	#frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml
