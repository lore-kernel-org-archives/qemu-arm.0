Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp3300514ejq;
        Wed, 10 May 2023 03:32:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7bYRgy1ywPB8syhE7H+aZamtODTboNIeMdtedvBVIMRkDrp7DWlTKjSa7tU0W7nTD8SUpU
X-Received: by 2002:ac8:5c0e:0:b0:3ef:59e2:b9b5 with SMTP id i14-20020ac85c0e000000b003ef59e2b9b5mr25550692qti.47.1683714771274;
        Wed, 10 May 2023 03:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683714771; cv=none;
        d=google.com; s=arc-20160816;
        b=KK8rKP92nuaM0gg5kFWZBl+x/mP2vBsmOAyx9rRodeNs/II06xj8YbdkLfBXfRAvo2
         e+oR25IL/v6mB+S7F6wI0agEjH1wiy9c7R8qVWa74VW+AMtINkJnSgHIk/YC1sirwlIA
         cbthdHj68j9HCuLfCT8ONGoV0sBfz12A6PeEBt8WHxjieJ8itQ75F5/TfaPluQuZW0hW
         OiV+BmbVEAp6tQz8vkbkgUVpE/EcTDVinbTP+DDZvOZHVcrLZCg+Q2hmpIBRojEFH6b2
         0/H5xfDAn/yvsHyMs5TtIXYq6fpQ0nPmEqYx6QGsnNkzyybck/rfVSOjUuRu3FyWM+p7
         IEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=8fSOj9FHLD20tnFbzWLo8vjwarYRhtlzUZh39dyHPG8=;
        b=nEx0dRYphHPydM/skvvxG8La6LmA5t8Zeoo7cjCbksWoynC1ULpN57UUuatOjdUhqJ
         okASlAgSR3IMT3DC+YASbyuN1DWXvtiSlkPITYnwemOszx6tVZ94oPSoFKuZtOVneoou
         kX3aK+D2pZS6PArYHD/42WFKclt4IgicjWdJn/LbvCHM8vrzGIk0lZrWdI9D1+6P4GOA
         fVAu0FwzoV9OZLs0Tl6yr5K0i2vlbod39BmOsk4IFb/gydsBnrXQ85x6oXvSWVVMcoot
         CrCI8DE44pemtywqmlDuBaZfNQOsWl5kQl67br/cGYK/iHr7ImytYhvab3qy0zb9wxu6
         ur9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b="IF/MkUsH";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020a05620a06c100b007577a8cfcf9si2856402qky.199.2023.05.10.03.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 May 2023 03:32:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b="IF/MkUsH";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwh74-0005ME-NN; Wed, 10 May 2023 06:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pwh6i-0004sx-0y; Wed, 10 May 2023 06:31:43 -0400
Received: from m12.mail.163.com ([220.181.12.216])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pwh6e-0008HA-63; Wed, 10 May 2023 06:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=8fSOj
 9FHLD20tnFbzWLo8vjwarYRhtlzUZh39dyHPG8=; b=IF/MkUsH/4kQNWwkK/IQ3
 irbAkrNGZ0T7Zh+tXL//YSzZUMQZ6373L5k6paYX9Y6fZ3Bp+EWbkCWK7eN+SGoX
 hll7qb97czPO8s2dzX3NpwHGpwdckeY4LVQ806yIYdloAf4FEG5ddewr/ptQqnya
 SdP/DAd1ygTwbL3yBk3iKw=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
 by zwqz-smtp-mta-g1-0 (Coremail) with SMTP id _____wCn0aR8cltkktHiBQ--.58382S2;
 Wed, 10 May 2023 18:31:25 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v4 11/11] docs: system: arm: Introduce bananapi_m2u
Date: Wed, 10 May 2023 18:31:23 +0800
Message-Id: <20230510103123.30118-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCn0aR8cltkktHiBQ--.58382S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuw4fCF4ruF4fCr1xZw47urg_yoW7Aw4fpF
 yvka15KrWkJF1Fya97Kw1fWFy5Xas5ArWUJF1kJ34rtF98Kr1vvwn3Kwn8Wasrtw4Ivw10
 qrW7GF12gwn8J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pM2NZrUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiGgFr7VaEFME5ggAAsh
Received-SPF: pass client-ip=220.181.12.216;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cQ5oEE2mMI21

From: qianfan Zhao <qianfanguijin@163.com>

Add documents for Banana Pi M2U

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 docs/system/arm/bananapi_m2u.rst | 138 +++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 docs/system/arm/bananapi_m2u.rst

diff --git a/docs/system/arm/bananapi_m2u.rst b/docs/system/arm/bananapi_m2u.rst
new file mode 100644
index 0000000000..ae7194a9df
--- /dev/null
+++ b/docs/system/arm/bananapi_m2u.rst
@@ -0,0 +1,138 @@
+Banana Pi BPI-M2U (``bpim2u``)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Banana Pi BPI-M2 Ultra is a quad-core mini single board computer built with
+Allwinner A40i/R40/V40 SoC. It features 2GB of RAM and 8GB eMMC. It also
+has onboard WiFi and BT. On the ports side, the BPI-M2 Ultra has 2 USB A
+2.0 ports, 1 USB OTG port, 1 HDMI port, 1 audio jack, a DC power port,
+and last but not least, a SATA port.
+
+Supported devices
+"""""""""""""""""
+
+The Banana Pi M2U machine supports the following devices:
+
+ * SMP (Quad Core Cortex-A7)
+ * Generic Interrupt Controller configuration
+ * SRAM mappings
+ * SDRAM controller
+ * Timer device (re-used from Allwinner A10)
+ * UART
+ * SD/MMC storage controller
+ * EMAC ethernet
+ * GMAC ethernet
+ * Clock Control Unit
+ * TWI (I2C)
+
+Limitations
+"""""""""""
+
+Currently, Banana Pi M2U does *not* support the following features:
+
+- Graphical output via HDMI, GPU and/or the Display Engine
+- Audio output
+- Hardware Watchdog
+- Real Time Clock
+- USB 2.0 interfaces
+
+Also see the 'unimplemented' array in the Allwinner R40 SoC module
+for a complete list of unimplemented I/O devices: ``./hw/arm/allwinner-r40.c``
+
+Boot options
+""""""""""""
+
+The Banana Pi M2U machine can start using the standard -kernel functionality
+for loading a Linux kernel or ELF executable. Additionally, the Banana Pi M2U
+machine can also emulate the BootROM which is present on an actual Allwinner R40
+based SoC, which loads the bootloader from a SD card, specified via the -sd
+argument to qemu-system-arm.
+
+Running mainline Linux
+""""""""""""""""""""""
+
+To build a Linux mainline kernel that can be booted by the Banana Pi M2U machine,
+simply configure the kernel using the sunxi_defconfig configuration:
+
+.. code-block:: bash
+
+  $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make mrproper
+  $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make sunxi_defconfig
+
+To boot the newly build linux kernel in QEMU with the Banana Pi M2U machine, use:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M bpim2u -nographic \
+      -kernel /path/to/linux/arch/arm/boot/zImage \
+      -append 'console=ttyS0,115200' \
+      -dtb /path/to/linux/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dtb
+
+Banana Pi M2U images
+""""""""""""""""""""
+
+Note that the mainline kernel does not have a root filesystem. You can choose
+to build you own image with buildroot using the bananapi_m2_ultra_defconfig.
+Also see https://buildroot.org for more information.
+
+Another possibility is to run an OpenWrt image for Banana Pi M2U which
+can be downloaded from:
+
+   https://downloads.openwrt.org/releases/22.03.3/targets/sunxi/cortexa7/
+
+When using an image as an SD card, it must be resized to a power of two. This can be
+done with the ``qemu-img`` command. It is recommended to only increase the image size
+instead of shrinking it to a power of two, to avoid loss of data. For example,
+to prepare a downloaded Armbian image, first extract it and then increase
+its size to one gigabyte as follows:
+
+.. code-block:: bash
+
+  $ qemu-img resize \
+    openwrt-22.03.3-sunxi-cortexa7-sinovoip_bananapi-m2-ultra-ext4-sdcard.img \
+    1G
+
+Instead of providing a custom Linux kernel via the -kernel command you may also
+choose to let the Banana Pi M2U machine load the bootloader from SD card, just like
+a real board would do using the BootROM. Simply pass the selected image via the -sd
+argument and remove the -kernel, -append, -dbt and -initrd arguments:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M bpim2u -nic user -nographic \
+    -sd openwrt-22.03.3-sunxi-cortexa7-sinovoip_bananapi-m2-ultra-ext4-sdcard.img
+
+Running U-Boot
+""""""""""""""
+
+U-Boot mainline can be build and configured using the Bananapi_M2_Ultra_defconfig
+using similar commands as describe above for Linux. Note that it is recommended
+for development/testing to select the following configuration setting in U-Boot:
+
+  Device Tree Control > Provider for DTB for DT Control > Embedded DTB
+
+The BootROM of allwinner R40 loading u-boot from the 8KiB offset of sdcard.
+Let's create an bootable disk image:
+
+.. code-block:: bash
+
+  $ dd if=/dev/zero of=sd.img bs=32M count=1
+  $ dd if=u-boot-sunxi-with-spl.bin of=sd.img bs=1k seek=8 conv=notrunc
+
+And then boot it.
+
+.. code-block:: bash
+  $ qemu-system-arm -M bpim2u -nographic -sd sd.img
+
+Banana Pi M2U integration tests
+""""""""""""""""""""""""""""""
+
+The Banana Pi M2U machine has several integration tests included.
+To run the whole set of tests, build QEMU from source and simply
+provide the following command:
+
+.. code-block:: bash
+
+  $ cd qemu-build-dir
+  $ AVOCADO_ALLOW_LARGE_STORAGE=yes tests/venv/bin/avocado \
+    --verbose --show=app,console run -t machine:bpim2u \
+    ../tests/avocado/boot_linux_console.py
-- 
2.25.1

