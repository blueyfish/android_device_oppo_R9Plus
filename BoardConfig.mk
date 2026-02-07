#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oppo/R9Plus

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8952

# Kernel
TARGET_NEEDS_OPPO_VERITY_FAKESIGN := false

# Platform
TARGET_BOARD_PLATFORM := msm8952

# Partitions
TARGET_VENDOR_PARTITION := cache

# Inherit from common device tree
include device/oppo/thortanium-common/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 400

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):init_oppo_R9Plus
TARGET_RECOVERY_DEVICE_MODULES := init_oppo_R9Plus

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
TARGET_KERNEL_CONFIG := lineageos_R9Plus_defconfig
TARGET_KERNEL_RECOVERY_CONFIG := lineageos_R9Plus_recovery_defconfig

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Security patch level
VENDOR_SECURITY_PATCH := 2018-03-05

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
