TARGET := iphone:clang:16.5:14.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AppEnumFix

AppEnumFix_FILES = Tweak.xm
AppEnumFix_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
