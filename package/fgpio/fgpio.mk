################################################################################
#
# fgpio
#
################################################################################

FGPIO_VERSION = master 
FGPIO_SITE = $(call github,jrspruitt,FriendlyARM_Python_GPIO,$(FGPIO_VERSION))
FGPIO_SETUP_TYPE = setuptools
FGPIO_LICENSE = MIT
FGPIO_LICENSE_FILES = LICENCE

$(eval $(python-package))
