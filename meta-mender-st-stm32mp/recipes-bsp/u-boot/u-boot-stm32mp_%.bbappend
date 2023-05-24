FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

require recipes-bsp/u-boot/u-boot-mender.inc

SRC_URI:append:mender-uboot = " \
            file://0001-u-boot-config-for-mender-layer.patch \
            file://0001-mender-config-in-stm32mp15_defconfig.patch \
            file://1004-disable-config-is-nowhere-sanity-check.patch \
            "


MENDER_UBOOT_AUTO_CONFIGURE = "0"

# NOTE: It's been our experience that BOOTENV_SIZE actually needs to
# be defined in your MACHINE conf file in order for it to be correct in
# the mender-generated fw_env.config file
# 16k
BOOTENV_SIZE = "0x4000"

DEPENDS:append = " stm32mp-uboot-scr"

# Upstream PR: https://github.com/STMicroelectronics/meta-st-stm32mp/pull/11
PROVIDES += "u-boot"
RPROVIDES:${PN} += "u-boot"

