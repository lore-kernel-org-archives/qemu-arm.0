Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1226788lfc;
        Tue, 10 Mar 2020 14:32:28 -0700 (PDT)
X-Received: by 2002:a05:600c:2252:: with SMTP id a18mr4190258wmm.51.1583875948717;
        Tue, 10 Mar 2020 14:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583875948; cv=none;
        d=google.com; s=arc-20160816;
        b=CLy9yalvQAyCeaN4UqdrdGiqY0Z0tZdmFwvahiohC+e8tA8ABSPfUOjHo1DKH4ameO
         p/IbQtTl1YgEnI89Cno/8taFllqXPCl69SrW+BjOu8cgzR/PICPlxKGep48In3DC33/a
         nLqwhAA3wpyOx1m2H1XgQqp8qViTCmUctZ1XcFTyRAW7CwJyj5PjX/zhnOcFiRP9rx1g
         MY6+mfrhQyNxxDdDDL1fAsjjfsJwuaSA+b5S+XWrUk4YgHBXXA+fx92yjCMTuHriCSvt
         dBmmnfSsXSotVA4JF6EasKpcgd4wC2TxovzeGb8yJZ+fYnEGCMNbB5gjItXezmRsSQW9
         IgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=YmGrnjYeYbZzqcz943Oy96YZqsDm5ccNRmga3bJWcmk=;
        b=c14C27CiSzc1RpssOMVEoT/rGd65XXU3W3tJ1zs1bwdwMHPpQR+5NkgACTirPPEwA1
         66R2jOZxPmAwPSoEzhxkfnl2sJiGaH++8TwTZ+yf4thYfRbKVH/o+t/Zgs8shsWzp0hH
         +wzHxaF/eq+m7q5LHyaEc19hH741HLXb27Fdw1gy/1b9pZbcRr77Xjf/kRMaevQK5+Zj
         fujrIj0nVr09Ibeoh34KSPK7HMqxAdGDtMBoe5ASuFIkxUqs/J+nN4gWCmVOC0ZT1c9q
         dWnRkbhIThi59cB0iIOXeRHa7nBudi6CfwTEhEB0WURlSPzgFiem2WFR/m+urkn+wa84
         rkpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=In1Z4ATH;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g202sor2668256wmg.24.2020.03.10.14.32.28
        (Google Transport Security);
        Tue, 10 Mar 2020 14:32:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=In1Z4ATH;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YmGrnjYeYbZzqcz943Oy96YZqsDm5ccNRmga3bJWcmk=;
        b=In1Z4ATHsz8yNm1pBrvuvfthvRuNWGX25XTkeqZ3fEo0ftZA3DqjuYnKMURsosKGML
         Elmsu/80yusKPZM8jlUh9mkPzCV1AXhps38twcUBqtypBaBOaitgkD2OoSDf+1ikiPqS
         +vCigNoFzAMQvyKE2yKm0aY8YVKYaaJALfw75rfTf+I9Xu7wuuIs7Lb+N55IPvSYsfoI
         k3CZcMudfqBr/lXUMFoOtXINKeUKewfLm+XxaTeZBprbMlrFqhrHBY2GUAO3O6X4JTRJ
         84iQRW5lBwk2eMIRFJT1BqmttYCMPjpgg9hI7e3Mu9s5mzhboxa42ii4wdvmW8bwfRdS
         +cMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YmGrnjYeYbZzqcz943Oy96YZqsDm5ccNRmga3bJWcmk=;
        b=OFt8o8J4oWO6PvD+p1D8RifG2CkzjFu+31OqxnRv6UF1S7AxryQtuavZtwoFnGR6xP
         vBn/VWaHtF4e33CR9KpiHtFDFGPclJK1BElFa6u51TGsyP/R/kXQQ2y7+Ayc5PEfgmkL
         r6t2fvgRb52CQp4HlT58TIah4m1OLcA4pGRdqfKI+ePO145hdGinlzMglUt/xKxTCKh3
         j1n4NE+Pirsz0RoP3aL7vp4DUOWTvdmsB3absdZZEOuEOLcCEeJ/H3gz8/bxoSBXWI87
         DBByKgr8N2262H1xmiOGqwj+FMkMhanmNypKUCELeAyFbvmqHGUKYnyQUo4vYfn5Qf/1
         3NsQ==
X-Gm-Message-State: ANhLgQ3cs2lPTCEPH4x74SbJ1Wm6CYDQN2ZRD95opFEKvvu0bwsF+RkT
	SioBpPqBI032aJQCkmSQFPs=
X-Google-Smtp-Source: ADFU+vvIzISG9WwClyN0WfNIcpC24lPjMzYgxrFa2tOTwiex5WY7WpooM9d1QdlymNkLAGajFnkr+Q==
X-Received: by 2002:a7b:cb42:: with SMTP id v2mr4135747wmj.170.1583875948059;
        Tue, 10 Mar 2020 14:32:28 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id 2sm32803580wrf.79.2020.03.10.14.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 14:32:27 -0700 (PDT)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	philmd@redhat.com,
	b.galvani@gmail.com,
	jasowang@redhat.com,
	alex.bennee@linaro.org,
	imammedo@redhat.com,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PATCH v7 18/18] docs: add Orange Pi PC document
Date: Tue, 10 Mar 2020 22:32:03 +0100
Message-Id: <20200310213203.18730-19-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310213203.18730-1-nieklinnenbank@gmail.com>
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
X-TUID: 466wkgr4BuCM

The Xunlong Orange Pi PC machine is a functional ARM machine
based on the Allwinner H3 System-on-Chip. It supports mainline
Linux, U-Boot, NetBSD and is covered by acceptance tests.

This commit adds a documentation text file with a description
of the machine and instructions for the user.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 docs/system/orangepi.rst   | 253 +++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst |   2 +
 MAINTAINERS                |   1 +
 3 files changed, 256 insertions(+)
 create mode 100644 docs/system/orangepi.rst

diff --git a/docs/system/orangepi.rst b/docs/system/orangepi.rst
new file mode 100644
index 0000000000..a76d52fb33
--- /dev/null
+++ b/docs/system/orangepi.rst
@@ -0,0 +1,253 @@
+Orange Pi PC Machine Type
+^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
+based embedded computer with mainline support in both U-Boot
+and Linux. The board comes with a Quad Core Cortex-A7 @ 1.3GHz,
+1GiB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
+various other I/O.
+
+Supported devices
+"""""""""""""""""
+
+The Orange Pi PC machine supports the following devices:
+
+ * SMP (Quad Core Cortex-A7)
+ * Generic Interrupt Controller configuration
+ * SRAM mappings
+ * SDRAM controller
+ * Real Time Clock
+ * Timer device (re-used from Allwinner A10)
+ * UART
+ * SD/MMC storage controller
+ * EMAC ethernet
+ * USB 2.0 interfaces
+ * Clock Control Unit
+ * System Control module
+ * Security Identifier device
+
+Limitations
+"""""""""""
+
+Currently, Orange Pi PC does *not* support the following features:
+
+- Graphical output via HDMI, GPU and/or the Display Engine
+- Audio output
+- Hardware Watchdog
+
+Also see the 'unimplemented' array in the Allwinner H3 SoC module
+for a complete list of unimplemented I/O devices: ``./hw/arm/allwinner-h3.c``
+
+Boot options
+""""""""""""
+
+The Orange Pi PC machine can start using the standard -kernel functionality
+for loading a Linux kernel or ELF executable. Additionally, the Orange Pi PC
+machine can also emulate the BootROM which is present on an actual Allwinner H3
+based SoC, which loads the bootloader from a SD card, specified via the -sd argument
+to qemu-system-arm.
+
+Machine-specific options
+""""""""""""""""""""""""
+
+The following machine-specific options are supported:
+
+- allwinner-rtc.base-year=YYYY
+
+  The Allwinner RTC device is automatically created by the Orange Pi PC machine
+  and uses a default base year value which can be overridden using the 'base-year' property.
+  The base year is the actual represented year when the RTC year value is zero.
+  This option can be used in case the target operating system driver uses a different
+  base year value. The minimum value for the base year is 1900.
+
+- allwinner-sid.identifier=abcd1122-a000-b000-c000-12345678ffff
+
+  The Security Identifier value can be read by the guest.
+  For example, U-Boot uses it to determine a unique MAC address.
+
+The above machine-specific options can be specified in qemu-system-arm
+via the '-global' argument, for example:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M orangepi-pc -sd mycard.img \
+       -global allwinner-rtc.base-year=2000
+
+Running mainline Linux
+""""""""""""""""""""""
+
+Mainline Linux kernels from 4.19 up to latest master are known to work.
+To build a Linux mainline kernel that can be booted by the Orange Pi PC machine,
+simply configure the kernel using the sunxi_defconfig configuration:
+
+.. code-block:: bash
+
+  $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make mrproper
+  $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make sunxi_defconfig
+
+To be able to use USB storage, you need to manually enable the corresponding
+configuration item. Start the kconfig configuration tool:
+
+.. code-block:: bash
+
+  $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make menuconfig
+
+Navigate to the following item, enable it and save your configuration:
+
+  Device Drivers > USB support > USB Mass Storage support
+
+Build the Linux kernel with:
+
+.. code-block:: bash
+
+  $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make
+
+To boot the newly build linux kernel in QEMU with the Orange Pi PC machine, use:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
+      -kernel /path/to/linux/arch/arm/boot/zImage \
+      -append 'console=ttyS0,115200' \
+      -dtb /path/to/linux/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dtb
+
+Orange Pi PC images
+"""""""""""""""""""
+
+Note that the mainline kernel does not have a root filesystem. You may provide it
+with an official Orange Pi PC image from the official website:
+
+  http://www.orangepi.org/downloadresources/
+
+Another possibility is to run an Armbian image for Orange Pi PC which
+can be downloaded from:
+
+   https://www.armbian.com/orange-pi-pc/
+
+Alternatively, you can also choose to build you own image with buildroot
+using the orangepi_pc_defconfig. Also see https://buildroot.org for more information.
+
+You can choose to attach the selected image either as an SD card or as USB mass storage.
+For example, to boot using the Orange Pi PC Debian image on SD card, simply add the -sd
+argument and provide the proper root= kernel parameter:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
+      -kernel /path/to/linux/arch/arm/boot/zImage \
+      -append 'console=ttyS0,115200 root=/dev/mmcblk0p2' \
+      -dtb /path/to/linux/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dtb \
+      -sd OrangePi_pc_debian_stretch_server_linux5.3.5_v1.0.img
+
+To attach the image as an USB mass storage device to the machine,
+simply append to the command:
+
+.. code-block:: bash
+
+  -drive if=none,id=stick,file=myimage.img \
+  -device usb-storage,bus=usb-bus.0,drive=stick
+
+Instead of providing a custom Linux kernel via the -kernel command you may also
+choose to let the Orange Pi PC machine load the bootloader from SD card, just like
+a real board would do using the BootROM. Simply pass the selected image via the -sd
+argument and remove the -kernel, -append, -dbt and -initrd arguments:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
+       -sd Armbian_19.11.3_Orangepipc_buster_current_5.3.9.img
+
+Note that both the official Orange Pi PC images and Armbian images start
+a lot of userland programs via systemd. Depending on the host hardware and OS,
+they may be slow to emulate, especially due to emulating the 4 cores.
+To help reduce the performance slow down due to emulating the 4 cores, you can
+give the following kernel parameters via U-Boot (or via -append):
+
+.. code-block:: bash
+
+  => setenv extraargs 'systemd.default_timeout_start_sec=9000 loglevel=7 nosmp console=ttyS0,115200'
+
+Running U-Boot
+""""""""""""""
+
+U-Boot mainline can be build and configured using the orangepi_pc_defconfig
+using similar commands as describe above for Linux. Note that it is recommended
+for development/testing to select the following configuration setting in U-Boot:
+
+  Device Tree Control > Provider for DTB for DT Control > Embedded DTB
+
+To start U-Boot using the Orange Pi PC machine, provide the
+u-boot binary to the -kernel argument:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
+      -kernel /path/to/uboot/u-boot -sd disk.img
+
+Use the following U-boot commands to load and boot a Linux kernel from SD card:
+
+.. code-block:: bash
+
+  => setenv bootargs console=ttyS0,115200
+  => ext2load mmc 0 0x42000000 zImage
+  => ext2load mmc 0 0x43000000 sun8i-h3-orangepi-pc.dtb
+  => bootz 0x42000000 - 0x43000000
+
+Running NetBSD
+""""""""""""""
+
+The NetBSD operating system also includes support for Allwinner H3 based boards,
+including the Orange Pi PC. NetBSD 9.0 is known to work best for the Orange Pi PC
+board and provides a fully working system with serial console, networking and storage.
+For the Orange Pi PC machine, get the 'evbarm-earmv7hf' based image from:
+
+  https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0/evbarm-earmv7hf/binary/gzimg/armv7.img.gz
+
+The image requires manually installing U-Boot in the image. Build U-Boot with
+the orangepi_pc_defconfig configuration as described in the previous section.
+Next, unzip the NetBSD image and write the U-Boot binary including SPL using:
+
+.. code-block:: bash
+
+  $ gunzip armv7.img.gz
+  $ dd if=/path/to/u-boot-sunxi-with-spl.bin of=armv7.img bs=1024 seek=8 conv=notrunc
+
+Finally, before starting the machine the SD image must be extended such
+that the NetBSD kernel will not conclude the NetBSD partition is larger than
+the emulated SD card:
+
+.. code-block:: bash
+
+  $ dd if=/dev/zero bs=1M count=64 >> armv7.img
+
+Start the machine using the following command:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
+        -sd armv7.img -global allwinner-rtc.base-year=2000
+
+At the U-Boot stage, interrupt the automatic boot process by pressing a key
+and set the following environment variables before booting:
+
+.. code-block:: bash
+
+  => setenv bootargs root=ld0a
+  => setenv kernel netbsd-GENERIC.ub
+  => setenv fdtfile dtb/sun8i-h3-orangepi-pc.dtb
+  => setenv bootcmd 'fatload mmc 0:1 ${kernel_addr_r} ${kernel}; fatload mmc 0:1 ${fdt_addr_r} ${fdtfile}; fdt addr ${fdt_addr_r}; bootm ${kernel_addr_r} - ${fdt_addr_r}'
+
+Optionally you may save the environment variables to SD card with 'saveenv'.
+To continue booting simply give the 'boot' command and NetBSD boots.
+
+Orange Pi PC acceptance tests
+"""""""""""""""""""""""""""""
+
+The Orange Pi PC machine has several acceptance tests included.
+To run the whole set of tests, build QEMU from source and simply
+provide the following command:
+
+.. code-block:: bash
+
+  $ AVOCADO_ALLOW_LARGE_STORAGE=yes avocado --show=app,console run \
+     -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index d2a3b44ce8..f16465aa48 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -215,3 +215,5 @@ emulation includes the following elements:
 
 A Linux 2.6 test image is available on the QEMU web site. More
 information is available in the QEMU mailing-list archive.
+
+.. include:: orangepi.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index 53040ceab3..10802f7e66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -498,6 +498,7 @@ S: Maintained
 F: hw/*/allwinner-h3*
 F: include/hw/*/allwinner-h3*
 F: hw/arm/orangepi.c
+F: docs/system/orangepi.rst
 
 ARM PrimeCell and CMSDK devices
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.17.1
