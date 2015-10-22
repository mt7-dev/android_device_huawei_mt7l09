#
# Copyright (C) 2015 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/hwmt7_l09/hwmt7_l09-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/hwmt7_l09/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/hwmt7_l09/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_hwmt7_l09
PRODUCT_DEVICE := hwmt7_l09

# ---------------------------------------------------------------------------

# This device is xxhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xxhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
DEVICE_RESOLUTION := 1080x1920

LOCAL_PATH := device/huawei/hwmt7_l09

# Recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/init.recovery.hi3630.rc:recovery/root/init.recovery.hi3630.rc \
	$(LOCAL_PATH)/recovery/init.recovery.hi3630.rc:root/init.recovery.hi3630.rc

# Ramdisk
# To clean
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/default.prop:root/default.prop \
	$(LOCAL_PATH)/ramdisk/file_contexts:root/file_contexts \
	$(LOCAL_PATH)/ramdisk/fstab.hi3630:root/fstab.hi3630 \
	$(LOCAL_PATH)/ramdisk/init.41031.rc:root/init.41031.rc \
	$(LOCAL_PATH)/ramdisk/init.4843.rc:root/init.4843.rc \
	$(LOCAL_PATH)/ramdisk/init.71422.rc:root/init.71422.rc \
	$(LOCAL_PATH)/ramdisk/init.chip.usb.rc:root/init.chip.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.connectivity.bcm4334.rc:root/init.connectivity.bcm4334.rc \
	$(LOCAL_PATH)/ramdisk/init.connectivity.gps.rc:root/init.connectivity.gps.rc \
	$(LOCAL_PATH)/ramdisk/init.connectivity.rc:root/init.connectivity.rc \
	$(LOCAL_PATH)/ramdisk/init.device.rc:root/init.device.rc \
	$(LOCAL_PATH)/ramdisk/init.environ.rc:root/init.environ.rc \
	$(LOCAL_PATH)/ramdisk/init.extmodem.rc:root/init.extmodem.rc \
	$(LOCAL_PATH)/ramdisk/init.hi3630.rc:root/init.hi3630.rc \
	$(LOCAL_PATH)/ramdisk/init.hisi.rc:root/init.hisi.rc \
	$(LOCAL_PATH)/ramdisk/init.manufacture.rc:root/init.manufacture.rc \
	$(LOCAL_PATH)/ramdisk/init.platform.rc:root/init.platform.rc \
	$(LOCAL_PATH)/ramdisk/init.post-fs-data.rc:root/init.post-fs-data.rc \
	$(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
	$(LOCAL_PATH)/ramdisk/init.trace.rc:root/init.trace.rc \
	$(LOCAL_PATH)/ramdisk/init.usb.rc:root/init.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.zygote32.rc:root/init.zygote32.rc \
	$(LOCAL_PATH)/ramdisk/property_contexts:root/property_contexts \
	$(LOCAL_PATH)/ramdisk/seapp_contexts:root/seapp_contexts \
	$(LOCAL_PATH)/ramdisk/service_contexts:root/service_contexts \
	$(LOCAL_PATH)/ramdisk/ueventd.41031.rc:root/ueventd.41031.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.4843.rc:root/ueventd.4843.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.71422.rc:root/ueventd.71422.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.hi3630.rc:root/ueventd.hi3630.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.rc:recovery/root/ueventd.rc 
