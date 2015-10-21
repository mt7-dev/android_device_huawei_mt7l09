# Porting project started by gabry3795 - gabry.gabry <at> hotmail.it
#
#  Every contribute is welcome here!
#
# This file is inspired by the Honor 6 cyanogenmod project
# a phone that is very similar to Ascend Mate 7.
#
#  Search for h60-dev on github

USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/huawei/mt7l09/BoardConfigVendor.mk

# vendor flags
BOARD_VENDOR := huawei
BOARD_VENDOR_PLATFORM := hi3630
TARGET_BOOTLOADER_BOARD_NAME := hi3630
TARGET_BOARD_PLATFORM := hi3630
TARGET_SOC := kirin925

# Architecture
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_ARCH_VARIANT_CPU := cortex-a15
TARGET_CPU_VARIANT := cortex-a15
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mtune=cortex-a15 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mtune=cortex-a15 -mfloat-abi=softfp
TARGET_EXTRA_CFLAGS := -mtune=cortex-a15 -mcpu=cortex-a15

# Kernel
## Config file has been grabbed from the stock kernel image "stock-kernel-from511-v3-10-74"
TARGET_KERNEL_CONFIG := hisi_3630_defconfig
TARGET_KERNEL_SOURCE := kernel/huawei/mt7l09
# BOARD_USES_UBOOT := true ## Anyone knows?
## Let's keep this as a fallback
TARGET_PREBUILT_KERNEL := device/huawei/mt7l09/stock-kernel-from511-v3-10-74
BOARD_KERNEL_CMDLINE := vmalloc=384M coherent_pool=512K mem=2044m@0x200000 psci=enable mmcparts=mmcblk0:p1(vrl),p2(vrl_backup),p7(modemnvm_factory),p18(splash),p22(dfx),p23(modemnvm_backup),p24(modemnvm_img),p25(modemnvm_system),p26(modem),p27(modem_dsp),p28(modem_om),p29(modemnvm_update),p31(3rdmodem),p32(3rdmodemnvm),p33(3rdmodemnvmbkp) user_debug=7 androidboot.selinux=enforcing enter_recovery=1 enter_erecovery=0
BOARD_KERNEL_BASE := 0x00600000
BOARD_KERNEL_PAGESIZE := 2048

# Graphics
USE_OPENGL_RENDERER := true

# fix this up by examining /proc/mtd on a running device
BOARD_NAND_PAGE_SIZE := 4096
BOARD_NAND_SPARE_SIZE := 128
BOARD_BOOTIMAGE_PARTITION_SIZE := 14680064
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12759072768
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USERIMAGES_USE_EXT4 := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := device/huawei/mt7l09/ramdisk/fstab.hi3630
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
BOARD_RECOVERY_NEEDS_FBIOPAN_DISPLAY := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_USERIMAGES_USE_EXT4 := true
