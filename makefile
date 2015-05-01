#
# Makefile for optimus g
#

# The original zip file, MUST be specified by each product
local-zip-file     := stockrom.zip

# The output zip file of MIUI rom, the default is porting_miui.zip if not specified
local-out-zip-file := MIUI_gee.zip

# All apps from original ZIP, but has smali files chanded
local-modified-apps :=

local-density := XHDPI

PORT_PRODUCT := gee_justin

local-miui-modified-apps := MiuiFramework SecurityCenter

local-phone-apps := Camera2 Bluetooth HTMLViewer KeyChain LatinIME PacProcessor \
        UserDictionaryProvider WAPPushManager

local-phone-priv-apps := BackupRestoreConfirmation DefaultContainerService FusedLocation \
        ExternalStorageProvider InputDevices OneTimeInitializer ProxyHandler SharedStorageBackup \
        Shell Tag VpnDialogs

# To include the local targets before and after zip the final ZIP file, 
# and the local-targets should:
# (1) be defined after including porting.mk if using any global variable(see porting.mk)
# (2) the name should be leaded with local- to prevent any conflict with global targets
local-pre-zip := local-pre-zip-misc
local-after-zip:= local-test

# The local targets after the zip file is generated, could include 'zip2sd' to 
# deliver the zip file to phone, or to customize other actions

include $(PORT_BUILD)/porting.mk

# To define any local-target
local-zip-misc:

local-pre-zip-misc:
	@echo boot.img
	cp other/boot.img $(ZIP_DIR)/boot.img

	@echo system
	cp -a -rf other/system/* $(ZIP_DIR)/system/