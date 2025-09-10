#
# This policy configuration will be used by all products that
# inherit from xperience
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
ifeq ($(TARGET_HAS_FUSEBLK_SEPOLICY_ON_VENDOR),true)
BOARD_SEPOLICY_M4DEFS += board_excludes_fuseblk_sepolicy=true
endif
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/private

# those are for qcom only
ifeq ($(filter mt%,$(TARGET_BOARD_PLATFORM)),)
$(warning "It's QCOM ")
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/private_qcom

BOARD_VENDOR_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/vendor_qcom
endif

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/dynamic \
    device/xperience/sepolicy/common/system
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/dynamic \
    device/xperience/sepolicy/common/vendor

ifeq (,$(filter sdm660 mt%, $(TARGET_BOARD_PLATFORM)))
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/dontaudit
endif

ifeq ($(filter mt% $(UM_6_1_FAMILY) $(UM_6_6_FAMILY) ,$(TARGET_BOARD_PLATFORM)),)
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/perf2_legacy

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS+= \
    device/xperience/sepolicy/common/perf2_legacy_private
endif

ifeq ($(TARGET_BOARD_PLATFORM),lahaina)
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/xperience/sepolicy/common/perf2_lahaina
endif
endif

# Selectively include legacy rules defined by the products
-include device/xperience/sepolicy/legacy-common/sepolicy.mk
-include packages/apps/GameSpace/sepolicy/SEPolicy.mk
