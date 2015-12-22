################################################################################
#
# Broadcom Bluetooth 
#
################################################################################

BROADCOM_BLUETOOTH_VERSION = master
BROADCOM_BLUETOOTH_SITE = $(call github,ARMWorks,broadcom-bluetooth,$(BROADCOM_BLUETOOTH_VERSION))
BROADCOM_BLUETOOTH_LICENSE = APACHE-2.0

define BROADCOM_BLUETOOTH_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) $(@D)/brcm_patchram_plus.c -o $(@D)/brcm_patchram_plus
endef

define BROADCOM_BLUETOOTH_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/brcm_patchram_plus $(TARGET_DIR)/usr/bin/brcm_patchram_plus
endef

$(eval $(generic-package))
