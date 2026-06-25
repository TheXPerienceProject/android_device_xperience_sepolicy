#
# This policy configuration will be used by all products that
# inherit from Lineage
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/private

ifeq ($(filter tokay caiman komodo comet tegu frankel blazer mustang rango, $(XPERIENCE_BUILD)),)
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/lineage/sepolicy/mosey/system_ext/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/lineage/sepolicy/mosey/system_ext/private

BOARD_VENDOR_SEPOLICY_DIRS += \
    device/lineage/sepolicy/mosey/vendor
endif

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/dynamic \
    device/xperience/sepolicy/common/system
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/dynamic \
    device/xperience/sepolicy/common/vendor
endif

# Include atv rules on atv product
ifeq ($(PRODUCT_IS_ATV), true)
include device/xperience/sepolicy/atv/sepolicy.mk
endif

ifeq ($(TARGET_BOARD_PLATFORM),lahaina)
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/lahaina
endif

# FEAS 
ifeq ($(filter mt%,$(TARGET_BOARD_PLATFORM)),)
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/feas
endif

ifeq ($(filter xperience_sdk_%,$(TARGET_PRODUCT)),)
include packages/apps/GameSpace/sepolicy/SEPolicy.mk
else
$(warning GameSpace sepolicy disabled for $(TARGET_PRODUCT))

endif
