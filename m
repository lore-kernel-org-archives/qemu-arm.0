Received: by 10.25.21.156 with SMTP id 28csp840514lfv;
        Thu, 28 Jul 2016 07:37:44 -0700 (PDT)
X-Received: by 10.55.166.216 with SMTP id p207mr9081253qke.79.1469716664502;
        Thu, 28 Jul 2016 07:37:44 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c186si8160430qkf.208.2016.07.28.07.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 07:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSmRT-0006Nn-V9
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 10:37:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmJJ-0007vw-UE
	for qemu-devel@nongnu.org; Thu, 28 Jul 2016 10:29:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmJE-0005y7-2a
	for qemu-devel@nongnu.org; Thu, 28 Jul 2016 10:29:16 -0400
Received: from 16.mo7.mail-out.ovh.net ([46.105.72.216]:56061)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSmJD-0005xo-P2
	for qemu-devel@nongnu.org; Thu, 28 Jul 2016 10:29:11 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 3C5CA1010435
	for <qemu-devel@nongnu.org>; Thu, 28 Jul 2016 16:29:11 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 960A25C006E;
	Thu, 28 Jul 2016 16:29:05 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 16:28:16 +0200
Message-Id: <1469716099-8975-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469716099-8975-1-git-send-email-clg@kaod.org>
References: <1469716099-8975-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1636495518061398801
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieejgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.72.216
Subject: [Qemu-devel] [PATCH v2 6/9] hw/misc: use macros to define hw-strap1
 register on Aspeed SOC
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GkeEi9hMg5PL

This gives some explanation behind the magic number 0x120CE416.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c              |   2 +-
 include/hw/misc/aspeed_scu.h | 109 +++++++++++++++++++++++++++++++++++++=
++++++
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 80be55ab293f..b5d34a3a0367 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -41,7 +41,7 @@ enum {
 };
=20
 static const AspeedBoardConfig aspeed_boards[] =3D {
-    [PALMETTO_BMC] =3D { 0x120CE416, AST2400_A0_SILICON_REV,
+    [PALMETTO_BMC] =3D { AST2400_HW_STRAP1, AST2400_A0_SILICON_REV,
                        AST2400_SDRAM_BASE },
 };
=20
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index fdfd982288f2..dfc3e023f3ba 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -36,4 +36,113 @@ typedef struct AspeedSCUState {
=20
 extern bool is_supported_silicon_rev(uint32_t silicon_rev);
=20
+/*
+ * Hardware strapping register definition
+ *
+ * Extracted from Aspeed SDK v00.03.21. A couple of fixes and some
+ * extra bit definitions were added.
+ *
+ * Original header file :
+ */
+
+/* arch/arm/mach-aspeed/include/mach/regs-scu.h
+ *
+ * Copyright (C) 2012-2020  ASPEED Technology Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *   History      :
+ *    1. 2012/12/29 Ryan Chen Create
+ */
+#define SCU_HW_STRAP_SW_DEFINE(x)          (x << 29)
+#define SCU_HW_STRAP_SW_DEFINE_MASK        (0x7 << 29)
+
+#define SCU_HW_STRAP_DRAM_SIZE(x)          (x << 27)
+#define SCU_HW_STRAP_DRAM_SIZE_MASK        (0x3 << 27)
+#define     DRAM_SIZE_64MB                     0
+#define     DRAM_SIZE_128MB                    1
+#define     DRAM_SIZE_256MB                    2
+#define     DRAM_SIZE_512MB                    3
+
+#define SCU_HW_STRAP_DRAM_CONFIG(x)        (x << 24)
+#define SCU_HW_STRAP_DRAM_CONFIG_MASK      (0x7 << 24)
+
+#define SCU_HW_STRAP_GPIOE_PT_EN           (0x1 << 22)
+#define SCU_HW_STRAP_GPIOD_PT_EN           (0x1 << 21)
+#define SCU_HW_STRAP_LPC_DEC_SUPER_IO      (0x1 << 20)
+#define SCU_HW_STRAP_ACPI_DIS              (0x1 << 19)
+
+/* bit 23, 18 [1,0] */
+#define SCU_HW_STRAP_SET_CLK_SOURCE(x)     ((((x & 0x3) >> 1) << 23) | \
+                                            ((x & 0x1) << 18))
+#define SCU_HW_STRAP_GET_CLK_SOURCE(x)     ((((x >> 23) & 0x1) << 1) |  =
\
+                                            ((x >> 18) & 0x1))
+#define SCU_HW_STRAP_CLK_SOURCE_MASK       ((0x1 << 23) | (0x1 << 18))
+#define     CLK_25M_IN                         (0x1 << 23)
+#define     CLK_24M_IN                         0
+#define     CLK_48M_IN                         1
+#define     CLK_25M_IN_24M_USB_CKI             2
+#define     CLK_25M_IN_48M_USB_CKI             3
+
+#define SCU_HW_STRAP_2ND_BOOT_WDT          (0x1 << 17)
+#define SCU_HW_STRAP_SUPER_IO_CONFIG       (0x1 << 16)
+#define SCU_HW_STRAP_VGA_CLASS_CODE        (0x1 << 15)
+#define SCU_HW_STRAP_LPC_RESET_PIN         (0x1 << 14)
+
+#define SCU_HW_STRAP_SPI_MODE(x)           (x << 12)
+#define SCU_HW_STRAP_SPI_MODE_MASK         (0x3 << 12)
+#define     SCU_HW_STRAP_SPI_DIS               0
+#define     SCU_HW_STRAP_SPI_MASTER            1
+#define     SCU_HW_STRAP_SPI_M_S_EN            2
+#define     SCU_HW_STRAP_SPI_PASS_THROUGH      3
+
+#define SCU_HW_STRAP_SET_CPU_AHB_RATIO(x)  (x << 10)
+#define SCU_HW_STRAP_GET_CPU_AHB_RATIO(x)  ((x >> 10) & 3)
+#define SCU_HW_STRAP_CPU_AHB_RATIO_MASK    (0x3 << 10)
+#define     CPU_AHB_RATIO_1_1                  0
+#define     CPU_AHB_RATIO_2_1                  1
+#define     CPU_AHB_RATIO_4_1                  2
+#define     CPU_AHB_RATIO_3_1                  3
+
+#define SCU_HW_STRAP_GET_H_PLL_CLK(x)      ((x >> 8) & 0x3)
+#define SCU_HW_STRAP_H_PLL_CLK_MASK        (0x3 << 8)
+#define     CPU_384MHZ                         0
+#define     CPU_360MHZ                         1
+#define     CPU_336MHZ                         2
+#define     CPU_408MHZ                         3
+
+#define SCU_HW_STRAP_MAC1_RGMII            (0x1 << 7)
+#define SCU_HW_STRAP_MAC0_RGMII            (0x1 << 6)
+#define SCU_HW_STRAP_VGA_BIOS_ROM          (0x1 << 5)
+#define SCU_HW_STRAP_SPI_WIDTH             (0x1 << 4)
+
+#define SCU_HW_STRAP_VGA_SIZE_GET(x)       ((x >> 2) & 0x3)
+#define SCU_HW_STRAP_VGA_MASK              (0x3 << 2)
+#define SCU_HW_STRAP_VGA_SIZE_SET(x)       (x << 2)
+#define     VGA_8M_DRAM                        0
+#define     VGA_16M_DRAM                       1
+#define     VGA_32M_DRAM                       2
+#define     VGA_64M_DRAM                       3
+
+#define SCU_HW_STRAP_BOOT_MODE(x)          (x)
+#define     NOR_BOOT                           0
+#define     NAND_BOOT                          1
+#define     SPI_BOOT                           2
+#define     DIS_BOOT                           3
+
+#define AST2400_HW_STRAP1 (                                             =
\
+        SCU_HW_STRAP_DRAM_SIZE(DRAM_SIZE_256MB) |                       =
\
+        SCU_HW_STRAP_DRAM_CONFIG(2 /* DDR3 with CL=3D6, CWL=3D5 */) |   =
    \
+        SCU_HW_STRAP_ACPI_DIS |                                         =
\
+        SCU_HW_STRAP_SET_CLK_SOURCE(CLK_48M_IN) |                       =
\
+        SCU_HW_STRAP_VGA_CLASS_CODE |                                   =
\
+        SCU_HW_STRAP_LPC_RESET_PIN |                                    =
\
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_M_S_EN) |                =
\
+        SCU_HW_STRAP_SET_CPU_AHB_RATIO(CPU_AHB_RATIO_2_1) |             =
\
+        SCU_HW_STRAP_SPI_WIDTH |                                        =
\
+        SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       =
\
+        SCU_HW_STRAP_BOOT_MODE(SPI_BOOT))
+
 #endif /* ASPEED_SCU_H */
--=20
2.1.4

