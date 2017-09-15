Received: by 10.223.172.38 with SMTP id v35csp950122wrc;
        Fri, 15 Sep 2017 10:03:19 -0700 (PDT)
X-Received: by 10.55.103.14 with SMTP id b14mr8578961qkc.267.1505494999639;
        Fri, 15 Sep 2017 10:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505494999; cv=none;
        d=google.com; s=arc-20160816;
        b=jKtk05PGRiLzwEPUXPecdK7l63nZfb532gKeElSJmgdtadCVrkCYicExVQFAtnqe9F
         ssb3ILwwko9Q3Z2+cSu1TSGxyO35IwnrwBvGuBmpZQY9830baBeqIWJuiXGXKk6/nvwt
         jTqKVRjvHtSPwctjtQF3xeiuaOyFc48emIk8JpcIfiapDoO01RKpcUirBuQSB0iXoKon
         kX0E1IemyTsJL9Uuasvnp0sMrAIj4QpT10K3WUenY/91oPIR9zweAcWS5YzvK8eYztXi
         Krd7MuNPKvHA4ZDiaHRMxmHGi/dA/Cl/di0TVm+Eju9ctUGyqbIno0J+LbNs9djsn5Q8
         ogrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=AdIG7nc3m2isE/SNOgcC6OjeDhxBRC4mXkpx+TEE+ms=;
        b=DS+pxIbkjC2qakSOa/BR9l+rXwL/cSQcdGkSRVjtw5p1LM4F55183Jdn9emEPVrJbd
         nWfWux6vKL6otvo8EM7glhv8Zmnep3gpzMG7OipFB0bOYTeq9jroGf/FEREtvkphmIgp
         zV5r7zYEpjzlNdZK1rvyaLHa0MHPVtsnj5fIN6aORFb1PH7UAhyLtfSbMt042xF0aa6A
         Hp6c5J0e0MMjKEj1WCVnsS7Y0As9ZNFhGPxjQbg2313sFnyaIT1fHoayRMmkLr+bC3VZ
         2HYgG5EgAHIAAxqb2q8/7AMl8UTIbYufmXffeuI4M4837c2D26AUT2xsk8oPzLvDDNTx
         wgGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n74JuqvV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17si1399184qtu.237.2017.09.15.10.03.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Sep 2017 10:03:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n74JuqvV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsu1N-0000ct-Cf
	for alex.bennee@linaro.org; Fri, 15 Sep 2017 13:03:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dstxw-0005Tb-Bu
	for qemu-devel@nongnu.org; Fri, 15 Sep 2017 12:59:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dstxu-00045X-Ms
	for qemu-devel@nongnu.org; Fri, 15 Sep 2017 12:59:44 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:37158)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dstxu-00044y-F8; Fri, 15 Sep 2017 12:59:42 -0400
Received: by mail-pg0-x242.google.com with SMTP id v5so1604612pgn.4;
	Fri, 15 Sep 2017 09:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AdIG7nc3m2isE/SNOgcC6OjeDhxBRC4mXkpx+TEE+ms=;
	b=n74JuqvVRa2KWv0QnlvhO4GIPsiWmVnnAu98pdLrriI2JexMsjDFIhUCaRelePV5nZ
	Q1X+de+MmNCJRXSIObvzsZ8McByix640WrwkZODsgLT1PDCWNoywuy7DMmNViiD4cfuH
	jeFYZn2G5fIE/zA2vcsnqZjlBH7XDqbzRSChyk1W2JtpWEKp+1DYWN8k7oijNV1ND8mv
	VhId9SpQRm5rNOrQcuM+RKEDgfPFixdKze+aHsuNgzZ8qL6NM46UwPiTSbVLtdZsKWEL
	4VGLgy/scj+juniqLWcDBgVynssGLHNPOsdZ5gYOJBEDs7myd9RkCEX5X0tTzMrH2gjP
	kiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AdIG7nc3m2isE/SNOgcC6OjeDhxBRC4mXkpx+TEE+ms=;
	b=cZ7OAkHlvFkeJJV0sE+5tETRrCMjRi0RG+KyP2S2sbLFsfFwrkJVnkdjEOX3rtg/3P
	gc2cgGUPMT1f3/ugPQ8A2iPullw4f9q1N7i+OGITfC6fscmGAaGTzEijDJPNUqE4WiRd
	B7jwx+dlcfs7iefMBxsuG8Y87nKHTa5wvm+Eay74A30/z8PYYCHlwQu2fPYDlUXbTw6F
	c8CKHfPiKAq6f0NwydUW+QLa7CJpUcf+pQQCZz4P/AM7a7Q2UNjmNWppGeKhbQE2QmSz
	LfsKDEJPLt/WF9Y9wBrwY7IkGL5AP9GY3fXQqE9yn4slFPd5djl9aBnlLOx5xDB6CQcB
	7IQg==
X-Gm-Message-State: AHPjjUh8XWR27+wsx9SG/xft1beOb8lAtmtYSvfCHIM7+YNS6mihEL2D
	5A0cs+y/avOtImFf
X-Google-Smtp-Source: ADKCNb5W35v3THL4xIUnvdnUM0gDy64ciNhKdXh91lI1JQaIAjZDdtdpADdKX6PGvxl4m4TGEhcuMQ==
X-Received: by 10.84.132.35 with SMTP id 32mr17235151ple.170.1505494781296;
	Fri, 15 Sep 2017 09:59:41 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	s17sm3111350pgq.25.2017.09.15.09.59.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 09:59:40 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 15 Sep 2017 22:29:13 +0530
Message-Id: <1505494753-10837-6-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [Qemu devel v9 PATCH 5/5] msf2: Add Emcraft's
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
X-TUID: 3esleC0kHSwU

Emulated Emcraft's Smartfusion2 System On Module starter
kit.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 0000000..d395696
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
+static void emcraft_sf2_s2s010_init(MachineState *machine)
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
+    mc->desc = "SmartFusion2 SOM kit from Emcraft (M2S010)";
+    mc->init = emcraft_sf2_s2s010_init;
+}
+
+DEFINE_MACHINE("emcraft-sf2", emcraft_sf2_machine_init)
-- 
2.5.0

