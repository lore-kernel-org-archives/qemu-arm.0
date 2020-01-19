Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp970037lff;
        Sat, 18 Jan 2020 16:51:32 -0800 (PST)
X-Received: by 2002:a1c:66d6:: with SMTP id a205mr12202569wmc.171.1579395092248;
        Sat, 18 Jan 2020 16:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579395092; cv=none;
        d=google.com; s=arc-20160816;
        b=TDmn/qwvBL23rTuS6lq8RV/9kgwpPmKKi2PRYFUZCqws4YMuFhyKeiS9FXqsYpH76V
         8h90QcKscr5ngNcCLoxUEVFUDe+BSks1LMxqxdbsQcnuwWztgfdHoyES6SAB2d5M53dN
         qe/Yg35/P10HlptjggCHAIRe20ZQTLxy4kl+oHD/v8Akm2pCLsNbpuOLlh5qkEviyZyM
         C7PKNmnGY2BWxeAfNNbsXdKPe22EcHSHXKiBBXjPBhHboF/xP8v2Mf3xJedBzrA79edh
         geZKhoFAjv7GYKMsUTFbWvXg59TI1LXbAEZFbkThWFUzp5JhG44TgfLCP4SakRh7RwZ0
         vLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=pdl/uNvO7egscf35xl4ajBsKhu2xXqtaLGKPbzOUV5s=;
        b=pb7j42GVSJLBui47io4o9RA5CRwqUq300dIER5Xcm6mJ1BarnGyeJ101cY2ndpDfkQ
         y7A+Jg89zPmnH7MUUUiiEuRlLwCS5T6pTB8eJvCgxtPAKFgkiTWaAixwX3PMrTLpGbf8
         rohFh80b/fGqmkzMAGuj9QtSKaZHN+wkN4Oe5nSasZ5/y+E+0VU/6Rm+vhUfNiFRzDqX
         2PHoH2m1J7rK6p13um11x6jY9XGOObLqw6go/dlqEuuiX07hd7KcuHEQHtiAmTWOHLmJ
         Nqd34lmxGquq69hHG2IMH5TF4bmGoP847rpDFeaxCtxhcsa9iWBdSbXMGNBn53oe3SZz
         6Msw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ele+nnXq;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g7sor6326769wmk.28.2020.01.18.16.51.32
        (Google Transport Security);
        Sat, 18 Jan 2020 16:51:32 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ele+nnXq;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pdl/uNvO7egscf35xl4ajBsKhu2xXqtaLGKPbzOUV5s=;
        b=ele+nnXqaJxFJrrSkR935m3AiSU46CSK59cWO8V9qHmSJpWkw5V/xz798SDEQkpfnj
         7xg5b2ceBUQ7flMvrsmwB+9Tgv2qA+0tzDJ5pRRr4pkiyipASPaZEIdCjah1I6dFuYMd
         jpq8YAnFjGYPe9ex1ENI9m1gvZNGyCjYUnqbhI8jJdwhLlfXrk6kaMZuEKdSisTlENMb
         T5Ig0WmW7wiKDTp8AWX1lRzewMGa7+6SUbM/hvogrKMhGOktaJ/wMzpBz9FfWTRcwfE1
         UH5juPvrzlflUxFL7NSlmH2FQXLnz9/bhsDhKyzx71JoeF4Dw6fSVWrJ/4qeaWpWOa1N
         k7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pdl/uNvO7egscf35xl4ajBsKhu2xXqtaLGKPbzOUV5s=;
        b=TfMsDX3IT1u9UUYS/Pq97G6cEfDRmMWD47fBA4yJija0P+vhFMkcnlYpwviLj3kffV
         1VIlctr9V5bS3h1/vL7/RDPFp0rXCMyhHnogzLvwN42Kh8HOhTOnoNdFYI5H7RMY0YVW
         JHH2+IqEOGS9zDO9Ij1ogqZZ3F56vkI/tAK5l7fLpZhoW1Z8gKu23bke+NMb8wNWdrgm
         XcFcIZ4lzs5PO0W9QVGrIQWEFc4TjkrhNThO3y37LGXZgqLrJ+QkY/7zghiyA82lCHmC
         a/01pO0cl7odwxL6I6h7m7jI4pHDz0uUsBsMLJqIqkzOYfOXCSmNp4+3VTEop/EZ5Thu
         PMRw==
X-Gm-Message-State: APjAAAXQU5eiRUOvmVr4de5j5UCZuRyt0+BXg+FDQj4pBXyHyLRVM41v
	H9AwNZ4s9b4ZmbisOIZ97sU=
X-Google-Smtp-Source: APXvYqwcBpMHesEn4WkoTkDJ3x68ULqghU6FE2DW6AQndWj5JJqFISrx25N7hr6KBNYTEvT7Td+XgA==
X-Received: by 2002:a7b:c392:: with SMTP id s18mr11810942wmj.169.1579395091715;
        Sat, 18 Jan 2020 16:51:31 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id h2sm41763568wrv.66.2020.01.18.16.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 16:51:31 -0800 (PST)
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
Subject: [PATCH v4 20/20] docs: add Orange Pi PC document
Date: Sun, 19 Jan 2020 01:51:02 +0100
Message-Id: <20200119005102.3847-21-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200119005102.3847-1-nieklinnenbank@gmail.com>
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
X-TUID: mbsVQPx3xr+F

The Xunlong Orange Pi PC machine is a functional ARM machine
based on the Allwinner H3 System-on-Chip. It supports mainline
Linux, U-Boot, NetBSD and is covered by acceptance tests.

This commit adds a documentation text file with a description
of the machine and instructions for the user.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 docs/orangepi.rst | 199 ++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS       |   1 +
 2 files changed, 200 insertions(+)
 create mode 100644 docs/orangepi.rst

diff --git a/docs/orangepi.rst b/docs/orangepi.rst
new file mode 100644
index 0000000000..dbca9abe80
--- /dev/null
+++ b/docs/orangepi.rst
@@ -0,0 +1,199 @@
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
+
+Currently NetBSD 9.0 is in testing, but release candidate 1 can be started
+successfully on the Orange Pi PC machine. Get the 'evbarm-earmv7hf' based image from:
+
+  https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0_RC1/evbarm-earmv7hf/binary/gzimg/armv7.img.gz
+
+The image requires manually installing U-Boot in the image. Build U-Boot with
+the orangepi_pc_defconfig configuration as described in the previous section.
+Next, unzip the NetBSD image and write the U-Boot binary including SPL using:
+
+  $ gunzip armv7.img.gz
+  $ dd if=/path/to/u-boot-sunxi-with-spl.bin of=armv7.img bs=1024 seek=8 conv=notrunc
+
+Start the machine using the following command:
+
+  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
+        -sd armv7.img
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
+
diff --git a/MAINTAINERS b/MAINTAINERS
index e99797eec9..8b7096070c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -488,6 +488,7 @@ S: Maintained
 F: hw/*/allwinner-h3*
 F: include/hw/*/allwinner-h3*
 F: hw/arm/orangepi.c
+F: docs/orangepi.rst
 
 ARM PrimeCell and CMSDK devices
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.17.1
