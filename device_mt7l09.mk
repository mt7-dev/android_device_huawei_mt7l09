$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/mt7l09/mt7l09-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/mt7l09/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/mt7l09/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_mt7l09
PRODUCT_DEVICE := mt7l09

# ---------------------------------------------------------------------------

LOCAL_PATH := device/huawei/mt7l09

# Recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/init.recovery.hi3630.rc:recovery/root/init.recovery.hi3630.rc \
	$(LOCAL_PATH)/recovery/init.recovery.hi3630.rc:root/init.recovery.hi3630.rc

# Ramdisk
# To clean
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/default.prop:recovery/root/default.prop \
	$(LOCAL_PATH)/ramdisk/file_contexts:recovery/root/file_contexts \
	$(LOCAL_PATH)/ramdisk/fstab.hi3630:recovery/root/fstab.hi3630 \
	$(LOCAL_PATH)/ramdisk/init.41031.rc:recovery/root/init.41031.rc \
	$(LOCAL_PATH)/ramdisk/init.4843.rc:recovery/root/init.4843.rc \
	$(LOCAL_PATH)/ramdisk/init.71422.rc:recovery/root/init.71422.rc \
	$(LOCAL_PATH)/ramdisk/init.chip.usb.rc:recovery/root/init.chip.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.connectivity.bcm4334.rc:recovery/root/init.connectivity.bcm4334.rc \
	$(LOCAL_PATH)/ramdisk/init.connectivity.gps.rc:recovery/root/init.connectivity.gps.rc \
	$(LOCAL_PATH)/ramdisk/init.connectivity.rc:recovery/root/init.connectivity.rc \
	$(LOCAL_PATH)/ramdisk/init.device.rc:recovery/root/init.device.rc \
	$(LOCAL_PATH)/ramdisk/init.environ.rc:recovery/root/init.environ.rc \
	$(LOCAL_PATH)/ramdisk/init.extmodem.rc:recovery/root/init.extmodem.rc \
	$(LOCAL_PATH)/ramdisk/init.hi3630.rc:recovery/root/init.hi3630.rc \
	$(LOCAL_PATH)/ramdisk/init.hisi.rc:recovery/root/init.hisi.rc \
	$(LOCAL_PATH)/ramdisk/init.manufacture.rc:recovery/root/init.manufacture.rc \
	$(LOCAL_PATH)/ramdisk/init.platform.rc:recovery/root/init.platform.rc \
	$(LOCAL_PATH)/ramdisk/init.post-fs-data.rc:recovery/root/init.post-fs-data.rc \
	$(LOCAL_PATH)/ramdisk/init.rc:recovery/root/init.rc \
	$(LOCAL_PATH)/ramdisk/init.trace.rc:recovery/root/init.trace.rc \
	$(LOCAL_PATH)/ramdisk/init.usb.rc:recovery/root/init.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.zygote32.rc:recovery/root/init.zygote32.rc \
	$(LOCAL_PATH)/ramdisk/property_contexts:recovery/root/property_contexts \
	$(LOCAL_PATH)/ramdisk/seapp_contexts:recovery/root/seapp_contexts \
	$(LOCAL_PATH)/ramdisk/service_contexts:recovery/root/service_contexts \
	$(LOCAL_PATH)/ramdisk/ueventd.41031.rc:recovery/root/ueventd.41031.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.4843.rc:recovery/root/ueventd.4843.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.71422.rc:recovery/root/ueventd.71422.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.hi3630.rc:recovery/root/ueventd.hi3630.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.rc:recovery/root/ueventd.rc 
