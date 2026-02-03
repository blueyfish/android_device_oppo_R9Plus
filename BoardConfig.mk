#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oppo/R9sPlus

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8952

# Platform
TARGET_BOARD_PLATFORM := msm8952

# Partitions
TARGET_VENDOR_PARTITION := cache

# Inherit from common device tree
include device/oppo/thortanium-common/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 400

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):init_oppo_R9sPlus
TARGET_RECOVERY_DEVICE_MODULES := init_oppo_R9sPlus

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := lineageos_R9sPlus_defconfig
TARGET_KERNEL_RECOVERY_CONFIG := lineageos_R9sPlus_recovery_defconfig

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Security patch level
VENDOR_SECURITY_PATCH := 2018-06-05

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
