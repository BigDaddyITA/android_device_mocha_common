#
# Copyright (C) 2014 The CyanogenMod Project
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

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG += normal hdpi xhdpi xxhdpi
TARGET_SCREEN_HEIGHT := 2048
TARGET_SCREEN_WIDTH := 1536

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/Xiaomi/mocha/mocha-vendor.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    device/Xiaomi/mocha-common/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    init \
    fstab.mocha \
    init.mocha.rc \
    init.t124_emmc.rc \
    init.t124_sata.rc \
    init.cal.rc \
    init.hdcp.rc \
    init.t124.rc \
    init.tlk.rc \
    init.nv_dev_board.usb.rc \
    power.mocha.rc \
    ueventd.mocha.rc

PRODUCT_COPY_FILES += \
    device/Xiaomi/mocha-common/rootdir/etc/init:root/init \
    device/Xiaomi/mocha-common/rootdir/sbin/chargeonlymode:root/sbin/chargeonlymode \
    device/Xiaomi/mocha-common/rootdir/sbin/mdbd:root/sbin/mdbd
# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true

#kernel
LOCAL_PATH := device/Xiaomi/mocha-common

ifeq ($(TARGET_PREBUILT_KERNEL),)
        LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
        LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel


# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# NVIDIA
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.nvidia.graphics.xml:system/etc/permissions/com.nvidia.graphics.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.nvsi.xml:system/etc/permissions/com.nvidia.nvsi.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.miracast.xml:system/etc/permissions/com.nvidia.miracast.xml

# idc
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/idc/touch.idc:system/usr/idc/touch.idc \
  $(LOCAL_PATH)/idc/touch_fusion.idc:system/usr/idc/touch_fusion.idc \
  $(LOCAL_PATH)/idc/sensor00fn11.idc:system/usr/idc/sensor00fn11.idc

# keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/Vendor_0955_Product_7210.kl:system/usr/keylayout/Vendor_0955_Product_7210.kl

# Media config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audioConfig_qvoice_icera_pc400.xml:system/etc/audioConfig_qvoice_icera_pc400.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    $(LOCAL_PATH)/audio/nvaudio_fx.xml:system/etc/nvaudio_fx.xml

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    libaudio-resampler \
    tinycap \
    tinymix \
    tinyplay \
    xaplay

# GPS
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/gps/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
#    $(LOCAL_PATH)/gps/rootcert.pem:system/etc/gps/rootcert.pem \
#    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/nvcamera.conf:system/etc/nvcamera.conf \
    $(LOCAL_PATH)/camera/model_frontal.xml:system/etc/model_frontal.xml

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/fw_bcmdhd.bin:system/etc/firmware/fw_bcmdhd.bin \
    $(LOCAL_PATH)/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_PACKAGES += \
    libnetcmdiface

# Enable Widevine drm
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true

# Light
PRODUCT_PACKAGES += \
    lights.tegra

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_CHARACTERISTICS := tablet

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Disable SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=disabled

# Common build.props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version = 196609 \
    wifi.interface=wlan0 \
    ap.interface=wlan0 \
    persist.tegra.nvmmlite = 1 \
    persist.wlan.ti.calibrated = 0 \
    ro.sf.override_null_lcd_density = 0 \
    ro.sf.lcd_density=320 \
    ro.btconfig.if=uart \
    ro.btconfig.dev=/dev/ttyTHS2 \
    ro.btconfig.vendor=broadcom \
    ro.btconfig.chip=BCM4354 \
    ro.wlan.mimo=1 \
    ro.radio.noril=yes \
    persist.sys.aries.power_profile=middle \
    persist.sys.NV_POWER_MODE=1 \
    persist.power.useautobrightadj=true \
    persist.sys.button_jack_profile=volume \
    persist.sys.button_jack_switch=0 \
    persist.sys.button_headset_hook=media \
    ro.audio.flinger_standbytime_ms=500 \
    af.resampler.quality=3 \
    persist.sys.NV_OEM_PROFILE_NAME=/system/etc/profile.bin \
    ro.nv.usb.vid = 2717 \
    ro.nv.usb.pid.mtp = 0660 \
    ro.nv.usb.pid.mtp.adb = 0668 \
    ro.nv.usb.pid.rndis = 0680 \
    ro.nv.usb.pid.rndis.adb = 0688 \
    ro.nv.usb.pid.ptp = 0610 \
    ro.nv.usb.pid.ptp.adb = 0618 \
    persist.tegra.compositor=glcomposer \
    ro.input.noresample=1 \
    ro.com.google.clientidbase=android-nvidia \
    ro.zygote.disable_gl_preload=true \
    pbc.enabled=0 \
    pbc.log=0 \
    pbc.board_power_threshold=20000 \
    pbc.low_polling_freq_threshold=1000 \
    pbc.rails=cpu,core,dram,gpu \
    pbc.cpu.power=/sys/bus/i2c/devices/7-0045/power1_input \
    pbc.cpu.cap=/dev/cpu_freq_max \
    pbc.cpu.cap.af=/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies \
    pbc.core.power=/sys/bus/i2c/devices/7-0043/power1_input \
    pbc.dram.power=/sys/bus/i2c/devices/7-0049/power1_input \
    pbc.gpu.power=/sys/bus/i2c/devices/7-004b/power1_input \
    pbc.gpu.cap=/dev/gpu_freq_max \
    pbc.gpu.cap.af=/sys/devices/platform/host1x/gk20a.0/devfreq/gk20a.0/available_frequencies \
    af.resampler.quality = 3 \
    persist.sys.strictmode.disable=true

#persist.tegra.didim.enable = 1
#persist.tegra.didim.video = 5
#persist.tegra.didim.normal = 3
