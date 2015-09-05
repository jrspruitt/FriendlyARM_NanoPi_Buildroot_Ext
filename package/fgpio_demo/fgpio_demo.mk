################################################################################
#
# FGPIO_DEMO 
#
################################################################################

FGPIO_DEMO_VERSION = master 
FGPIO_DEMO_SITE = $(call github,jrspruitt,FriendlyARM_NanoPi_Qt_GPIO_Demo,$(FGPIO_DEMO_VERSION))
FGPIO_DEMO_LICENSE = MIT
FGPIO_DEMO_LICENSE_FILES = LICENSE
FGPIO_DEMO_DEPENDENCIES = qapplauncher


define FGPIO_DEMO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/opt/fgpio_demo
	cp -dpfr $(BR2_EXTERNAL)/package/fgpio_demo/logo.png $(TARGET_DIR)/opt/fgpio_demo/logo.png
	cp -dpfr $(@D)/run_demo.py $(TARGET_DIR)/opt/fgpio_demo/run_demo.py
	cp -dpfr $(@D)/demo_ui.py $(TARGET_DIR)/opt/fgpio_demo/demo_ui.py
	python $(BR2_EXTERNAL)/package/qapplauncher/qapp_adder.py $(TARGET_DIR) /opt/QAppConfig/settings/default.ini /opt/fgpio_demo/run_demo.py
endef

$(eval $(generic-package))
