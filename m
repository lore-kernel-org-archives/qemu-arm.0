Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1720454ejn;
        Sun, 16 Oct 2022 05:58:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6LzPz1wFpA+YKqdcBKWlcM4i+JuEUpotzaWsCoPejMBrgGJYD6A6XQYj5wjqVIFOFjcvfW
X-Received: by 2002:a05:6214:f2f:b0:4b1:d1cc:ac2a with SMTP id iw15-20020a0562140f2f00b004b1d1ccac2amr4992994qvb.8.1665925085991;
        Sun, 16 Oct 2022 05:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665925085; cv=none;
        d=google.com; s=arc-20160816;
        b=EFb8iz36whc097L/1ydC81fB/MBk2yywnbuN72JL/4Lumb7gqyWOzGewlWTprppTVz
         +1ngholG4nRvFDDFmp3/kd/GohoCUg/j1jmpSsBMPv6Q6fChIcD7Jmad+VRR+vTEJwUU
         WhSsrJGbysW/bQRlOSeKxdRb3glg+EieJcut5Jw8gXSwzizPZ3UeGRiHs7+WjBmtHBTp
         Watt0F3+G6suiYRCim8DYbVIFLrKhYTVa2p2GHTNFfd/q32k4IIacCMnGBM0zI8FkhKR
         golCjgr3z1cn36lWn4NPuRLEVFufr6VcFOyVW8jLBLbqwgnTVUBK+jok428ASOcEOpNZ
         21ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FF9RfsFN4QR2CJIO6KQEVLcRc2FmAyIWD1/3AJe2e6g=;
        b=sAnyORBrHeC2gooVY0s13l8uj2wGp8xD8A52vk9JK4NI4m8EHfqIUypbqPqju+q57f
         JqMQYxF/04ysWdQjrYTVQD2egF5XoO/u8rhC8ZFA+GiTwlKmF+CzTEhzB5GvlGNwUVid
         UyJDEmARyfMPpQjrnRaOKrsYLGDXFT343M37k9EJg3Cvv/GwX92fw4GPuUx8Yd1nLNjW
         J0e3k3ywcXcPeWOTSeCubtXvGvytnQk6/E7BGxyO7rd4y/BjxwH40wwc3R1a8zz6Yd7r
         O63g9SPuMaDlUE3mr9It70EWYExyjmqwIjuLJzMaOU04gAZC8k/OnAVIaPujWedkrY3Y
         gzsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=pK4M+z8S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo3-20020a056214500300b004acd6af5b16si4314425qvb.435.2022.10.16.05.58.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Oct 2022 05:58:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=pK4M+z8S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ok3DR-0006UZ-G7
	for alex.bennee@linaro.org; Sun, 16 Oct 2022 08:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2l0-0002hr-JA; Sun, 16 Oct 2022 08:28:45 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2ky-0000TI-G7; Sun, 16 Oct 2022 08:28:42 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g27so12525652edf.11;
 Sun, 16 Oct 2022 05:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FF9RfsFN4QR2CJIO6KQEVLcRc2FmAyIWD1/3AJe2e6g=;
 b=pK4M+z8S5uDoNXea9U+Dy+GbJdVrHUP0Ai9JR3uTXX02DKoAKY0FDGC49xHb/79x7R
 cNUCtQDUJrE8yx6eHTC0DiMMCSzyWRw1BrBBvazSuBORAFNITpObtdDKQahQs10zih+u
 42S5KhVsIbB+wybjGS1BEc56HcqdTU2BuFpkR6zt/KnSCvr7W17GhpoSf+SecwnF691Y
 h7kwPnj7ZMWyiv1agbH3hW7d0LUK+tySJNfJ+0J2y+uVJ4u1etIr2qxv2ix8AwrWQYxs
 nn9L/lbB95E+vPk5kRyrmkZrnWTNKUdqptmDbq1E41rlr9PfzvMGiuqMYyveVjfOGfly
 JVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FF9RfsFN4QR2CJIO6KQEVLcRc2FmAyIWD1/3AJe2e6g=;
 b=CuAZ5Vyk8dd7QyWHI4KzNPcD+aa/2lF3hIJWPlhcfJgYUdXcarvuMUgHTR2JdonFOn
 Zr7GFBFHhM54fflwtM0kdsaT3y4YoiYIxwSK5abhLOsgoOp5DVcLsY/HkoD9o66sBiWr
 D2kuh8ABVkJ1H+RFGA4mhqXtlfdM5qwGCyYGClaX/rGBrsSgUbGKWuw1mz06ZVkPfbY3
 ohROyuWkJ9t3kuu/fKPcBnjS+oPCygWW/tI+THW3dp5gRZS8lsnEy88TrbJOhTPt11YS
 zGBkuvRP3YIm2FY4oYd5P9Br2/62F5G90aHItx3iwnu6f9MQb5i9bYs+f1CAqR+mwd1c
 W3WQ==
X-Gm-Message-State: ACrzQf11QbBW1jNk8vr4jG5f9yBJZHIYUMxqThgcqdBAg1Ea0ATJn0/n
 GAijtdX+DCbvXdTDSVGyA7axafNosbo=
X-Received: by 2002:a05:6402:42c3:b0:45c:ec49:aacf with SMTP id
 i3-20020a05640242c300b0045cec49aacfmr5953828edc.40.1665923317690; 
 Sun, 16 Oct 2022 05:28:37 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-006-139.89.14.pool.telefonica.de. [89.14.6.139])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa7c391000000b00456cbd8c65bsm5504467edq.6.2022.10.16.05.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:28:37 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 9/9] hw/ppc/e500: Add Freescale eSDHC to e500plat
Date: Sun, 16 Oct 2022 14:27:37 +0200
Message-Id: <20221016122737.93755-10-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221016122737.93755-1-shentey@gmail.com>
References: <20221016122737.93755-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /2ntjiwF+nSZ

Adds missing functionality to e500plat machine which increases the
chance of given "real" firmware images to access SD cards.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/ppc/ppce500.rst | 12 ++++++++++++
 hw/ppc/Kconfig              |  1 +
 hw/ppc/e500.c               | 35 ++++++++++++++++++++++++++++++++++-
 hw/ppc/e500.h               |  1 +
 hw/ppc/e500plat.c           |  1 +
 5 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index 99d2c680d6..298ee9ee16 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -19,6 +19,7 @@ The ``ppce500`` machine supports the following devices:
 * Power-off functionality via one GPIO pin
 * 1 Freescale MPC8xxx PCI host controller
 * VirtIO devices via PCI bus
+* 1 Freescale Enhanced Secure Digital Host controller (eSDHC)
 * 1 Freescale Enhanced Triple Speed Ethernet controller (eTSEC)
 
 Hardware configuration information
@@ -181,3 +182,14 @@ as follows:
       -drive if=pflash,file=/path/to/rootfs.ext2,format=raw \
       -append "rootwait root=/dev/mtdblock0"
 
+Alternatively, the root file system can also reside on an emulated SD card
+whose size must again be a power of two:
+
+.. code-block:: bash
+
+  $ qemu-system-ppc{64|32} -M ppce500 -cpu e500mc -smp 4 -m 2G \
+      -display none -serial stdio \
+      -kernel vmlinux \
+      -device sd-card,drive=mydrive \
+      -drive id=mydrive,if=none,file=/path/to/rootfs.ext2,format=raw \
+      -append "rootwait root=/dev/mmcblk0"
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 769a1ead1c..6e31f568ba 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -129,6 +129,7 @@ config E500
     select PFLASH_CFI01
     select PLATFORM_BUS
     select PPCE500_PCI
+    select SDHCI
     select SERIAL
     select MPC_I2C
     select FDT_PPC
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 23d2c3451a..f43a21d8bb 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -48,6 +48,7 @@
 #include "hw/net/fsl_etsec/etsec.h"
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
+#include "hw/sd/sdhci.h"
 
 #define EPAPR_MAGIC                (0x45504150)
 #define DTC_LOAD_PAD               0x1800000
@@ -66,11 +67,14 @@
 #define MPC8544_SERIAL1_REGS_OFFSET 0x4600ULL
 #define MPC8544_PCI_REGS_OFFSET    0x8000ULL
 #define MPC8544_PCI_REGS_SIZE      0x1000ULL
+#define MPC85XX_ESDHC_REGS_OFFSET  0x2e000ULL
+#define MPC85XX_ESDHC_REGS_SIZE    0x1000ULL
 #define MPC8544_UTIL_OFFSET        0xe0000ULL
 #define MPC8XXX_GPIO_OFFSET        0x000FF000ULL
 #define MPC8544_I2C_REGS_OFFSET    0x3000ULL
 #define MPC8XXX_GPIO_IRQ           47
 #define MPC8544_I2C_IRQ            43
+#define MPC85XX_ESDHC_IRQ          72
 #define RTC_REGS_OFFSET            0x68
 
 #define PLATFORM_CLK_FREQ_HZ       (400 * 1000 * 1000)
@@ -203,6 +207,22 @@ static void dt_i2c_create(void *fdt, const char *soc, const char *mpic,
     g_free(i2c);
 }
 
+static void dt_sdhc_create(void *fdt, const char *parent, const char *mpic)
+{
+    hwaddr mmio = MPC85XX_ESDHC_REGS_OFFSET;
+    hwaddr size = MPC85XX_ESDHC_REGS_SIZE;
+    int irq = MPC85XX_ESDHC_IRQ;
+    g_autofree char *name = NULL;
+
+    name = g_strdup_printf("%s/sdhc@%" PRIx64, parent, mmio);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop(fdt, name, "sdhci,auto-cmd12", NULL, 0);
+    qemu_fdt_setprop_phandle(fdt, name, "interrupt-parent", mpic);
+    qemu_fdt_setprop_cells(fdt, name, "bus-width", 4);
+    qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x2);
+    qemu_fdt_setprop_cells(fdt, name, "reg", mmio, size);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "fsl,esdhc");
+}
 
 typedef struct PlatformDevtreeData {
     void *fdt;
@@ -553,6 +573,10 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
 
     dt_rtc_create(fdt, "i2c", "rtc");
 
+    /* sdhc */
+    if (pmc->has_esdhc) {
+        dt_sdhc_create(fdt, soc, mpic);
+    }
 
     gutil = g_strdup_printf("%s/global-utilities@%llx", soc,
                             MPC8544_UTIL_OFFSET);
@@ -982,7 +1006,8 @@ void ppce500_init(MachineState *machine)
                        0, qdev_get_gpio_in(mpicdev, 42), 399193,
                        serial_hd(1), DEVICE_BIG_ENDIAN);
     }
-        /* I2C */
+
+    /* I2C */
     dev = qdev_new("mpc-i2c");
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
@@ -992,6 +1017,14 @@ void ppce500_init(MachineState *machine)
     i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
     i2c_slave_create_simple(i2c, "ds1338", RTC_REGS_OFFSET);
 
+    /* eSDHC */
+    if (pmc->has_esdhc) {
+        dev = qdev_new(TYPE_FSL_ESDHC);
+        s = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(s, &error_fatal);
+        sysbus_mmio_map(s, 0, pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET);
+        sysbus_connect_irq(s, 0, qdev_get_gpio_in(mpicdev, MPC85XX_ESDHC_IRQ));
+    }
 
     /* General Utility device */
     dev = qdev_new("mpc8544-guts");
diff --git a/hw/ppc/e500.h b/hw/ppc/e500.h
index 68f754ce50..8c09ef92e4 100644
--- a/hw/ppc/e500.h
+++ b/hw/ppc/e500.h
@@ -27,6 +27,7 @@ struct PPCE500MachineClass {
 
     int mpic_version;
     bool has_mpc8xxx_gpio;
+    bool has_esdhc;
     hwaddr platform_bus_base;
     hwaddr platform_bus_size;
     int platform_bus_first_irq;
diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index 5bb1c603da..44bf874b0f 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -86,6 +86,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
     pmc->fixup_devtree = e500plat_fixup_devtree;
     pmc->mpic_version = OPENPIC_MODEL_FSL_MPIC_42;
     pmc->has_mpc8xxx_gpio = true;
+    pmc->has_esdhc = true;
     pmc->platform_bus_base = 0xf00000000ULL;
     pmc->platform_bus_size = 128 * MiB;
     pmc->platform_bus_first_irq = 5;
-- 
2.38.0

