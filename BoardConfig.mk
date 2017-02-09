#
# Copyright (C) 2017 The OmniRom Project
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
# Made By rishabhrao

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := s2

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8952
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8952
TARGET_BOARD_PLATFORM_GPU := qcom-adreno510

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x02000000
TARGET_PREBUILT_KERNEL := device/leeco/s2/kernel


# Partition Sizes
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864 
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864 
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4294967296 
BOARD_USERDATAIMAGE_PARTITION_SIZE := 57033579520

# Init 
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# Recovery
TARGET_RECOVERY_FSTAB := device/leeco/s2/recovery.fstab
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

# TWRP
DEVICE_RESOLUTION := 1080x1920
RECOVERY_VARIANT := twrp
BOARD_HAS_NO_REAL_SDCARD := true
TW_THEME := portrait_hdpi
DEVICE_RESOLUTION := 1080x1920
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_DEFAULT_BRIGHTNESS := "160"
TW_INPUT_BLACKLIST := "hbtp_vm"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_CRYPTO := true
TW_UNMOUNT_FIRMWARE_ON_BOOT := true

# MultiRom
TARGET_RECOVERY_IS_MULTIROM := true
MR_INPUT_TYPE := type_b
MR_NO_KEXEC := 2
MR_ALLOW_NKK71_NOKEXEC_WORKAROUND := true
MR_CONTINUOUS_FB_UPDATE := true
MR_INIT_DEVICES := device/leeco/s2/multirom/mr_init_devices.c
MR_DPI := xhdpi
MR_DPI_MUL := 2.0
MR_DPI_FONT := 435
MR_USE_MROM_FSTAB := false
MR_FSTAB := device/leeco/s2/recovery.fstab
MR_KEXEC_MEM_MIN := 0x0
MR_DEVICE_HOOKS := device/leeco/s2/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 6
MR_PIXEL_FORMAT := "RGBA_8888"
MR_ENCRYPTION := true
MR_ENCRYPTION_SETUP_SCRIPT := device/leeco/s2/multirom/mr_cp_crypto.sh
MR_ENCRYPTION_FAKE_PROPERTIES := true
MR_USE_QCOM_OVERLAY := true
MR_QCOM_OVERLAY_HEADER := device/huawei/angler/multirom/mr_qcom_overlay.h
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
MR_DEV_BLOCK_BOOTDEVICE := true
MR_POPULATE_BY_NAME_PATH := "/dev/block/platform/soc.0/7824900.sdhci/by-name"

# MultiRom Recovery Version
include device/leeco/s2/MR_REC_VERSION.mk
ifeq ($(MR_REC_VERSION),)
MR_REC_VERSION := $(shell date -u +%Y%m%d)-01
endif
BOARD_MKBOOTIMG_ARGS += --board mrom$(MR_REC_VERSION)
