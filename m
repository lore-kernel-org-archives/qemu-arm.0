Received: by 10.182.158.201 with SMTP id ww9csp2039541obb;
        Sat, 19 Dec 2015 21:45:23 -0800 (PST)
X-Received: by 10.140.93.77 with SMTP id c71mr16913536qge.46.1450590323488;
        Sat, 19 Dec 2015 21:45:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 31si24300696qgg.12.2015.12.19.21.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 21:45:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAWo7-0000w5-3c
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 00:45:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAWn8-0007Sl-16
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 00:44:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAWn3-0000eP-1C
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 00:44:21 -0500
Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c]:34920)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAWn0-0000dp-Qa; Sun, 20 Dec 2015 00:44:14 -0500
Received: by mail-pf0-x22c.google.com with SMTP id v86so70817118pfa.2;
	Sat, 19 Dec 2015 21:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=+3ILpWmllHXO/T9r9+NUa1pax948bkHIsdlN9TteiRU=;
	b=yLtCTm2zFd/+DzB3OjHNajD1fjF8NHRIw1ZV4ISZnStJvnH0Ckcp+WEP0LskLEDyhm
	9p5sypsYroKSSKJw4dBRCXs8TMZrlFxwqKpS0dg8lFsVdch3ogn/Ts7LilWmuOwvZEz1
	hiaWfEvvZQVAxtWDiI/i+w7QqbinRI6/afeSMA9b/EUVtj9HXePaA74SsnhPxHPeYsfQ
	Iz3mgL0n57/3qgbVjKXMQpUm+gT0/ouZUFqvkMXiiXGvUE9e+zTgL2oRsEzzqiF3h3Zh
	fxXf1upQ2WemhscDo6Mxf+D8U6M1ORgl2JCJuEH9FstEj/OjdMBti6/CcahHn0t2jNA9
	9gow==
X-Received: by 10.98.16.206 with SMTP id 75mr17447653pfq.23.1450590254296;
	Sat, 19 Dec 2015 21:44:14 -0800 (PST)
Received: from localhost.localdomain
	(c211-31-14-155.rochd5.qld.optusnet.com.au. [211.31.14.155])
	by smtp.gmail.com with ESMTPSA id c27sm894550pfd.50.2015.12.19.21.44.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 21:44:13 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 19 Dec 2015 21:43:37 -0800
Message-Id: <27dea50e71d768db3752dcad34be0f4c4234fd21.1450570397.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22c
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
	alistair.francis@xilinx.com
Subject: [Qemu-arm] [PATCH v6 5/6] xlnx-zynqmp: Connect the SPI devices
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vru5RMHDXgIQ

From: Alistair Francis <alistair.francis@xilinx.com>

Connect the Xilinx SPI devices to the ZynqMP model.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
[ PC changes
 * Use QOM alias for bus connectivity on SoC level
]
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
V6:
 - Use QOM alias for bus connectivity on SoC level
V5:
 - Use the bus renaming function
V4:
 - Rename the SPI busses so that they can all be accessed from the SoC
 - Don't set the num-busses property
V3:
 - Expose the SPI Bus as part of the SoC device
V2:
 - Don't connect the SPI flash to the SoC

 hw/arm/xlnx-zynqmp.c         | 30 ++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-zynqmp.h |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 87553bb..f2e13a4 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -56,6 +56,14 @@ static const int sdhci_intr[XLNX_ZYNQMP_NUM_SDHCI] = {
     48, 49,
 };
 
+static const uint64_t spi_addr[XLNX_ZYNQMP_NUM_SPIS] = {
+    0xFF040000, 0xFF050000,
+};
+
+static const int spi_intr[XLNX_ZYNQMP_NUM_SPIS] = {
+    19, 20,
+};
+
 typedef struct XlnxZynqMPGICRegion {
     int region_index;
     uint32_t address;
@@ -112,6 +120,12 @@ static void xlnx_zynqmp_init(Object *obj)
         qdev_set_parent_bus(DEVICE(&s->sdhci[i]),
                             sysbus_get_default());
     }
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
+        object_initialize(&s->spi[i], sizeof(s->spi[i]),
+                          TYPE_XILINX_SPIPS);
+        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
+    }
 }
 
 static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
@@ -286,6 +300,22 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci[i]), 0,
                            gic_spi[sdhci_intr[i]]);
     }
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
+        char bus_name[6];
+
+        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
+                           gic_spi[spi_intr[i]]);
+
+        /* Alias controller SPI bus to the SoC itself */
+        snprintf(bus_name, 6, "spi%d", i);
+        object_property_add_alias(OBJECT(s), bus_name,
+                                  OBJECT(&s->spi[i]), "spi0",
+                                  &error_abort);
+    }
 }
 
 static Property xlnx_zynqmp_props[] = {
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index d116092..f598a43 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -25,6 +25,7 @@
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci.h"
 #include "hw/sd/sdhci.h"
+#include "hw/ssi/xilinx_spips.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
 #define XLNX_ZYNQMP(obj) OBJECT_CHECK(XlnxZynqMPState, (obj), \
@@ -35,6 +36,7 @@
 #define XLNX_ZYNQMP_NUM_GEMS 4
 #define XLNX_ZYNQMP_NUM_UARTS 2
 #define XLNX_ZYNQMP_NUM_SDHCI 2
+#define XLNX_ZYNQMP_NUM_SPIS 2
 
 #define XLNX_ZYNQMP_NUM_OCM_BANKS 4
 #define XLNX_ZYNQMP_OCM_RAM_0_ADDRESS 0xFFFC0000
@@ -66,6 +68,7 @@ typedef struct XlnxZynqMPState {
     CadenceUARTState uart[XLNX_ZYNQMP_NUM_UARTS];
     SysbusAHCIState sata;
     SDHCIState sdhci[XLNX_ZYNQMP_NUM_SDHCI];
+    XilinxSPIPS spi[XLNX_ZYNQMP_NUM_SPIS];
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
-- 
1.9.1

