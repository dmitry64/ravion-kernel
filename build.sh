#!/bin/sh

export CROSS_COMPILE=armv7a-neon-linux-gnueabi-
export ARCH=arm
export ROOT_FS_PATH=/cimc/root/armv7a-neon/exports
export TFTP_FS_PATH=/cimc/exporttftp
export DEF_TARGET="zImage modules vf500-colibri-ravion.dtb vf610-colibri-ravion.dtb"
export DEF_ARGS="-j3 ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} \
INSTALL_MOD_PATH=${ROOT_FS_PATH}"
export SUDO=sudo

if [ -z "$*" ]; then
    [ -f .config ] || make ${DEF_ARGS} ravion_vf_defconfig
    make ${DEF_ARGS} ${DEF_TARGET}
    echo -n Cleanup old modules...
    ${SUDO} rm -rf ${ROOT_FS_PATH}/lib/modules/* && echo OK || echo FAIL
    ${SUDO} make ${DEF_ARGS} modules_install
    echo install kernel into rootfs and tftp
    ${SUDO} cp -f arch/arm/boot/zImage ${ROOT_FS_PATH}/boot/zImage
    ${SUDO} cp -f arch/arm/boot/dts/vf500-colibri-ravion.dtb ${ROOT_FS_PATH}/boot/vf500.dtb
    ${SUDO} cp -f arch/arm/boot/dts/vf610-colibri-ravion.dtb ${ROOT_FS_PATH}/boot/vf610.dtb
    ${SUDO} cp -f arch/arm/boot/zImage ${TFTP_FS_PATH}/boot/zImage
    ${SUDO} cp -f arch/arm/boot/dts/vf500-colibri-ravion.dtb ${TFTP_FS_PATH}/boot/vf500.dtb
    ${SUDO} cp -f arch/arm/boot/dts/vf610-colibri-ravion.dtb ${TFTP_FS_PATH}/boot/vf610.dtb
else
    make ${DEF_ARGS} $*
fi
