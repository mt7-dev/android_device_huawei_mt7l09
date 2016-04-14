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
#
# =====================================================================
#
# Porting project started by gabry3795 - gabry.gabry <at> hotmail.it
#
#  Every contribute is welcome here!
#
# This file is inspired by the Honor 6 cyanogenmod project
# a phone that is very similar to Ascend Mate 7.
#
#  Search for h60-dev on github - Thank you @codeworks

USE_CAMERA_STUB := true
TARGET_OTA_ASSERT_DEVICE := hwmt7_l09,mt7l09,mt7_l09,MT7-L09,MT7L09,h60

# inherit from the proprietary version
-include vendor/huawei/mt7_l09/BoardConfigVendor.mk

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_ARCH_VARIANT_CPU := cortex-a15
TARGET_CPU_VARIANT := cortex-a15
ARCH_ARM_HAVE_NEON := true
# TARGET_2ND_ARCH = arm
# TARGET_2ND_ARCH_VARIANT = cortex-a7
# TARGET_2ND_CPU_VARIANT = cortex-a7
TARGET_USE_GATOR := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mtune=cortex-a15 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mtune=cortex-a15 -mfloat-abi=softfp
TARGET_EXTRA_CFLAGS := -mtune=cortex-a15 -mcpu=cortex-a15

# Compiler Optimizations
ARCH_ARM_HIGH_OPTIMIZATION := true

# Enable various prefetch optimizations
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# vendor flags
BOARD_VENDOR := huawei
BOARD_VENDOR_PLATFORM := hi3630
TARGET_BOOTLOADER_BOARD_NAME := hi3630
TARGET_BOARD_PLATFORM := hi3630
TARGET_SOC := kirin925

COMMON_GLOBAL_CFLAGS += -DHISILICON_HI3630
#COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Init
# TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true
# TARGET_PROVIDES_INIT_RC := true

# ========================================== KERNEL ==========================================

TARGET_KERNEL_SOURCE := kernel/huawei/mt7_l09
TARGET_KERNEL_CONFIG := merge_hi3630_defconfig
TARGET_KERNEL_ARCH := arm
# BOARD_USES_UBOOT := true
## Let's keep this as a fallback
TARGET_PREBUILT_KERNEL 	:= device/huawei/mt7_l09/kernel
BOARD_KERNEL_CMDLINE 	:= 'vmalloc=384M coherent_pool=512K mem=2044m@0x200000 psci=enable mmcparts=mmcblk0:p1(vrl),p2(vrl_backup),p7(modemnvm_factory),p18(splash),p22(dfx),p23(modemnvm_backup),p24(modemnvm_img),p25(modemnvm_system),p26(modem),p27(modem_dsp),p28(modem_om),p29(modemnvm_update),p31(3rdmodem),p32(3rdmodemnvm),p33(3rdmodemnvmbkp) user_debug=7 androidboot.selinux=enforcing'

# These values are the original extracted by kernel image
## BOARD_KERNEL_BASE := 0x00600000
## BOARD_KERNEL_CMDLINE := 'vmalloc=384M coherent_pool=512K mem=2044m@0x200000 psci=enable mmcparts=mmcblk0:p1(vrl),p2(vrl_backup),p7(modemnvm_factory),p18(splash),p22(dfx),p23(modemnvm_backup),p24(modemnvm_img),p25(modemnvm_system),p26(modem),p27(modem_dsp),p28(modem_om),p29(modemnvm_update),p31(3rdmodem),p32(3rdmodemnvm),p33(3rdmodemnvmbkp) user_debug=7 androidboot.selinux=enforcing enter_recovery=1 enter_erecovery=0'

# See _notes/stock-boot.img-unmkbootimg.txt
# Kernel size 7521280
# Kernel address 0x608000
# Ramdisk size 3306832
# Ramdisk address 0x4000000
# Secondary size 0
# Secondary address 0xf00000
# Kernel tags address 0x200000
# Flash page size 2048
# Board name is ""
# Command line "vmalloc=384M coherent_pool=512K mem=2044m@0x200000 psci=enable mmcparts=mmcblk0:p1(vrl),p2(vrl_backup),p7(modemnvm_factory),p18(splash),p22(dfx),p23(modemnvm_backup),p24(modemnvm_img),p25(modemnvm_system),p26(modem),p27(modem_dsp),p28(modem_om),p29(modemnvm_update),p31(3rdmodem),p32(3rdmodemnvm),p33(3rdmodemnvmbkp) user_debug=7 androidboot.selinux=enforcing enter_recovery=1 enter_erecovery=0"
# 
# *** WARNING ****
# This image is built using NON-standard mkbootimg!
# OFF_KERNEL_ADDR is 0x00408100
# OFF_RAMDISK_ADDR is 0x03E00100
# OFF_SECOND_ADDR is 0x00D00100
# Please modify mkbootimg.c using the above values to build your image.


# gabry3795@darkseat-works:~/cyanogen/bin/mkbootimg$ ./unpackbootimg -i ~/Desktop/MATE7/_originalimg/boot.img 
# BOARD_KERNEL_CMDLINE vmalloc=384M coherent_pool=512K mem=2044m@0x200000 psci=enable mmcparts=mmcblk0:p1(vrl),p2(vrl_backup),p7(modemnvm_factory),p18(splash),p22(dfx),p23(modemnvm_backup),p24(modemnvm_img),p25(modemnvm_system),p26(modem),p27(modem_dsp),p28(modem_om),p29(modemnvm_update),p31(3rdmodem),p32(3rdmodemnvm),p33(3rdmodemnvmbkp) user_debug=7 androidboot.selinux=enforcing enter_recovery=1 enter_erecovery=0
# BOARD_KERNEL_BASE 00600000
# BOARD_NAME 
# BOARD_PAGE_SIZE 2048
# BOARD_KERNEL_OFFSET 00008000
# BOARD_RAMDISK_OFFSET 03a00000
# BOARD_TAGS_OFFSET ffc00000


# root@hwmt7:/proc # cat iomem                                                   
# 00200000-27ffffff : System RAM
#   00608000-0131cefb : Kernel code
#   01380000-01b3866b : Kernel data

BOARD_KERNEL_PAGESIZE	:= 2048

#BOARD_KERNEL_BASE	:= 0x00200000
#BOARD_KERNEL_OFFSET	:= 0x00608000
#BOARD_RAMDISK_BASE	:= 0x04000000
#BOARD_RAMDISK_OFFSET	:= 0x03A00000
#BOARD_SECOND_OFFSET	:= 0x00D00100
#BOARD_TAGS_OFFSET	:= 0xFFC00000
BOARD_KERNEL_BASE     := 0x00000000
BOARD_KERNEL_OFFSET   := 0x00608000
BOARD_RAMDISK_OFFSET  := 0x04000000
BOARD_SECOND_OFFSET   := 0x00f00000
BOARD_TAGS_OFFSET     := 0x00200000

###

#BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS 	+= --base 0x1fff00
BOARD_MKBOOTIMG_ARGS 	+= --kernel_offset 0x00408100
BOARD_MKBOOTIMG_ARGS 	+= --ramdisk_offset 0x03E00100
BOARD_MKBOOTIMG_ARGS 	+= --second_offset 0x00D00100
#BOARD_MKBOOTIMG_ARGS	+= --ramdisk 0x03E00100
#BOARD_MKBOOTIMG_ARGS 	+= --tags_offset $(BOARD_TAGS_OFFSET)

# fix this up by examining /proc/mtd on a running device
BOARD_NAND_PAGE_SIZE 			:= 4096
BOARD_NAND_SPARE_SIZE 			:= 128
BOARD_BOOTIMAGE_PARTITION_SIZE 		:= 14680064
BOARD_RECOVERYIMAGE_PARTITION_SIZE 	:= 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE 	:= 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE 	:= 12759072768
BOARD_FLASH_BLOCK_SIZE 			:= 4096
TARGET_USERIMAGES_USE_EXT4 		:= true

# Libc extensions
BOARD_PROVIDES_ADDITIONAL_BIONIC_STATIC_LIBS += libc_huawei_symbols

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Graphics
USE_OPENGL_RENDERER := true

# Audio
BOARD_USES_ALSA_AUDIO := true
#BOARD_USE_ICOS_MIRROR_SERVICE := true

# Camera
BOARD_CAMERA_HAVE_ISO := true
COMMON_GLOBAL_CFLAGS += -DHAVE_ISO

# RIL
#BOARD_RIL_CLASS := ../../../device/huawei/mt7_l09/ril/

# Preload bootanimation
TARGET_BOOTANIMATION_PRELOAD := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Selinux
# BOARD_SEPOLICY_DIRS += \
    device/huawei/mt7_l09/selinux

# BOARD_SEPOLICY_UNION += \
	file_contexts \
	installd.te \
	property_contexts \
	seapp_contexts \
	service_contexts	


# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := device/huawei/mt7_l09/ramdisk/fstab.hi3630
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
BOARD_RECOVERY_NEEDS_FBIOPAN_DISPLAY := true
#BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_USERIMAGES_USE_EXT4 := true
