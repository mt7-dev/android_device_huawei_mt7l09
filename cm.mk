# Release name
PRODUCT_RELEASE_NAME := mt7l09

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/mt7l09/device_mt7l09.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mt7l09
PRODUCT_NAME := cm_mt7l09
PRODUCT_BRAND := huawei
PRODUCT_MODEL := mt7l09
PRODUCT_MANUFACTURER := huawei
