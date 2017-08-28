Received: by 10.223.188.70 with SMTP id a6csp4715424wrh;
        Mon, 28 Aug 2017 09:40:43 -0700 (PDT)
X-Received: by 10.55.73.6 with SMTP id w6mr1626320qka.233.1503938443505;
        Mon, 28 Aug 2017 09:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503938443; cv=none;
        d=google.com; s=arc-20160816;
        b=CPQG7+tlzJxfyFY1evENT/bX7ptnEVPmsH/Xtgnx60OlQ6oCOJ9pGCR/l7nnQljRfs
         OXpiIxz4W6pXUZdOofH9iLqEeyN/FL82G46yfGVEynA8AcjjNCKBGRNCbrUh486LSpM3
         leeZ24K0EbjlT8i2R8Sp/GTukq+kWSzwqOfiA9qNfoy/7Nw3blcer5d+N++D9BKq6NKx
         QbUQq+4bsQ4bmK62GpdcQofgQlXcX0H35qRVpVNzRuKASWlZEGP3vB68xQzZk7J08EHI
         Qq1iFeek2AyDIV9FcW66+MjAUTtisQvZGsDuhZEVbdV/b4OxJd+DFjszJUMwvIZEdcmU
         qJcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=yBMbxk0owmgYZeQbWPEv6cWTGrUk61tkgpxfm3/VIFg=;
        b=tF5ERaN3HQeIGm7a1aP29MSATLinMJoVjutCHROLvS79AJtaxQGtlmA+nDuwQ8WD6n
         WJc2acNnvWxMnevuFTVj9ohqCeVamL2uybIuIEczqfrn2MZoQiYvRA1R+eUpt0S1DvGz
         IxvlB/0bnqi2vQ4+ZBgzc9mJBZnYvA01WSCj1aQyM+8HfGr48+KX2kUXUuqlB6lrRbnx
         LoNVyCMzWCaN3dhIcU9yYUw8O7033Ayt9uc9+nDFrgr4taAMfRUlf66+JiMixeBIcgii
         Ykgf+BlNoiYlL2ShAnQI6oysPbsBVCfQFEsuCEZd1uY6HjzedrAE5jqauZdMP7O6zTHm
         pIiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qIj7Rppn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f93si635570qtd.476.2017.08.28.09.40.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Aug 2017 09:40:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qIj7Rppn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmN5d-0003Ny-4K
	for alex.bennee@linaro.org; Mon, 28 Aug 2017 12:40:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dmN3Y-00023P-MK
	for qemu-devel@nongnu.org; Mon, 28 Aug 2017 12:38:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dmN3X-0003h8-GE
	for qemu-devel@nongnu.org; Mon, 28 Aug 2017 12:38:32 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:32803)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dmN3X-0003eB-87; Mon, 28 Aug 2017 12:38:31 -0400
Received: by mail-pg0-x244.google.com with SMTP id m15so749568pgc.0;
	Mon, 28 Aug 2017 09:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yBMbxk0owmgYZeQbWPEv6cWTGrUk61tkgpxfm3/VIFg=;
	b=qIj7RppnyrVEDm3QRwAt6ol03ZjSUY21TZgdNcevNnaGmc9TziT2EUq7VoSs8wVQK2
	+y1N3lpCR9punJDD/UGnz7NaWlyC/Aszh4NbXPgOnXmT/T+9QHG2lROsXUdWCvSD8qYy
	BziOLPAzt97H2hiNEnAIioUEV7fex+vzIYRizsHVaoZ3hdPUVqpGdCdGhSK+k85AK8iv
	IZBZ8zCcLn1ArkLcA5e3xAKxkGfzjtnBjRm/30swcZdJtD6XOTviYTExtOhOz00Vg7dF
	5ajzSpis5pOB0uJx6zWKRb7hSQYblpr/pp5Wbn3+ZGZCpIAie8WQrBXHjkv4L93CFrJA
	0CCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yBMbxk0owmgYZeQbWPEv6cWTGrUk61tkgpxfm3/VIFg=;
	b=GaFht+9PBhPtLfsov2Hgt81rNZNzLSVQxjx2t/wpAoguU32AwF5MQSNofleb/8wnCI
	GWND3HTqQrZ2mYks0/XJhLFMpGvSRrMYQ2kyuGApgsXL1ZwY9EzzktHrocs/43/P4Uc7
	gMZZXpHc4RZ7cvvam3l36kZgc56we6za7afXyPLXqxaUQXBNdjr7rvtu9mY6eMuwWRVR
	SvoH9vDiB89JV7T7mkWKKNvWaPIzr5TKel1NmyO+uoAD1kB6bYeNj48lbH3S6Yme89sA
	AnLx7hpIrUiP1vYE/yNOJO3Q3NqyhStvfiwpyAfRw/0LpzBLf9qVR9+o3sYEV66nJloh
	+SOQ==
X-Gm-Message-State: AHYfb5jpwtE2f99d/mAy3IozSUT75DvZVOAEE4Jy7y4/A4XyKiPf/x8C
	hZsbqnodBPze10hw
X-Google-Smtp-Source: ADKCNb5UNyYa3A+HgdATUc4z6aTTA9b79/HKmuoCXnuFZ0pMOoddZ5oR08zppTGrseGUDMguhXYhhw==
X-Received: by 10.84.238.134 with SMTP id v6mr1432828plk.187.1503938310221;
	Mon, 28 Aug 2017 09:38:30 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	n66sm1935015pfi.44.2017.08.28.09.38.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Aug 2017 09:38:29 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 28 Aug 2017 22:08:03 +0530
Message-Id: <1503938283-12404-6-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-devel] [Qemu devel v7 PATCH 5/5] msf2: Add Emcraft's
 Smartfusion2 SOM kit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	f4bug@amsat.org, alistair23@gmail.com, crosthwaite.peter@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B1eS/3xGrsfx

Emulated Emcraft's Smartfusion2 System On Module starter
kit.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/arm/Makefile.objs |  2 +-
 hw/arm/msf2-som.c    | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/msf2-som.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index df36a03..e81a7dc 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -19,4 +19,4 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
-obj-$(CONFIG_MSF2) += msf2-soc.o
+obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
new file mode 100644
index 0000000..fd89ba9
--- /dev/null
+++ b/hw/arm/msf2-som.c
@@ -0,0 +1,94 @@
+/*
+ * SmartFusion2 SOM starter kit(from Emcraft) emulation.
+ *
+ * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/boards.h"
+#include "hw/arm/arm.h"
+#include "exec/address-spaces.h"
+#include "qemu/cutils.h"
+#include "hw/arm/msf2-soc.h"
+
+#define DDR_BASE_ADDRESS      0xA0000000
+#define DDR_SIZE              (64 * M_BYTE)
+
+#define M2S010_ENVM_SIZE      (256 * K_BYTE)
+#define M2S010_ESRAM_SIZE     (64 * K_BYTE)
+
+static void emcraft_sf2_init(MachineState *machine)
+{
+    DeviceState *dev;
+    DeviceState *spi_flash;
+    MSF2State *soc;
+    DriveInfo *dinfo = drive_get_next(IF_MTD);
+    qemu_irq cs_line;
+    SSIBus *spi_bus;
+    MemoryRegion *sysmem = get_system_memory();
+    MemoryRegion *ddr = g_new(MemoryRegion, 1);
+
+    memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
+                           &error_fatal);
+    memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
+
+    dev = qdev_create(NULL, TYPE_MSF2_SOC);
+    qdev_prop_set_string(dev, "part-name", "M2S010");
+    qdev_prop_set_uint64(dev, "eNVM-size", M2S010_ENVM_SIZE);
+    qdev_prop_set_uint64(dev, "eSRAM-size", M2S010_ESRAM_SIZE);
+
+    /*
+     * CPU clock and peripheral clocks(APB0, APB1)are configurable
+     * in Libero. CPU clock is divided by APB0 and APB1 divisors for
+     * peripherals. Emcraft's SoM kit comes with these settings by default.
+     */
+    qdev_prop_set_uint32(dev, "m3clk", 142 * 1000000);
+    qdev_prop_set_uint32(dev, "apb0div", 2);
+    qdev_prop_set_uint32(dev, "apb1div", 2);
+
+    object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);
+
+    soc = MSF2_SOC(dev);
+
+    /* Attach SPI flash to SPI0 controller */
+    spi_bus = (SSIBus *)qdev_get_child_bus(dev, "spi0");
+    spi_flash = ssi_create_slave_no_init(spi_bus, "s25sl12801");
+    qdev_prop_set_uint8(spi_flash, "spansion-cr2nv", 1);
+    if (dinfo) {
+        qdev_prop_set_drive(spi_flash, "drive", blk_by_legacy_dinfo(dinfo),
+                                    &error_fatal);
+    }
+    qdev_init_nofail(spi_flash);
+    cs_line = qdev_get_gpio_in_named(spi_flash, SSI_GPIO_CS, 0);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&soc->spi[0]), 1, cs_line);
+
+    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
+                       soc->envm_size);
+}
+
+static void emcraft_sf2_machine_init(MachineClass *mc)
+{
+    mc->desc = "SmartFusion2 SOM kit from Emcraft";
+    mc->init = emcraft_sf2_init;
+}
+
+DEFINE_MACHINE("emcraft-sf2", emcraft_sf2_machine_init)
-- 
2.5.0

