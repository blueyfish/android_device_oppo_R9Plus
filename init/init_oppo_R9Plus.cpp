/*
 * Copyright (C) 2021 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_dalvik_heap.h>
#include <libinit_oppo_version.h>
#include <libinit_utils.h>
#include <libinit_variant.h>

#include "vendor_init.h"

#include <android-base/file.h>
#include <android-base/logging.h>

using android::base::ReadFileToString;

static const variant_info_t r9splus_info = {
    .brand = "OPPO",
    .device = "R9sPlus",
    .marketname = "OPPO R9s Plus",
    .model = "OPPO R9s Plus",
    .build_fingerprint = "OPPO/R9sPlus/R9sPlus:6.0.1/MMB29M/1523881866:user/release-keys",
    .build_description = "msm8952_64-user 6.0.1 MMB29M eng.root.20190819.142943 dev-keys",
};

static const variant_info_t r9splust_info = {
    .brand = "OPPO",
    .device = "R9sPlus",
    .marketname = "OPPO R9s Plust",
    .model = "OPPO R9s Plust",
    .build_fingerprint = "OPPO/R9sPlust/R9sPlus:6.0.1/MMB29M/1483618348:user/release-keys",
    .build_description = "msm8952_64-user 6.0.1 MMB29M eng.root.20170402.100632 dev-keys",
};

static const variant_info_t cph1611_info = {
    .brand = "OPPO",
    .device = "CPH1611",
    .marketname = "OPPO R9s Plus",
    .model = "CPH1611",
    .build_fingerprint = "Android/msm8952_64/msm8952_64:6.0.1/MMB29M/root03071007:user/release-keys",
    .build_description = "msm8952_64-user 6.0.1 MMB29M eng.root.20190307.100547 release-keys",
};

static const variant_info_t cph1613_info = {
    .brand = "OPPO",
    .device = "CPH1613",
    .marketname = "OPPO F3 Plus",
    .model = "CPH1613",
    .build_fingerprint = "Android/msm8952_64/msm8952_64:6.0.1/MMB29M/root03071007:user/release-keys",
    .build_description = "msm8952_64-user 6.0.1 MMB29M eng.root.20190307.100547 release-keys",
};

static const variant_info_t cph1613fw_info = {
    .brand = "OPPO",
    .device = "CPH1613fw",
    .marketname = "OPPO F3 Plus",
    .model = "CPH1613fw",
    .build_fingerprint = "Android/msm8952_64/msm8952_64:6.0.1/MMB29M/root03071007:user/release-keys",
    .build_description = "msm8952_64-user 6.0.1 MMB29M eng.root.20190307.100547 release-keys",
};

static const variant_info_t cph1613_th_info = {
    .brand = "OPPO",
    .device = "CPH1613",
    .marketname = "OPPO R9s Plus",
    .model = "CPH1613",
    .build_fingerprint = "Android/msm8952_64/msm8952_64:6.0.1/MMB29M/root03071007:user/release-keys",
    .build_description = "msm8952_64-user 6.0.1 MMB29M eng.root.20190307.100547 release-keys",
};

static void determine_device() {
    if (ReadProjectVersion() == 16037) {
        switch (ReadOperatorName()) {
            /* China */
            case 8:
                set_variant_props(r9splus_info);
                break;

            case 9:
                set_variant_props(r9splust_info);
                break;

            /* Global */
            case 102:
                set_variant_props(cph1611_info);
                break;

            case 104:
            case 106:
            {
                std::string reserve_exp1;
                if (ReadFileToString("/dev/block/bootdevice/by-name/reserve_exp1", &reserve_exp1)) {
                    if (!strncmp(reserve_exp1.c_str(), "00010001", 8)) {
                        set_variant_props(cph1613fw_info);
                        break;
                    } else if (!strncmp(reserve_exp1.c_str(), "00110001", 8)) {
                        set_variant_props(cph1613_th_info);
                        break;
                    }
                }
                set_variant_props(cph1613_info);
                break;
            }

            default:
                LOG(WARNING) << "Unknown operator variant, setting R9sPlus";
                set_variant_props(r9splus_info);
                break;
        }
    } else {
        LOG(ERROR) << "Unknown device variant";
    }
}

void vendor_load_properties() {
    determine_device();
    set_dalvik_heap();
}
