Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp572707lfc;
        Mon, 2 Dec 2019 13:43:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqyW4/h5m0ZO3KvHPfxUv3ae7mlL5abz+7q0wH33AHD6HEVfkBcsAtEe2Tjv20XkJFOvXjZe
X-Received: by 2002:aa7:da03:: with SMTP id r3mr1415750eds.163.1575323014387;
        Mon, 02 Dec 2019 13:43:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575323014; cv=none;
        d=google.com; s=arc-20160816;
        b=OVuKSnRmyk+wXdU72Xblo9FCTMF9p2ZSHWyPzBHPcCpuFrjNjvXC0POMW8TkciUOEl
         rMH2q6N4AdRLIwKNhygcO4P0nyDThW0eagjt6NwbVh1An8A9nwgOE+CxOpY7Vi6Gox9o
         m6l62yExJ8F+i4HuCkHzB7TYjIkcPvr1Q7fQkp30aP/+OS/gstRVEjK9+0gezs9xSHgT
         57ZnNPFTg3raG9fF6gTDOa4ojS9+bcfShgoJLatJmONUNuxGQdomcgKFU1ATKlhICGnb
         mfAGNT3f74TvNlKKTBkJf4wu0e1673lO1coUEnyiEv1Np7svsve9KvXDDIRBPeJ5TcvR
         Jn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=LEn9j1X544VOGdDqcFyPUsPjhPLUxtiH/o0b4RFTF1E=;
        b=PLuZOwU+EDVGttXeV0/g4baiTRhGRWmu7C3V29px0j3gCXzw+YtE1G/PTvdZCrkvFO
         j+K6Shu9T24mokKX5Wjm1z/wN16d5BJpAJGAyRPxKxw6nz2eYJOlywE7AgYBsJIx22xl
         xMEBX+n8PewShMq6ui/mEURC6S4ZtxwdSEtLWNvo8z9onQwf8yuqvmwZb+RJimuJEm9H
         l1bC17PmFEP6tkfZSxa/ywpULuAwbDFX/7Hr/sjGBQ5KOZpHCK8Q8V5ahxCF9eqvYIBM
         WjHwUBBYKuIBvnfSYgEJjbSMYWUedtb4RvGafKRK4V8FH+z/Rlq29AZFfpE/cK4SfKhd
         X3Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hEMvku+H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si787194edj.194.2019.12.02.13.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 13:43:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hEMvku+H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibtTg-00084L-JF
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 16:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38173)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1ibsxR-0002b5-Bq
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 16:10:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1ibsxN-0000cI-Hc
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 16:10:12 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33854)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1ibsxK-0000Y6-El; Mon, 02 Dec 2019 16:10:06 -0500
Received: by mail-wm1-x342.google.com with SMTP id f4so775853wmj.1;
 Mon, 02 Dec 2019 13:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LEn9j1X544VOGdDqcFyPUsPjhPLUxtiH/o0b4RFTF1E=;
 b=hEMvku+HxXFrtCH1xtIajvdSr/C+PUBdv2Fet/yl+OwJEbRXojjQzZY014UAZoucjp
 VFhhRPLXdj62/117gVf8gOMHUB6iPUHYBZWi84cMlPXKoS1XITnKtaGVcCg4zjSLJ7O+
 8cd58bxvixqVo9NDEEfukoldTpx1HVpo5+qeR7CZOTKcputw/BEw3XYmQtbt96Bh0Vzw
 sHQR7jI4/5wyvBksLF96tCXh8wc3IihTX64o/GMI0hbAjhynh28rleB7zL8J5R6qvWDU
 BDy5r0GwV5r9aQ+KwiKBCVYHFffS5BL0kk3bJYuJWcs3oh6bXXOW4kQpkoE3qs4BaYuG
 sAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LEn9j1X544VOGdDqcFyPUsPjhPLUxtiH/o0b4RFTF1E=;
 b=bizGrgq9RaVWRGbNwpOYeWHkoCNJ3bAV30vNFCQlhKlcVN7rDllv/O/H7APBtjupxh
 aBKhW0hzOY210SzpABn48CIYFY2PfyOxG+D+aTYq6dKUlst3kVCkNjdRxkTqY5IbItEC
 2y5Ferqwj6O47ZEI0XP8POhxu98OUpSAQm/elwy4G8jN/MI3R+Ioo6qlJfzINpcB3C9y
 UsvnKjzpc6biFami8e7e69OFk52VVI5owvr2jPl44Oi/f+H17mv+2py86LQrbF565UiU
 lxUB+cn4Z+bC3QQzjtd+yUAW8lJu/yPp8a+3xGKjqvD9b2CrB7/Q3ObHDJiP/G/M9XWW
 94vw==
X-Gm-Message-State: APjAAAXNj86efFF7iZEJdV/z8VnRSmsz1IYC314i2xwQC8HaCTYpKA9g
 b2D8YjQw/6FzOHSHv99l3tZGB2ha
X-Received: by 2002:a7b:ce19:: with SMTP id m25mr11697248wmc.6.1575320996724; 
 Mon, 02 Dec 2019 13:09:56 -0800 (PST)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id f1sm770859wrp.93.2019.12.02.13.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 13:09:56 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/10] Add Allwinner H3 SoC and Orange Pi PC Machine
Date: Mon,  2 Dec 2019 22:09:37 +0100
Message-Id: <20191202210947.3603-1-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-Mailman-Approved-At: Mon, 02 Dec 2019 16:38:21 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: b.galvani@gmail.com, peter.maydell@linaro.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bRW8Z7A0HOxY

Dear QEMU developers,

Hereby I would like to contribute the following set of patches to QEMU
which add support for the Allwinner H3 System on Chip and the
Orange Pi PC machine. The following features and devices are supported:

 * SMP (Quad Core Cortex A7)
 * Generic Interrupt Controller configuration
 * SRAM mappings
 * Timer device (re-used from Allwinner A10)
 * UART
 * SD/MMC storage controller
 * EMAC ethernet connectivity
 * USB 2.0 interfaces
 * Clock Control Unit
 * System Control module
 * Security Identifier device

Functionality related to graphical output such as HDMI, GPU,
Display Engine and audio are not included. Recently released
mainline Linux kernels (4.19 up to latest master) and mainline U-Boot
are known to work. The SD/MMC code is tested using bonnie++ and
various tools such as fsck, dd and fdisk. The EMAC is verified with iperf3
using -netdev socket.

To build a Linux mainline kernel that can be booted by the Orange Pi PC
machine, simply configure the kernel using the sunxi_defconfig configuration:
 $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make mrproper
 $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make sunxi_defconfig

To be able to use USB storage, you need to manually enable the corresponding
configuration item. Start the kconfig configuration tool:
 $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make menuconfig

Navigate to the following item, enable it and save your configuration:
 Device Drivers > USB support > USB Mass Storage support

Build the Linux kernel with:
 $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j5

To boot the newly build linux kernel in QEMU with the Orange Pi PC machine, use:
 $ qemu-system-arm -M orangepi -m 512 -nic user -nographic \
     -kernel /path/to/linux/arch/arm/boot/zImage \
     -append 'console=ttyS0,115200' \
     -dtb /path/to/linux/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dtb

Note that this kernel does not have a root filesystem. You may provide it
with an official Orange Pi PC image [1] either as an SD card or as
USB mass storage. To boot using the Orange Pi PC Debian image on SD card,
simply add the -sd argument and provide the proper root= kernel parameter:
 $ qemu-system-arm -M orangepi -m 512 -nic user -nographic \
     -kernel /path/to/linux/arch/arm/boot/zImage \
     -append 'console=ttyS0,115200 root=/dev/mmcblk0p2' \
     -dtb /path/to/linux/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dtb \
     -sd OrangePi_pc_debian_stretch_server_linux5.3.5_v1.0.img

Alternatively, you can also choose to build and boot a recent buildroot [2]
using the orangepi_pc_defconfig or Armbian image [3] for Orange Pi PC.
To attach an USB mass storage device to the machine, simply append to the command:
 -drive if=none,id=stick,file=myimage.img \
 -device usb-storage,bus=usb-bus.0,drive=stick

U-Boot mainline can be build and configured using the orangepi_pc_defconfig
using similar commands as describe above for Linux. To start U-Boot using
the Orange Pi PC machine, provide the u-boot binary to the -kernel argument:
 $ qemu-system-arm -M orangepi -m 512 -nic user -nographic \
     -kernel /path/to/uboot/u-boot -sd disk.img

Use the following U-boot commands to load and boot a Linux kernel from SD card:
 -> setenv bootargs console=ttyS0,115200
 -> ext2load mmc 0 0x42000000 zImage
 -> ext2load mmc 0 0x43000000 sun8i-h2-plus-orangepi-zero.dtb
 -> bootz 0x42000000 - 0x43000000

Looking forward to your review comments. I will do my best
to update the patches where needed.

With kind regards,

Niek Linnenbank

[1] http://www.orangepi.org/downloadresources/
[2] https://buildroot.org/download.html
[3] https://www.armbian.com/orange-pi-pc/

Niek Linnenbank (10):
  hw: arm: add Allwinner H3 System-on-Chip
  hw: arm: add Xunlong Orange Pi PC machine
  arm: allwinner-h3: add Clock Control Unit
  arm: allwinner-h3: add USB host controller
  arm: allwinner-h3: add System Control module
  arm/arm-powerctl: set NSACR.{CP11,CP10} bits in arm_set_cpu_on()
  arm: allwinner-h3: add CPU Configuration module
  arm: allwinner-h3: add Security Identifier device
  arm: allwinner-h3: add SD/MMC host controller
  arm: allwinner-h3: add EMAC ethernet device

 MAINTAINERS                           |   8 +
 default-configs/arm-softmmu.mak       |   1 +
 hw/arm/Kconfig                        |   9 +
 hw/arm/Makefile.objs                  |   1 +
 hw/arm/allwinner-h3.c                 | 316 ++++++++++
 hw/arm/orangepi.c                     | 114 ++++
 hw/misc/Makefile.objs                 |   4 +
 hw/misc/allwinner-h3-clk.c            | 227 ++++++++
 hw/misc/allwinner-h3-cpucfg.c         | 280 +++++++++
 hw/misc/allwinner-h3-sid.c            | 162 ++++++
 hw/misc/allwinner-h3-syscon.c         | 139 +++++
 hw/misc/trace-events                  |   5 +
 hw/net/Kconfig                        |   3 +
 hw/net/Makefile.objs                  |   1 +
 hw/net/allwinner-h3-emac.c            | 786 +++++++++++++++++++++++++
 hw/net/trace-events                   |  10 +
 hw/sd/Makefile.objs                   |   1 +
 hw/sd/allwinner-h3-sdhost.c           | 791 ++++++++++++++++++++++++++
 hw/sd/trace-events                    |   7 +
 hw/usb/hcd-ehci-sysbus.c              |  17 +
 hw/usb/hcd-ehci.h                     |   1 +
 include/hw/arm/allwinner-h3.h         | 130 +++++
 include/hw/misc/allwinner-h3-clk.h    |  41 ++
 include/hw/misc/allwinner-h3-cpucfg.h |  44 ++
 include/hw/misc/allwinner-h3-sid.h    |  42 ++
 include/hw/misc/allwinner-h3-syscon.h |  43 ++
 include/hw/net/allwinner-h3-emac.h    |  69 +++
 include/hw/sd/allwinner-h3-sdhost.h   |  73 +++
 target/arm/arm-powerctl.c             |   3 +
 29 files changed, 3328 insertions(+)
 create mode 100644 hw/arm/allwinner-h3.c
 create mode 100644 hw/arm/orangepi.c
 create mode 100644 hw/misc/allwinner-h3-clk.c
 create mode 100644 hw/misc/allwinner-h3-cpucfg.c
 create mode 100644 hw/misc/allwinner-h3-sid.c
 create mode 100644 hw/misc/allwinner-h3-syscon.c
 create mode 100644 hw/net/allwinner-h3-emac.c
 create mode 100644 hw/sd/allwinner-h3-sdhost.c
 create mode 100644 include/hw/arm/allwinner-h3.h
 create mode 100644 include/hw/misc/allwinner-h3-clk.h
 create mode 100644 include/hw/misc/allwinner-h3-cpucfg.h
 create mode 100644 include/hw/misc/allwinner-h3-sid.h
 create mode 100644 include/hw/misc/allwinner-h3-syscon.h
 create mode 100644 include/hw/net/allwinner-h3-emac.h
 create mode 100644 include/hw/sd/allwinner-h3-sdhost.h

-- 
2.17.1

