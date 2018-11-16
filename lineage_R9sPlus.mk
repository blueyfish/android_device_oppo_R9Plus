#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from R9sPlus device
$(call inherit-product, device/oppo/R9sPlus/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Set shipping API level
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_m.mk)

# Device identifiers.
PRODUCT_NAME := lineage_R9sPlus
PRODUCT_DEVICE := R9sPlus
PRODUCT_MANUFACTURER := OPPO
PRODUCT_BRAND := OPPO
PRODUCT_MODEL := OPPO R9s Plus

PRODUCT_GMS_CLIENTID_BASE := android-oppo

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=R9sPlus \
    PRIVATE_BUILD_DESC="msm8952_64-user 6.0.1 MMB29M eng.root.20190819.142943 dev-keys"

BUILD_FINGERPRINT := "OPPO/R9sPlus/R9sPlus:6.0.1/MMB29M/1523881866:user/release-keys"
