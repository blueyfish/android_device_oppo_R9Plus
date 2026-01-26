#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oppo/R9sPlus

# Inherit from the common device configuration.
TARGET_OPPO_PLATFORM := msm8952
$(call inherit-product, device/oppo/thortanium-common/thortanium.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Screen density
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Device uses high-density artwork where available
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(DEVICE_PATH)/audio/mixer_paths_skun.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_skun.xml

# Camera
PRODUCT_PACKAGES += \
    R9sPlus_camera_config.xml

# Input
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/keylayout/synaptics-s3320.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/synaptics-s3320.kl

# Rootdir
PRODUCT_PACKAGES += \
    init.device.rc \
    init.device.sh

# Wifi
PRODUCT_PACKAGES += \
    TargetWifiOverlay

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(DEVICE_PATH)/wifi/WCNSS_qcom_wlan_nv_16037.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/16037/WCNSS_qcom_wlan_nv.bin \
    $(DEVICE_PATH)/wifi/WCNSS_qcom_wlan_nv_16337.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/16337/WCNSS_qcom_wlan_nv.bin \
    $(DEVICE_PATH)/wifi/WCNSS_qcom_wlan_nv_16339.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/16339/WCNSS_qcom_wlan_nv.bin

# Inherit the proprietary files
$(call inherit-product, vendor/oppo/R9sPlus/R9sPlus-vendor.mk)
