LOCAL_PATH := $(call my-dir)


INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(PRODUCT_OUT)/kernel $(INSTALLED_RAMDISK_TARGET) $(INTERNAL_BOOTIMAGE_FILES) $(HOST_OUT_EXECUTABLES)/mkbootimg-mt7
	$(call pretty,"Boot image: $@")
	$(hide) $(HOST_OUT_EXECUTABLES)/mkbootimg-mt7 --kernel $(PRODUCT_OUT)/kernel --ramdisk $(INSTALLED_RAMDISK_TARGET) $(BOARD_MKBOOTIMG_ARGS) --output $(INSTALLED_BOOTIMAGE_TARGET)


INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_ramdisk) $(recovery_kernel) $(HOST_OUT_EXECUTABLES)/mkbootimg-mt7
	@echo ----- Making CUSTOM recovery image ------
	$(hide) $(HOST_OUT_EXECUTABLES)/mkbootimg-mt7 --kernel $(recovery_kernel) --ramdisk $(recovery_ramdisk) $(BOARD_MKBOOTIMG_ARGS) --output $(INSTALLED_RECOVERYIMAGE_TARGET)
	@echo ----- Made CUSTOM recovery image -------- $@
