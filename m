Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5518718lfp;
        Mon, 17 Feb 2020 15:24:41 -0800 (PST)
X-Received: by 2002:a1c:541b:: with SMTP id i27mr1312968wmb.137.1581981880954;
        Mon, 17 Feb 2020 15:24:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581981880; cv=none;
        d=google.com; s=arc-20160816;
        b=qZyKacFz+DyGLkNcqnvp9E83Kyv5RiWXCgaqpWqgaTOIdqnAfftOpT6ZmR3R/cGnx1
         zeG7UtLwlb/gtvVG/jZe4eniIxk8OVthlKbUhKYicjUDp6blxrkBnxaB+M3So0G8Q0PD
         5iFCIVTKhHA+C/JsJvsSh2WdgT2iViAEKu0hUFE9SEHhvYB8xTVtZitg39OzbcaEbw95
         IbH6wIKcraHcWyh5bnj8VoFKwWc8JjiBUjF13DktDafcGCzANmohjcF31HAOb7dWWvb/
         wwKm5vvDDqoZgk4uBk/YLKsJDZKwRe6tAvtdU2qHELQUPkWwKi5gBHPtsLUMpuVdEY4z
         y0AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=x9DqAwBOGWsAGyQaKML/v3d/xBegEeQVuzgOtA74s5w=;
        b=yjvWNawBl0RwWh3nAHFCPzjQI1zrJkvUmsmnD6Nv1PGhn962q79CCjRFjHql6DaE2/
         flaboyw4fgIj4t6IOmIXqzPKSsN97PoQ9NecZYyqjEA3W0tFGh480l3Ew8gJVcSdceSi
         9HTLkFyd97RDLXq2hTjzXrWUpJaKl7T+EYI8uv2ej2migQoV0PCiA2qDmm609kC0q1f7
         uUHwa9bHpX7LKpYGiXzfYAhiWD4Q8PSwaGdCAyzHbVKwV/D2mnsu2rr7v8WIcli7rpvk
         dbzAuT/M22x8XtLGS0E74arM8/R5Ny4dHeDBo5zG4E2HdfFqQzaBSxnZ5sOgnHl6AuYI
         a8ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kQjL4Mpj;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n2sor559896wmk.0.2020.02.17.15.24.40
        (Google Transport Security);
        Mon, 17 Feb 2020 15:24:40 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kQjL4Mpj;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=x9DqAwBOGWsAGyQaKML/v3d/xBegEeQVuzgOtA74s5w=;
        b=kQjL4Mpjbj3SYKkPGdbEWKjRDcOcU163+2bLKyPmKbMelRw4jzMf3dH1NcjJzDO6J0
         cBIgigceQbkNPtUWItHKyp4JhSjeY8+w4mbeNgKk+SnJbv0N/5PsrqIp/94jIBjAH3Ph
         KKgVpUYNsYGZtWWgChJ1xHLHA4QP9fPznpUa/HbIMe9Zyoe+FLqQVGbz9Yds2Pz3ExYL
         XoK9NvU6j3lztsEOekRejf2WhOkSKZtDJ+w462/XeZX1LKJFMYoaG404uzi/8+T55NMZ
         PKOj+pwOzBJLfs0etZUDS2fcbIkUJDxXFj/QxaL96c+YUl5msWYngvSJd4yCoFNC/TnM
         0BNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=x9DqAwBOGWsAGyQaKML/v3d/xBegEeQVuzgOtA74s5w=;
        b=hGQYHl/Y6YiayJS7SYnfk9iAhhURW1QBzt6DGPyEbRoKnH3MaR6EPjsvr+XLSjZ0r/
         jjYNGlqtWdDqK7D2crIcsek39PT3dUStgJr6qdCjCY7R2fdocw3HsIQmU78HpEQ30lwi
         znlg4lZHy/QSjp/RV5g1q8htcIGPAdpGMk/+0q6yj2UrLpu0nqDgJrU9fhrDo6rNkIez
         eZ77ciPtbWyFwlBP0tvB5dkR8SIT9cWeTfEhINBJGviGe7RDiayoX/JbSrE+d20t7Tlv
         7FYz9S/PrKXvISLryM2W+qBLiSf3DlAqYKg9b181Iioo2ysPwdGJ1ggmSm9w81AeAQ9s
         GurA==
X-Gm-Message-State: APjAAAUvko2nVuMAWuP2FamSKpzOxEf/Go8c9xZhWVc3N51hg5Ad4ZB0
	6890qz/LdN9T/x9uO/b5PBs=
X-Google-Smtp-Source: APXvYqxIPHbx+VRciqlrI7UfmtAnLaZPyAfXuaJHKmLtAL73uj/KWVAEpfUZCI8Buo6wIxm7PVQGFQ==
X-Received: by 2002:a05:600c:2254:: with SMTP id a20mr1158215wmm.97.1581981880403;
        Mon, 17 Feb 2020 15:24:40 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id w1sm3244831wro.72.2020.02.17.15.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 15:24:40 -0800 (PST)
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
Subject: [PATCH v5 18/18] docs: add Orange Pi PC document
Date: Tue, 18 Feb 2020 00:24:11 +0100
Message-Id: <20200217232411.30096-19-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217232411.30096-1-nieklinnenbank@gmail.com>
References: <20200217232411.30096-1-nieklinnenbank@gmail.com>
X-TUID: b4f4FJYyIbQB

The Xunlong Orange Pi PC machine is a functional ARM machine
based on the Allwinner H3 System-on-Chip. It supports mainline
Linux, U-Boot, NetBSD and is covered by acceptance tests.

This commit adds a documentation text file with a description
of the machine and instructions for the user.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 docs/orangepi.rst | 226 ++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS       |   1 +
 2 files changed, 227 insertions(+)
 create mode 100644 docs/orangepi.rst

diff --git a/docs/orangepi.rst b/docs/orangepi.rst
new file mode 100644
index 0000000000..a9b46f553c
--- /dev/null
+++ b/docs/orangepi.rst
@@ -0,0 +1,226 @@
+=========================
+Orange Pi PC Machine Type
+=========================
+
+The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
+based embedded computer with mainline support in both U-Boot
+and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
+1GiB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
+various other I/O.
+
+Supported devices
+-----------------
+
+The Orange Pi PC machine supports the following devices:
+
+ * SMP (Quad Core Cortex A7)
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
+-----------
+
+Currently, Orange Pi PC does *not* support the following features:
+
+- Graphical output via HDMI, GPU and/or the Display Engine
+- Audio output
+- Hardware Watchdog
+
+Also see the 'unimplemented' array in the Allwinner H3 SoC module
+for a complete list of unimplemented I/O devices:
+  ./hw/arm/allwinner-h3.c
+
+Using the Orange Pi PC machine type
+-----------------------------------
+
+Boot options
+~~~~~~~~~~~~
+
+The Orange Pi PC machine can start using the standard -kernel functionality
+for loading a Linux kernel or ELF executable. Additionally, the Orange Pi PC
+machine can also emulate the BootROM which is present on an actual Allwinner H3
+based SoC, which loads the bootloader from a SD card, specified via the -sd argument
+to qemu-system-arm.
+
+Machine-specific options
+~~~~~~~~~~~~~~~~~~~~~~~~
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
+  $ qemu-system-arm -M orangepi-pc -sd mycard.img \
+       -global allwinner-rtc.base-year=2000
+
+Running mainline Linux
+~~~~~~~~~~~~~~~~~~~~~~
+
+Mainline Linux kernels from 4.19 up to latest master are known to work.
+To build a Linux mainline kernel that can be booted by the Orange Pi PC machine,
+simply configure the kernel using the sunxi_defconfig configuration:
+
+  $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make mrproper
+  $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make sunxi_defconfig
+
+To be able to use USB storage, you need to manually enable the corresponding
+configuration item. Start the kconfig configuration tool:
+
+  $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make menuconfig
+
+Navigate to the following item, enable it and save your configuration:
+
+  Device Drivers > USB support > USB Mass Storage support
+
+Build the Linux kernel with:
+
+  $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make
+
+To boot the newly build linux kernel in QEMU with the Orange Pi PC machine, use:
+
+  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
+      -kernel /path/to/linux/arch/arm/boot/zImage \
+      -append 'console=ttyS0,115200' \
+      -dtb /path/to/linux/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dtb
+
+Orange Pi PC images
+~~~~~~~~~~~~~~~~~~~
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
+  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
+      -kernel /path/to/linux/arch/arm/boot/zImage \
+      -append 'console=ttyS0,115200 root=/dev/mmcblk0p2' \
+      -dtb /path/to/linux/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dtb \
+      -sd OrangePi_pc_debian_stretch_server_linux5.3.5_v1.0.img
+
+To attach the image as an USB mass storage device to the machine,
+simply append to the command:
+
+  -drive if=none,id=stick,file=myimage.img \
+  -device usb-storage,bus=usb-bus.0,drive=stick
+
+Instead of providing a custom Linux kernel via the -kernel command you may also
+choose to let the Orange Pi PC machine load the bootloader from SD card, just like
+a real board would do using the BootROM. Simply pass the selected image via the -sd
+argument and remove the -kernel, -append, -dbt and -initrd arguments:
+
+  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
+       -sd Armbian_19.11.3_Orangepipc_buster_current_5.3.9.img
+
+Note that both the official Orange Pi PC images and Armbian images start
+a lot of userland programs via systemd. Depending on the host hardware and OS,
+they may be slow to emulate, especially due to emulating the 4 cores.
+To help reduce the performance slow down due to emulating the 4 cores, you can
+give the following kernel parameters (or via -append):
+
+  => setenv extraargs 'systemd.default_timeout_start_sec=9000 loglevel=7 nosmp console=ttyS0,115200'
+
+Running U-Boot
+~~~~~~~~~~~~~~
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
+  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
+      -kernel /path/to/uboot/u-boot -sd disk.img
+
+Use the following U-boot commands to load and boot a Linux kernel from SD card:
+
+  -> setenv bootargs console=ttyS0,115200
+  -> ext2load mmc 0 0x42000000 zImage
+  -> ext2load mmc 0 0x43000000 sun8i-h3-orangepi-pc.dtb
+  -> bootz 0x42000000 - 0x43000000
+
+Running NetBSD
+~~~~~~~~~~~~~~
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
+  $ gunzip armv7.img.gz
+  $ dd if=/path/to/u-boot-sunxi-with-spl.bin of=armv7.img bs=1024 seek=8 conv=notrunc
+
+Finally, before starting the machine the SD image must be extended such
+that the NetBSD kernel will not conclude the NetBSD partition is larger than
+the emulated SD card:
+
+  $ dd if=/dev/zero bs=1M count=64 >> armv7.img
+
+Start the machine using the following command:
+
+  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
+        -sd armv7.img -global allwinner-rtc.base-year=2000
+
+At the U-Boot stage, interrupt the automatic boot process by pressing a key
+and set the following environment variables before booting:
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
+-----------------------------
+
+The Orange Pi PC machine has several acceptance tests included.
+To run the whole set of tests, build QEMU from source and simply
+provide the following command:
+
+  $ AVOCADO_ALLOW_LARGE_STORAGE=yes avocado --show=app,console run \
+     -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
diff --git a/MAINTAINERS b/MAINTAINERS
index 8a93797b72..40324896d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -490,6 +490,7 @@ S: Maintained
 F: hw/*/allwinner-h3*
 F: include/hw/*/allwinner-h3*
 F: hw/arm/orangepi.c
+F: docs/orangepi.rst
 
 ARM PrimeCell and CMSDK devices
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.17.1
