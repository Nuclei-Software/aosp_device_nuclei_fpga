
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
USE_OEM_TV_APP := true
$(call inherit-product, device/google/atv/products/atv_base.mk)

PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := relaxed

PRODUCT_NAME := fpga
PRODUCT_DEVICE := fpga
PRODUCT_BRAND := Android
PRODUCT_MODEL := AOSP on nuclei_fpga
PRODUCT_MANUFACTURER := nuclei


include frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk

PRODUCT_SYSTEM_PROPERTIES += \
    config.disable_renderscript=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.apex.updatable=false \
    dalvik.vm.usejit=false \
    ro.hw_timeout_multiplier=8 \
    debug.drm.mode.force=640x480 \
    gralloc.drm.kms=/dev/dri/card0 \
    ro.opengles.version=131072 \
    ro.hardware.egl=mesa

# application packages
PRODUCT_PACKAGES += \
    TvSettingsTwoPanel \
    DeskClock \
    RpLauncher

# overlay packages
PRODUCT_PACKAGES += \
    RvFrameworkOverlay

# system packages
PRODUCT_PACKAGES += \
    memtrack.fpga \
    audio.primary.fpga \
    audio.usb.default

# graphics hal
PRODUCT_PACKAGES += \
    libEGL_mesa \
    libGLESv1_CM_mesa \
    libGLESv2_mesa \
    libgallium_dri \
    libglapi

# hardware/interfaces
PRODUCT_PACKAGES += \
    hwservicemanager \
    android.hardware.graphics.allocator@2.0-service.fpga \
    android.hardware.graphics.mapper@2.0-impl.fpga \
    android.hardware.graphics.composer@2.1-service.fpga \
    android.hardware.audio@5.0-impl \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.audio.service \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service \
    android.hardware.gatekeeper@1.0-service.software \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl \
    android.hardware.health.storage@1.0-service \
    android.hardware.wifi@1.0-service \
    android.hardware.configstore@1.1-service \
    android.hardware.tv.cec@1.0-service.mock \
    vndservicemanager

# system configurations
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    $(LOCAL_PATH)/init.fpga.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/init.fpga.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.fpga.rc \
    $(LOCAL_PATH)/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc \
    $(LOCAL_PATH)/fstab.fpga:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.fpga \
    $(LOCAL_PATH)/fstab.fpga:$(TARGET_COPY_OUT_RAMDISK)/fstab.fpga \
    $(LOCAL_PATH)/Generic.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/displayconfig/default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/default.xml \
    $(PRODUCT_COPY_FILES)

# media configurations
PRODUCT_COPY_FILES := \
    device/generic/goldfish/camera/media/profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    device/generic/goldfish/camera/media/codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    frameworks/av/media/libeffects/data/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/base/data/sounds/effects/ogg/Effect_Tick_48k.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/Effect_Tick.ogg \
    frameworks/base/data/sounds/effects/ogg/camera_click_48k.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/camera_click.ogg \
    $(PRODUCT_COPY_FILES)

PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_CHARACTERISTICS := tv

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
