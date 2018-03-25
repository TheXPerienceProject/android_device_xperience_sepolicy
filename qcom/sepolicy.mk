#
# This policy configuration will be used by all products that
# inherit from Lineage
#

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/xperience/sepolicy/qcom/private

BOARD_SEPOLICY_DIRS += \
    device/xperience/sepolicy/qcom \
    device/xperience/sepolicy/qcom/$(TARGET_BOARD_PLATFORM)
