################################################################################
#
# fgpio
#
################################################################################

PYFA_GPIO_VERSION = master 
PYFA_GPIO_SITE = $(call github,jrspruitt,pyfa_gpio,$(PYFA_GPIO_VERSION))
PYFA_GPIO_SETUP_TYPE = setuptools
PYFA_GPIO_LICENSE = MIT
PYFA_GPIO_LICENSE_FILES = LICENCE

$(eval $(python-package))
