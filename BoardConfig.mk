USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/lge/p350/BoardConfigVendor.mk

# Camera
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
TARGET_DISABLE_ARM_PIE := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_CAMERA_HAVE_ADDITIONAL_ISO := true
BOARD_USES_QCOM_LEGACY_CAM_PARAMS := true
TARGET_CAMERA_SENSOR_MP_SIZE := 3

# Platform & cpu
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm7x27
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_ARCH_VARIANT := armv6-vfp
ARCH_ARM_HAVE_VFP := true
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_VARIANT := arm11
TARGET_CPU_ABI2 := armeabi
TARGET_BOOTLOADER_BOARD_NAME := p350
TARGET_OTA_ASSERT_DEVICE := pecan,p350,p355
TARGET_NO_INITLOGO := true
TARGET_SPECIFIC_HEADER_PATH := device/lge/p350/include

# Kernel
TARGET_PREBUILT_RECOVERY_KERNEL := device/lge/p350/recovery/recovery_kernel
TARGET_KERNEL_SOURCE := kernel/lge/p350
TARGET_KERNEL_CONFIG := cyanogenmod_p350_defconfig
BOARD_KERNEL_CMDLINE := mem=215M console=ttyMSM2,115200n8 androidboot.hardware=p350
COMMON_GLOBAL_CFLAGS += -DBOARD_CHARGING_CMDLINE_NAME='"lge.reboot"' -DBOARD_CHARGING_CMDLINE_VALUE='"pwroff"'
BOARD_KERNEL_BASE := 0x02808000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00440000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0c800000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0bd80000
BOARD_FLASH_BLOCK_SIZE := 131072

# BOOTANIMATION
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_USE_RGB565 := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Graphic
BOARD_USE_SKIA_LCDTEXT := true
BOARD_USE_ADRENO_200_GPU := true
TARGET_USES_C2D_COMPOSITION := false
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
TARGET_NO_HW_VSYNC := true
TARGET_USES_HWC_FENCE_SYNC := true
TARGET_USE_OVERLAY := false
TARGET_HAVE_BYPASS := false
TARGET_USES_SF_BYPASS := false
USE_OPENGL_RENDERER := true
TARGET_NO_HW_OVERLAY := true
BOARD_HAVE_HDMI_SUPPORT := false
TARGET_USES_ION := false
BOARD_EGL_NEEDS_LEGACY_FB := true
BOARD_NO_RGBX_8888 := true
BOARD_EGL_CFG := device/lge/p350/configs/egl.cfg

# CFLAGS
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DTARGET_MSM7x27
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK -DANCIENT_GL
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS += -DMISSING_GRALLOC_BUFFERS
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT

# small fonts
SMALLER_FONT_FOOTPRINT := true

# sensors
TARGET_USES_OLD_LIBSENSORS_HAL:=true

# Recovery
BOARD_LDPI_RECOVERY := true
BOARD_HAS_JANKY_BACKBUFFER := true
BOARD_USE_CUSTOM_RECOVERY_FONT := '"font_7x16.h"'
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
BOARD_CUSTOM_GRAPHICS := ../../../device/lge/p350/recovery/graphics.c
TARGET_RECOVERY_FSTAB := device/lge/p350/root/fstab.p350

# Audio
BOARD_USES_AUDIO_LEGACY := false
TARGET_PROVIDES_LIBAUDIO := true
BOARD_COMBO_DEVICE_SUPPORTED := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/p350/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/lge/p350/bluetooth/vnd_p350.txt

# Enable the GPS HAL & AMSS version to use for GPS
BOARD_GPS_LIBRARIES := libgps librpc
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
TARGET_QCOM_GPS_VARIANT := legacy
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := p350
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE_LEGACY := msm7x27


# Lights
TARGET_PROVIDES_LIBLIGHTS := true

# Qcom 
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_HARDWARE := true

# RIL
TARGET_PROVIDES_LIBRIL := true

# powerhal
TARGET_PROVIDES_POWERHAL := true

# USB mass storage
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun/file

# Wi-Fi & Wi-Fi HotSpot
WPA_SUPPLICANT_VERSION          := VER_0_8_X
BOARD_WLAN_DEVICE               := bcm4329
BOARD_WEXT_NO_COMBO_SCAN        := true
BOARD_WPA_SUPPLICANT_DRIVER     := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WIFI_DRIVER_HAS_LGE_SOFTAP      := true
WIFI_DRIVER_MODULE_PATH         := "/system/lib/modules/wireless.ko"
WIFI_DRIVER_MODULE_ARG          := "firmware_path=/etc/wl/rtecdc.bin nvram_path=/etc/wl/nvram.txt config_path=/data/misc/wifi/config"
WIFI_DRIVER_MODULE_NAME         := "wireless"
WIFI_DRIVER_FW_PATH_STA         := "/system/etc/wl/rtecdc.bin"
WIFI_DRIVER_FW_PATH_AP          := "/system/etc/wl/rtecdc-apsta.bin"

# Browser & WebKit
JS_ENGINE := v8
HTTP := chrome
WITH_JIT := true
ENABLE_JSC_JIT := true
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

## Radio fixes
BOARD_RIL_CLASS := ../../../device/lge/p350/ril/

# Touch screen compatibility for jellybean
BOARD_USE_LEGACY_TOUCHSCREEN := true

## OTA script extras file (build/tools/releasetools)
TARGET_OTA_EXTRAS_FILE := device/lge/p350/releasetools/extras.txt
