################################################################################
#
# qapplauncher 
#
################################################################################

QAPPLAUNCHER_VERSION = master 
QAPPLAUNCHER_SITE = $(call github,jrspruitt,QAppLauncher,$(QAPPLAUNCHER_VERSION))
QAPPLAUNCHER_LICENSE = MIT
QAPPLAUNCHER_LICENSE_FILES = LICENSE
QAPPLAUNCHER_DEPENDENCIES = qt tslib

ifeq ($(BR2_PACKAGE_QAPPLAUNCHER_LCD35),y)
BR2_QAPPLAUNCHER_LCD="export QWS_DISPLAY=LinuxFB:mmWidth=70:mmHeight=55"
else ifeq ($(BR2_PACKAGE_QAPPLAUNCHER_LCD43),y)
BR2_QAPPLAUNCHER_LCD="export QWS_DISPLAY=LinuxFB:mmWidth=95:mmHeight=55"
else ifeq ($(BR2_PACKAGE_QAPPLAUNCHER_LCD7),y)
BR2_QAPPLAUNCHER_LCD="export QWS_DISPLAY=LinuxFB:mmWidth=155:mmHeight=85"
endif

define QAPPLAUNCHER_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QAPPLAUNCHER_INSTALL_TARGET_CMDS
	cp -dpfr $(@D)/QAppLauncher $(TARGET_DIR)/opt/QAppLauncher
	cp -dpfr $(@D)/QAppConfig $(TARGET_DIR)/opt
	$(INSTALL) -m 0755 -D $(BR2_EXTERNAL)/package/qapplauncher/S70QAppLauncher $(TARGET_DIR)/etc/init.d/S70QAppLauncher
	mkdir -p $(TARGET_DIR)/etc/profile.d/
	$(INSTALL) -m 0755 -D $(BR2_EXTERNAL)/package/qapplauncher/qapplauncher.sh $(TARGET_DIR)/etc/profile.d/qapplauncher.sh
	echo $(BR2_QAPPLAUNCHER_LCD) >> $(TARGET_DIR)/etc/profile.d/qapplauncher.sh
endef

define QAPPLAUNCHER_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) $(QT_QMAKE)) 
endef


$(eval $(generic-package))
