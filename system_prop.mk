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

### System Properties for yellowstone

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.config.persist_cal_path=/persist \
    persist.config.calibration_fac=/sdcard/config/calibration.xml

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.override_null_lcd_density=1 \
    ro.sf.lcd_density=320

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# GL
# Use glcomposer as the default compositor
# Don't preload OpenGL in Zygote, the Tegra drivers do not like it
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.compositor=glcomposer \
    ro.opengles.version=196610 \
    ro.zygote.disable_gl_preload=true

# LTE, CDMA, GSM/WCDMA
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    persist.ril.forceairplanemode=0 \
    ro.telephony.default_cdma_sub=0 \
    ro.telephony.default_network=9 \
    telephony.lteOnCdmaDevice=1

# NVMM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.nvmmlite=1

# OMX
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false

# Senors
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sensorhubd.update=1

# USB
PRODUCT_PROPERTY_OVERRIDES += \
    ro.nv.usb.pid.mtp.adb=4D02 \
    ro.nv.usb.pid.mtp=4D01 \
    ro.nv.usb.pid.ptp.adb=4D06 \
    ro.nv.usb.pid.ptp=4D05 \
    ro.nv.usb.pid.rndis.adb=4D04 \
    ro.nv.usb.pid.rndis=4D03 \
    ro.nv.usb.vid=18d1

# Vendor SPL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2014-09-30

# Wi-Fi
PRODUCT_PROPERTY_OVERRIDES += \
    ap.interface=wlan0 \
    persist.wlan.ti.calibrated=0 \
    wifi.interface=wlan0
