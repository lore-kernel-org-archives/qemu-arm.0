Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp6266669lfq;
        Tue, 22 Dec 2020 22:26:31 -0800 (PST)
X-Received: by 2002:a05:620a:1203:: with SMTP id u3mr25026894qkj.39.1608704791211;
        Tue, 22 Dec 2020 22:26:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608704791; cv=none;
        d=google.com; s=arc-20160816;
        b=OuUb0h+9LWG7LxPjI4Lm/0yR9afy/Mi99Sd4sYxHraQJrTm+9Tv/73Ef2OoOrn3aUl
         eMQl6jFa0UktVINDrp3nIZiVviYGLjlG0EPIglcOa+wmPontua0eeRrW6P+zOSsfprgz
         HG3aw/uMtLPdfJGJimOMd5YPjfSjVbMAs4JfF7y+1hJHdNh9QR3jva09hLQeMxjrEyfS
         XgIHsFMiJZtvzPKwHgrGZdZ62uUkFdtPrCVxW++5a63d5OZG2gwDHxbcfk0/Ey9jpAj/
         vPsnJzGVfoVibEsdsJwPpuTRHSW+7KTUSPjf9Efv4X2PMFMCOWC7mMhfwuYVMB1DV7wv
         bawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=ea300HOW8ofLPhUdOkUc6i+pqGe3xUrkR+h2FXHkW9Y=;
        b=CWABY9Yu1UrTn4+KWCUYTwFb3WSsV0jR3LPhz2jqULqRQRahRPXhDkPPu+OgE4wCzB
         nQBjkwtoBa6MhOcqLA01S3E+MBu5RdYT08eRbDjXwhj/9UwAXyBUuUgKUl5Iy8DuRtxt
         Mf/geNEwXHMjDs9MNPhibiQGHacgTn+pRv7vI6E0xsGkvtnN7oOppfsMIVN35OcKcx7P
         LE4KXByJoJen2/6UEaYvNOk7dzNQlmBVXJ2uvLRJFCWUHXbRakAhvDI0YS8EMdVjJgXb
         oNHJ+oJjbUpnJDjTRo+ScL86O/Wt+Sv94bqWTS3UBXZYqAzJIyYmqPtw1COP97szeNMj
         n+gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ObNgumNL;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w2sor20643874qtd.28.2020.12.22.22.26.31
        (Google Transport Security);
        Tue, 22 Dec 2020 22:26:31 -0800 (PST)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ObNgumNL;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ea300HOW8ofLPhUdOkUc6i+pqGe3xUrkR+h2FXHkW9Y=;
        b=ObNgumNLd+bUAV74TogOAQDr+wP6wP0cQ/3chCX/rBr85CIMBgPwd9bKTTYzJO5RMp
         0glu1+cgLTwCKrJvdqEQOkLOFbEZSi3u+K04bWWakvj+SJ/KEOUvCmsMMkhuQrtB9d3K
         4/ThHgYL10cOhRCqXGRCXInbelxmu43T/sZW0SyemAcpLpw1iUQP0iN/Zn2NhgVIXr+e
         XSJ6qZTkEGgzRvoKin+e1Zmd0dEZrHqIE3hd69/I2Dz4lcoQlVNAzV4qkAadLHGF4A2n
         y3NVmpqZ4S41x224+qLuyYrSHlI0SMWNxtdAxWm9Ltq43YZNi0lW4CJhUA/ymLiEH2sC
         jMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ea300HOW8ofLPhUdOkUc6i+pqGe3xUrkR+h2FXHkW9Y=;
        b=okGFKzckxhdtDnoPMBgmDE0ID0+Dk2+ZcY3DTTWSMx34Kj7RAoqOuBwSfXRFnuiAoO
         3Y0OwjOUlSHAbJII1mnv9n5dkLol0nlhglC5oHGNH+q+sdIZmXfQpF89gnGTINNCV/5Y
         MObx1xyeRvYtwDB8t29sYO4mTBE19r1pAJqwyKHVMdwIXa9k64RguntSPj2OBySqlMQ7
         9kwdNpIb3mCxKDyG2TdGxb4CaPtDLG4O3+PSw2i0bdUlrh7/y02FEv/8c/rm4caRG5Re
         L9vnVMVanAdhtn6FMWPBNpKXqABQJRZcDG0f9jVOWtjKYtspBeUPfXp0QT9Wv2ILgmoo
         LHXg==
X-Gm-Message-State: AOAM531GHflMZqL98/Ne2R13LI1kFqs/aLBiY1uQIIF9IvSaCgSb14Az
	kKPElThgPFKrN/rA4o7mUrYUB95+G2c=
X-Google-Smtp-Source: ABdhPJwK81CR7eCyMnY6CNaSfSLP2Xv7Z/zqEPlnhEMLtzsldzR0hS7iAJVdWAcm7pbLNazeSbtv2A==
X-Received: by 2002:ac8:5a90:: with SMTP id c16mr24560007qtc.331.1608704790879;
        Tue, 22 Dec 2020 22:26:30 -0800 (PST)
Return-Path: <bmeng.cn@gmail.com>
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com. [147.11.124.94])
        by smtp.gmail.com with ESMTPSA id q32sm14518589qtb.0.2020.12.22.22.26.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 22:26:30 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 4/4] docs/system: arm: Add sabrelite board description
Date: Wed, 23 Dec 2020 14:26:07 +0800
Message-Id: <1608704767-9317-5-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
X-TUID: W1cOwOk7YMiH

From: Bin Meng <bin.meng@windriver.com>

This adds the target guide for SABRE Lite board, and documents how
to boot a Linux kernel and U-Boot bootloader.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: add sabrelite target guide

 docs/system/arm/sabrelite.rst | 119 ++++++++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst    |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 docs/system/arm/sabrelite.rst

diff --git a/docs/system/arm/sabrelite.rst b/docs/system/arm/sabrelite.rst
new file mode 100644
index 0000000..4c5d101
--- /dev/null
+++ b/docs/system/arm/sabrelite.rst
@@ -0,0 +1,119 @@
+Boundary Devices SABRE Lite (``sabrelite``)
+===========================================
+
+Boundary Devices SABRE Lite i.MX6 Development Board is a low-cost development
+platform featuring the powerful Freescale / NXP Semiconductor's i.MX 6 Quad
+Applications Processor.
+
+Supported devices
+-----------------
+
+The SABRE Lite machine supports the following devices:
+
+ * Up to 4 Cortex A9 cores
+ * Generic Interrupt Controller
+ * 1 Clock Controller Module
+ * 1 System Reset Controller
+ * 5 UARTs
+ * 2 EPIC timers
+ * 1 GPT timer
+ * 2 Watchdog timers
+ * 1 FEC ethernet controller
+ * 3 I2C controllers
+ * 7 GPIO controllers
+ * 4 SDHC storage controllers
+ * 4 USB 2.0 host controllers
+ * 5 ECSPI controllers
+ * 1 SST 25VF016B flash
+
+Please note above list is a complete superset the QEMU SABRE Lite machine can
+support. For a normal use case, a device tree blob that reprents a real world
+SABRE Lite board, only exposes a subset of devices to the guest software.
+
+Boot options
+------------
+
+The SABRE Lite machine can start using the standard -kernel functionality
+for loading a Linux kernel, U-Boot bootloader or ELF executable.
+
+Running Linux kernel
+--------------------
+
+Linux mainline v5.10 release is tested at the time of writing. To build a Linux
+mainline kernel that can be booted by the SABRE Lite machine, simply configure
+the kernel using the imx_v6_v7_defconfig configuration:
+
+.. code-block:: bash
+
+  $ export ARCH=arm
+  $ export CROSS_COMPILE=arm-linux-gnueabihf-
+  $ make imx_v6_v7_defconfig
+  $ make
+
+To boot the newly built Linux kernel in QEMU with the SABRE Lite machine, use:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M sabrelite -smp 4 -m 1G \
+      -display none -serial null -serial stdio \
+      -kernel arch/arm/boot/zImage \
+      -dtb arch/arm/boot/dts/imx6q-sabrelite.dtb \
+      -initrd /path/to/rootfs.ext4 \
+      -append "root=/dev/ram"
+
+Running U-Boot
+--------------
+
+U-Boot mainline v2020.10 release is tested at the time of writing. To build a
+U-Boot mainline bootloader that can be booted by the SABRE Lite machine, use
+the mx6qsabrelite_defconfig with similar commands as described above for Linux:
+
+.. code-block:: bash
+
+  $ export CROSS_COMPILE=arm-linux-gnueabihf-
+  $ make mx6qsabrelite_defconfig
+
+Note we need to adjust settings by:
+
+.. code-block:: bash
+
+  $ make menuconfig
+
+then manually select the following configuration in U-Boot:
+
+  Device Tree Control > Provider of DTB for DT Control > Embedded DTB
+
+To start U-Boot using the SABRE Lite machine, provide the u-boot binary to
+the -kernel argument, along with an SD card image with rootfs:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M sabrelite -smp 4 -m 1G \
+      -display none -serial null -serial stdio \
+      -kernel u-boot
+
+The following example shows booting Linux kernel from dhcp, and uses the
+rootfs on an SD card. This requies some additional command line parameters
+for QEMU:
+
+.. code-block:: none
+
+  -nic user,tftp=/path/to/kernel/zImage \
+  -drive file=sdcard.img,id=rootfs -device sd-card,drive=rootfs
+
+The directory for the built-in TFTP server should also contain the device tree
+blob of the SABRE Lite board. The sample SD card image was populated with the
+root file system with one single partition. You may adjust the kernel "root="
+boot parameter accordingly.
+
+After U-Boot boots, type the following commands in the U-Boot command shell to
+boot the Linux kernel:
+
+.. code-block:: none
+
+  => setenv ethaddr 00:11:22:33:44:55
+  => setenv bootfile zImage
+  => dhcp
+  => tftpboot 14000000 imx6q-sabrelite.dtb
+  => setenv bootargs root=/dev/mmcblk3p1
+  => bootz 12000000 - 14000000
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index bde4b8e..edd013c 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -83,6 +83,7 @@ undocumented; you can get a complete list by running
    arm/versatile
    arm/vexpress
    arm/aspeed
+   arm/sabrelite
    arm/digic
    arm/musicpal
    arm/gumstix
-- 
2.7.4
