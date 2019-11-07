# Copyright (C) 2019 The LineageOS Project
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
# limitations under the License
# inherit from the proprietary version

DEVICE_PATH := device/google/yellowstone

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a15
TARGET_EXCLUDES_AUDIOFX := true
TARGET_TEGRA_VERSION := t124

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Binder
TARGET_USES_64_BIT_BINDER := true

# Board
TARGET_BOARD_PLATFORM := tegra
TARGET_NO_BOOTLOADER := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
    endif
  endif
endif

# Graphics
USE_OPENGL_RENDERER := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/google/yellowstone
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
TARGET_KERNEL_CONFIG := yellowstone_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage

# Lineage Hardware
BOARD_HARDWARE_CLASS := $(DEVICE_PATH)/lineagehw

# Manifest
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USES_MKE2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 1509949440
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2097152000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 119358357504

# Power
TARGET_POWERHAL_VARIANT := tegra

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.yellowstone

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

# Shims
TARGET_LD_SHIM_LIBS := /system/lib/libcutils.so|/system/lib/libcutils_shim.so:/system/vendor/bin/glgps_nvidiaTegra2android|libsensor.so:/system/vendor/lib/libwvm.so|libshim_wvm.so

# Wi-Fi
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/bcm43341/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/bcm43341/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/vendor/firmware/bcm43341/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_ARG           := "iface_name=wlan0"
WIFI_DRIVER_MODULE_NAME          := "bcmdhd"
WPA_SUPPLICANT_VERSION           := VER_0_8_X

# Zygote Whitelist
ZYGOTE_WHITELIST_PATH_EXTRA := \"/dev/nvhost-ctrl\",\"/dev/nvmap\",

# Inherit from the proprietary board configuration
include vendor/google/yellowstone/BoardConfigVendor.mk
