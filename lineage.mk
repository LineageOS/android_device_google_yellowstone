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
# limitations under the License.
#

# Inherit common device specific configuration
$(call inherit-product, device/google/yellowstone/device.mk)

# Inherit AOSP base configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit common Lineage configuration for tablets
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit common Lineage configuration for telephony devices
$(call inherit-product, vendor/cm/config/telephony.mk)

# Boot Animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200

PRODUCT_NAME := lineage_yellowstone
PRODUCT_DEVICE := yellowstone
PRODUCT_BRAND := google
PRODUCT_MODEL := Project Tango Tablet Development Kit
PRODUCT_MANUFACTURER := Google

PRODUCT_GMS_CLIENTID_BASE := android-google

# Device Fingerprint
BUILD_FINGERPRINT := google/tango/yellowstone:4.4.2/KOT49H.161129/161129002:user/release-keys

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=tango \
    PRIVATE_BUILD_DESC="ardbeg-user 4.4.2 KOT49H.161129 161129002 release-keys"

# Inherit Proprietary Vendor Blobs
$(call inherit-product-if-exists, vendor/google/yellowstone/yellowstone-vendor.mk)
