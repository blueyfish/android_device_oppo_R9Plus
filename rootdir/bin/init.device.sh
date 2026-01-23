#! /vendor/bin/sh

#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

separate_soft=16037 # default
operator_name=$(cat /proc/oppoVersion/operatorName)

if [ $operator_name = 8 ] || [ $operator_name = 9 ]; then # China
    # Separate soft
    separate_soft=16037

    # IMEI SV
    if [ $operator_name = 8 ]; then # R9s Plus
        setprop ro.vendor.radio.imei.sv 15
    elif [ $operator_name = 9 ]; then # R9s Plust
        setprop ro.vendor.radio.imei.sv 2
    fi
else # Global
    # Separate soft
    case $operator_name in
        "102" ) # CPH1611
            separate_soft=16337
            ;;
        * ) # CPH1613 - 104, 106
            separate_soft=16339
            ;;
    esac

    # IMEI SV
    setprop ro.vendor.radio.imei.sv 22
fi

# Set separate soft property
setprop ro.separate.soft $separate_soft

# WiFi NV
setprop ro.vendor.wifi.nv $separate_soft
