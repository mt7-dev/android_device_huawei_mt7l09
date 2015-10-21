# Release name
PRODUCT_RELEASE_NAME := hwmt7_l09

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/hwmt7_l09/device_hwmt7_l09.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := hwmt7_l09
PRODUCT_NAME := cm_hwmt7_l09
PRODUCT_BRAND := huawei
PRODUCT_MODEL := hwmt7_l09
PRODUCT_MANUFACTURER := huawei
