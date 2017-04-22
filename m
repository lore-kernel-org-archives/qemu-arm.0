Received: by 10.25.0.144 with SMTP id 138csp795201lfa;
        Sat, 22 Apr 2017 12:07:34 -0700 (PDT)
X-Received: by 10.237.53.139 with SMTP id c11mr18648983qte.285.1492888054478;
        Sat, 22 Apr 2017 12:07:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f129si13649770qkc.42.2017.04.22.12.07.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 22 Apr 2017 12:07:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36601 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d20Na-00080l-0j
	for alex.bennee@linaro.org; Sat, 22 Apr 2017 15:07:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d20NP-0007zW-J2
	for qemu-arm@nongnu.org; Sat, 22 Apr 2017 15:07:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d20NL-0006vA-FG
	for qemu-arm@nongnu.org; Sat, 22 Apr 2017 15:07:23 -0400
Received: from mail.kernel.org ([198.145.29.136]:50162)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1d20NL-0006ur-8F; Sat, 22 Apr 2017 15:07:19 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id BBE422011E;
	Sat, 22 Apr 2017 19:07:16 +0000 (UTC)
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 86A6120117;
	Sat, 22 Apr 2017 19:07:13 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat, 22 Apr 2017 21:07:09 +0200
Message-Id: <20170422190709.8676-1-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH v2] hw/arm/exynos: Add generic SDHCI devices
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HVbe/sK2nY0j

Exynos4210 has four SD/MMC controllers supporting:
 - SD Standard Host Specification Version 2.0,
 - MMC Specification Version 4.3,
 - SDIO Card Specification Version 2.0,
 - DMA and ADMA.

Add emulation of SDHCI devices which allows accessing storage through SD
cards. Differences from real hardware:
 - Devices are shipped with eMMC memory, not SD card.
 - The Exynos4210 SDHCI has few more registers, e.g. for
   controlling the clocks, additional status (0x80, 0x84, 0x8c). These
   are not implemented.

Testing on smdkc210 machine with "-drive file=FILE,if=sd,bus=0,index=2".

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Fixes after Peter's review.
---
 hw/arm/exynos4210.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 0ec4250f0c05..5a622cfedfc8 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -32,6 +32,7 @@
 #include "hw/arm/arm.h"
 #include "hw/loader.h"
 #include "hw/arm/exynos4210.h"
+#include "hw/sd/sd.h"
 #include "hw/usb/hcd-ehci.h"
 
 #define EXYNOS4210_CHIPID_ADDR         0x10000000
@@ -72,6 +73,13 @@
 #define EXYNOS4210_EXT_COMBINER_BASE_ADDR   0x10440000
 #define EXYNOS4210_INT_COMBINER_BASE_ADDR   0x10448000
 
+/* SD/MMC host controllers */
+#define EXYNOS4210_SDHCI_CAPABILITIES       0x05E80080
+#define EXYNOS4210_SDHCI_BASE_ADDR          0x12510000
+#define EXYNOS4210_SDHCI_ADDR(n)            (EXYNOS4210_SDHCI_BASE_ADDR + \
+                                                0x00010000 * (n))
+#define EXYNOS4210_SDHCI_NUMBER             4
+
 /* PMU SFR base address */
 #define EXYNOS4210_PMU_BASE_ADDR            0x10020000
 
@@ -386,6 +394,27 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem,
                            EXYNOS4210_UART3_FIFO_SIZE, 3, NULL,
                   s->irq_table[exynos4210_get_irq(EXYNOS4210_UART_INT_GRP, 3)]);
 
+    /*** SD/MMC host controllers ***/
+    for (n = 0; n < EXYNOS4210_SDHCI_NUMBER; n++) {
+        DeviceState *carddev;
+        BlockBackend *blk;
+        DriveInfo *di;
+
+        dev = qdev_create(NULL, "generic-sdhci");
+        qdev_prop_set_uint32(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
+        qdev_init_nofail(dev);
+
+        busdev = SYS_BUS_DEVICE(dev);
+        sysbus_mmio_map(busdev, 0, EXYNOS4210_SDHCI_ADDR(n));
+        sysbus_connect_irq(busdev, 0, s->irq_table[exynos4210_get_irq(29, n)]);
+
+        di = drive_get(IF_SD, 0, n);
+        blk = di ? blk_by_legacy_dinfo(di) : NULL;
+        carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
+        qdev_prop_set_drive(carddev, "drive", blk, &error_abort);
+        qdev_init_nofail(carddev);
+    }
+
     /*** Display controller (FIMD) ***/
     sysbus_create_varargs("exynos4210.fimd", EXYNOS4210_FIMD0_BASE_ADDR,
             s->irq_table[exynos4210_get_irq(11, 0)],
-- 
2.9.3

