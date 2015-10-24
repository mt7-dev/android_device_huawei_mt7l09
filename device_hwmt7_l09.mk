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

# DEVICE_PACKAGE_OVERLAYS += device/huawei/hwmt7_l09/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/hwmt7_l09/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

# ========================================== .PROP OVVERRIDES ==========================================

# .prop overrides

PRODUCT_BUILD_PROP_OVERRIDES += \
	BUILD_UTC_DATE=0 \

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.isUsbOtgEnabled=true \
	ro.sf.lcd_density=370 \
	ro.hardware.alter=Kirin925
	
## From stock system.prop
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.zygote=zygote32 \
	dalvik.vm.dex2oat-Xms=64m \
	dalvik.vm.dex2oat-Xmx=512m \
	dalvik.vm.image-dex2oat-Xms=64m \
	dalvik.vm.image-dex2oat-Xmx=64m \
	ro.dalvik.vm.native.bridge=0 

# ========================================== ======= = ======= ==========================================

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

# ========================================== RECOVERY ==========================================
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/init.recovery.hi3630.rc:root/init.recovery.hi3630.rc \
	$(LOCAL_PATH)/recovery/res/images/charger/battery_0.png:root/res/images/charger/battery_0.png \
	$(LOCAL_PATH)/recovery/res/images/charger/battery_1.png:root/res/images/charger/battery_1.png \
	$(LOCAL_PATH)/recovery/res/images/charger/battery_2.png:root/res/images/charger/battery_2.png \
	$(LOCAL_PATH)/recovery/res/images/charger/battery_3.png:root/res/images/charger/battery_3.png \
	$(LOCAL_PATH)/recovery/res/images/charger/battery_4.png:root/res/images/charger/battery_4.png \
	$(LOCAL_PATH)/recovery/res/images/charger/battery_5.png:root/res/images/charger/battery_5.png \
	$(LOCAL_PATH)/recovery/res/images/charger/battery_charge.png:root/res/images/charger/battery_charge.png \
	$(LOCAL_PATH)/recovery/res/images/charger/battery_fail.png:root/res/images/charger/battery_fail.png

	
# ========================================== RAMDISK ==========================================
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
	$(LOCAL_PATH)/ramdisk/ueventd.hi3630.rc:root/ueventd.hi3630.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.rc 
	
# ========================================== KEYLAYOUTS ==========================================
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/AVRCP.kl:dd \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/fingerprint.kl:system/usr/keylayout/fingerprint.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/hi3630_keypad.kl:system/usr/keylayout/hi3630_keypad.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_0079_Product_0011.kl:system/usr/keylayout/Vendor_0079_Product_0011.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_046d_Product_b501.kl:system/usr/keylayout/Vendor_046d_Product_b501.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_046d_Product_c219.kl:system/usr/keylayout/Vendor_046d_Product_c219.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_046d_Product_c21d.kl:system/usr/keylayout/Vendor_046d_Product_c21d.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_046d_Product_c21f.kl:system/usr/keylayout/Vendor_046d_Product_c21f.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_0583_Product_2060.kl:system/usr/keylayout/Vendor_0583_Product_2060.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_0b05_Product_4500.kl:system/usr/keylayout/Vendor_0b05_Product_4500.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_1038_Product_1412.kl:system/usr/keylayout/Vendor_1038_Product_1412.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_12bd_Product_d015.kl:system/usr/keylayout/Vendor_12bd_Product_d015.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_1532_Product_0900.kl:system/usr/keylayout/Vendor_1532_Product_0900.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_1689_Product_fd00.kl:system/usr/keylayout/Vendor_1689_Product_fd00.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_1689_Product_fd01.kl:system/usr/keylayout/Vendor_1689_Product_fd01.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_1689_Product_fe00.kl:system/usr/keylayout/Vendor_1689_Product_fe00.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_18d1_Product_2c40.kl:system/usr/keylayout/Vendor_18d1_Product_2c40.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_1949_Product_0401.kl:system/usr/keylayout/Vendor_1949_Product_0401.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_1bad_Product_f016.kl:system/usr/keylayout/Vendor_1bad_Product_f016.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_1bad_Product_f023.kl:system/usr/keylayout/Vendor_1bad_Product_f023.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_1bad_Product_f027.kl:system/usr/keylayout/Vendor_1bad_Product_f027.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_1bad_Product_f036.kl:system/usr/keylayout/Vendor_1bad_Product_f036.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_1d79_Product_0009.kl:system/usr/keylayout/Vendor_1d79_Product_0009.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_2378_Product_1008.kl:system/usr/keylayout/Vendor_2378_Product_1008.kl \
	$(LOCAL_PATH)/rootdir/system/usr/keylayout/Vendor_2378_Product_100a.kl:system/usr/keylayout/Vendor_2378_Product_100a.kl 

	
# ========================================== MISC ==========================================
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/thermald.xml:system/etc/thermald.xml \
    $(LOCAL_PATH)/rootdir/system/etc/thermald_performance.xml:system/etc/thermald_performance.xml
