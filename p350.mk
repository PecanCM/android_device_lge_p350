# Inherit from those products. Most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, device/common/gps/gps_us_supl.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)
$(call inherit-product, vendor/qcom/opensource/omx/mm-core/Android.mk)
$(call inherit-product, vendor/qcom/opensource/omx/mm-video/Android.mk)
$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/lge/p350/p350-vendor.mk)
$(call inherit-product-if-exists, vendor/lge/msm7x27-common/msm7x27-common-vendor-blobs.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/p350/overlay

PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi

PRODUCT_LOCALES := \
	en_GB \

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/base/data/etc/com.stericsson.hardware.fm.receiver.xml:system/etc/permissions/com.stericsson.hardware.fm.receiver.xml

# Board-specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/init.p350.rc:root/init.p350.rc \
    $(LOCAL_PATH)/root/ueventd.p350.rc:root/ueventd.p350.rc \
    $(LOCAL_PATH)/root/init.p350.usb.rc:root/init.p350.usb.rc

# Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/configs/qwerty.kl:system/usr/keylayout/qwerty.kl \
    $(LOCAL_PATH)/configs/touch_mcs7000.kl:system/usr/keylayout/touch_mcs7000.kl \
    $(LOCAL_PATH)/configs/AVRCP.kl:system/usr/keylayout/AVRCP.kl

# BT startup
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

# Releasetool
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/releasetools/extras.sh:system/bin/extras.sh

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# SD Card
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/configs/sysctl.conf:system/etc/sysctl.conf

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/configs/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# gps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \

# Pecan RIL implementation
FRAMEWORKS_BASE_SUBDIRS += ../../$(LOCAL_PATH)/ril/

# Display 
PRODUCT_PACKAGES += \
   libmemalloc \
   liblgenlock \
   gralloc.msm7x27 \
   copybit.msm7x27 \
   libstagefrighthw \
   libtilerenderer \
   hwcomposer.msm7x27 \
   libQcomUI \

# Audio
PRODUCT_PACKAGES += \
    audio_policy.p350 \
    audio.primary.p350 \
    audio.a2dp.default \
    libaudioutils

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Video decoding
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libdivxdrmdecrypt

# Apps
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    FM \
    Gallery \
    CMFileManager 

# Other
PRODUCT_PACKAGES += \
    librs_jni \
    camera.msm7x27 \
    lights.msm7x27 \
    gps.msm7x27 \
    librpc \
    lgapversion

PRODUCT_PACKAGES += \
    hcitool \
    hciconfig \
    hwaddrs

PRODUCT_PACKAGES += \
    charger \
    charger_res_images

PRODUCT_PACKAGES += \
	FmRadio \
	FmRadioReceiver \

# Battery life hacks
PRODUCT_PROPERTY_OVERRIDES += \
    # Better sleep system
    pm.sleep_mode=1
    # Scan for WiFi less often to increase batery life
    wifi.supplicant_scan_interval=180

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.camera=msm7x27 \
    debug.camcorder.disablemeta=1 \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r6 \
    ro.setupwizard.enable_bypass=1 \
    ro.telephony.call_ring.multiple=false \
    ro.vold.umsdirtyratio=20

PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    com.qc.hdmi_out=false \
    debug.sf.hw=1 \
    debug.enabletr=false \
    debug.composition.type=mdp \
    debug.gr.numframebuffers=2 \
    debug.qctwa.statusbar=1 \
    debug.qctwa.preservebuf=1 \
    hwui.render_dirty_regions=false \
    hwui.print_config=choice \
    persist.sys.strictmode.visual=false

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_NAME := cm_p350
PRODUCT_DEVICE := p350
PRODUCT_MODEL := LG-P350

