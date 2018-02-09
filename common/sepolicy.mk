#
# This policy configuration will be used by all products that
# inherit from XPerience taken from Lineage
#

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/xperience/sepolicy/common/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/xperience/sepolicy/common/private

BOARD_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/vendor
