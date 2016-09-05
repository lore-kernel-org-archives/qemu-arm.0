Received: by 10.25.87.130 with SMTP id l124csp1794919lfb;
        Sun, 4 Sep 2016 23:14:53 -0700 (PDT)
X-Received: by 10.55.197.9 with SMTP id p9mr10435962qki.225.1473056093041;
        Sun, 04 Sep 2016 23:14:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h7si6415008qte.47.2016.09.04.23.14.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Sep 2016 23:14:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bgnBE-0003qA-Eg
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 02:14:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bgmxs-0001U5-JK
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 02:01:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bgmxm-0001sZ-Qn
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 02:01:03 -0400
Received: from 9.mo7.mail-out.ovh.net ([46.105.60.248]:60321)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bgmxm-0001sN-HN
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 02:00:58 -0400
Received: from player759.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id EFA9A1000246
	for <qemu-arm@nongnu.org>; Mon,  5 Sep 2016 08:00:57 +0200 (CEST)
Received: from hermes.kaod.org (alter.tetaneutral.net [91.224.149.189])
	(Authenticated sender: clg@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id B9A63640074;
	Mon,  5 Sep 2016 08:00:53 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  5 Sep 2016 08:00:06 +0200
Message-Id: <1473055209-18864-8-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473055209-18864-1-git-send-email-clg@kaod.org>
References: <1473055209-18864-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 727612815285783313
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrheejgddutdejucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.60.248
Subject: [Qemu-arm] [PATCH v4 07/10] hw/misc: use macros to define hw-strap1
 register on the AST2400 Aspeed SoC
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iO+wIdhU8ffG

This gives some explanation behind the magic number 0x120CE416.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

 Changes since v3:

 - added brackets around macro parameters

 Changes since v2:

 - more precise definitions of the hw-strap1 register
 - moved hw-strap1 to the board level.

 hw/arm/aspeed.c              |  15 +++++-
 include/hw/misc/aspeed_scu.h | 118 +++++++++++++++++++++++++++++++++++++=
++++++
 2 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b4eb8049af97..c08213c04e3f 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -40,8 +40,21 @@ enum {
     PALMETTO_BMC,
 };
=20
+#define PALMETTO_BMC_HW_STRAP1 (                                        =
\
+        SCU_AST2400_HW_STRAP_DRAM_SIZE(DRAM_SIZE_256MB) |               =
\
+        SCU_AST2400_HW_STRAP_DRAM_CONFIG(2 /* DDR3 with CL=3D6, CWL=3D5 =
*/) | \
+        SCU_AST2400_HW_STRAP_ACPI_DIS |                                 =
\
+        SCU_AST2400_HW_STRAP_SET_CLK_SOURCE(AST2400_CLK_48M_IN) |       =
\
+        SCU_HW_STRAP_VGA_CLASS_CODE |                                   =
\
+        SCU_HW_STRAP_LPC_RESET_PIN |                                    =
\
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_M_S_EN) |                =
\
+        SCU_AST2400_HW_STRAP_SET_CPU_AHB_RATIO(AST2400_CPU_AHB_RATIO_2_1=
) | \
+        SCU_HW_STRAP_SPI_WIDTH |                                        =
\
+        SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       =
\
+        SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
+
 static const AspeedBoardConfig aspeed_boards[] =3D {
-    [PALMETTO_BMC] =3D { "ast2400-a0", 0x120CE416 },
+    [PALMETTO_BMC] =3D { "ast2400-a0", PALMETTO_BMC_HW_STRAP1 },
 };
=20
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index fdfd982288f2..4d3e770cec21 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -36,4 +36,122 @@ typedef struct AspeedSCUState {
=20
 extern bool is_supported_silicon_rev(uint32_t silicon_rev);
=20
+/*
+ * Extracted from Aspeed SDK v00.03.21. Fixes and extra definitions
+ * were added.
+ *
+ * Original header file :
+ *    arch/arm/mach-aspeed/include/mach/regs-scu.h
+ *
+ *    Copyright (C) 2012-2020  ASPEED Technology Inc.
+ *
+ *    This program is free software; you can redistribute it and/or modi=
fy
+ *    it under the terms of the GNU General Public License version 2 as
+ *    published by the Free Software Foundation.
+ *
+ *      History      :
+ *       1. 2012/12/29 Ryan Chen Create
+ */
+
+/* Hardware Strapping Register definition (for Aspeed AST2400 SOC)
+ *
+ * 31:29  Software defined strapping registers
+ * 28:27  DRAM size setting (for VGA driver use)
+ * 26:24  DRAM configuration setting
+ * 23     Enable 25 MHz reference clock input
+ * 22     Enable GPIOE pass-through mode
+ * 21     Enable GPIOD pass-through mode
+ * 20     Disable LPC to decode SuperIO 0x2E/0x4E address
+ * 19     Disable ACPI function
+ * 23,18  Clock source selection
+ * 17     Enable BMC 2nd boot watchdog timer
+ * 16     SuperIO configuration address selection
+ * 15     VGA Class Code selection
+ * 14     Enable LPC dedicated reset pin function
+ * 13:12  SPI mode selection
+ * 11:10  CPU/AHB clock frequency ratio selection
+ * 9:8    H-PLL default clock frequency selection
+ * 7      Define MAC#2 interface
+ * 6      Define MAC#1 interface
+ * 5      Enable VGA BIOS ROM
+ * 4      Boot flash memory extended option
+ * 3:2    VGA memory size selection
+ * 1:0    BMC CPU boot code selection
+ */
+#define SCU_AST2400_HW_STRAP_SW_DEFINE(x)          ((x) << 29)
+#define SCU_AST2400_HW_STRAP_SW_DEFINE_MASK        (0x7 << 29)
+
+#define SCU_AST2400_HW_STRAP_DRAM_SIZE(x)          ((x) << 27)
+#define SCU_AST2400_HW_STRAP_DRAM_SIZE_MASK        (0x3 << 27)
+#define     DRAM_SIZE_64MB                             0
+#define     DRAM_SIZE_128MB                            1
+#define     DRAM_SIZE_256MB                            2
+#define     DRAM_SIZE_512MB                            3
+
+#define SCU_AST2400_HW_STRAP_DRAM_CONFIG(x)        ((x) << 24)
+#define SCU_AST2400_HW_STRAP_DRAM_CONFIG_MASK      (0x7 << 24)
+
+#define SCU_HW_STRAP_GPIOE_PT_EN                   (0x1 << 22)
+#define SCU_HW_STRAP_GPIOD_PT_EN                   (0x1 << 21)
+#define SCU_HW_STRAP_LPC_DEC_SUPER_IO              (0x1 << 20)
+#define SCU_AST2400_HW_STRAP_ACPI_DIS              (0x1 << 19)
+
+/* bit 23, 18 [1,0] */
+#define SCU_AST2400_HW_STRAP_SET_CLK_SOURCE(x)     (((((x) & 0x3) >> 1) =
<< 23) \
+                                                    | (((x) & 0x1) << 18=
))
+#define SCU_AST2400_HW_STRAP_GET_CLK_SOURCE(x)     (((((x) >> 23) & 0x1)=
 << 1) \
+                                                    | (((x) >> 18) & 0x1=
))
+#define SCU_AST2400_HW_STRAP_CLK_SOURCE_MASK       ((0x1 << 23) | (0x1 <=
< 18))
+#define     AST2400_CLK_25M_IN                         (0x1 << 23)
+#define     AST2400_CLK_24M_IN                         0
+#define     AST2400_CLK_48M_IN                         1
+#define     AST2400_CLK_25M_IN_24M_USB_CKI             2
+#define     AST2400_CLK_25M_IN_48M_USB_CKI             3
+
+#define SCU_HW_STRAP_2ND_BOOT_WDT                  (0x1 << 17)
+#define SCU_HW_STRAP_SUPER_IO_CONFIG               (0x1 << 16)
+#define SCU_HW_STRAP_VGA_CLASS_CODE                (0x1 << 15)
+#define SCU_HW_STRAP_LPC_RESET_PIN                 (0x1 << 14)
+
+#define SCU_HW_STRAP_SPI_MODE(x)                   ((x) << 12)
+#define SCU_HW_STRAP_SPI_MODE_MASK                 (0x3 << 12)
+#define     SCU_HW_STRAP_SPI_DIS                       0
+#define     SCU_HW_STRAP_SPI_MASTER                    1
+#define     SCU_HW_STRAP_SPI_M_S_EN                    2
+#define     SCU_HW_STRAP_SPI_PASS_THROUGH              3
+
+#define SCU_AST2400_HW_STRAP_SET_CPU_AHB_RATIO(x)  ((x) << 10)
+#define SCU_AST2400_HW_STRAP_GET_CPU_AHB_RATIO(x)  (((x) >> 10) & 3)
+#define SCU_AST2400_HW_STRAP_CPU_AHB_RATIO_MASK    (0x3 << 10)
+#define     AST2400_CPU_AHB_RATIO_1_1                  0
+#define     AST2400_CPU_AHB_RATIO_2_1                  1
+#define     AST2400_CPU_AHB_RATIO_4_1                  2
+#define     AST2400_CPU_AHB_RATIO_3_1                  3
+
+#define SCU_AST2400_HW_STRAP_GET_H_PLL_CLK(x)      (((x) >> 8) & 0x3)
+#define SCU_AST2400_HW_STRAP_H_PLL_CLK_MASK        (0x3 << 8)
+#define     AST2400_CPU_384MHZ                         0
+#define     AST2400_CPU_360MHZ                         1
+#define     AST2400_CPU_336MHZ                         2
+#define     AST2400_CPU_408MHZ                         3
+
+#define SCU_HW_STRAP_MAC1_RGMII                    (0x1 << 7)
+#define SCU_HW_STRAP_MAC0_RGMII                    (0x1 << 6)
+#define SCU_HW_STRAP_VGA_BIOS_ROM                  (0x1 << 5)
+#define SCU_HW_STRAP_SPI_WIDTH                     (0x1 << 4)
+
+#define SCU_HW_STRAP_VGA_SIZE_GET(x)               (((x) >> 2) & 0x3)
+#define SCU_HW_STRAP_VGA_MASK                      (0x3 << 2)
+#define SCU_HW_STRAP_VGA_SIZE_SET(x)               ((x) << 2)
+#define     VGA_8M_DRAM                                0
+#define     VGA_16M_DRAM                               1
+#define     VGA_32M_DRAM                               2
+#define     VGA_64M_DRAM                               3
+
+#define SCU_AST2400_HW_STRAP_BOOT_MODE(x)          (x)
+#define     AST2400_NOR_BOOT                           0
+#define     AST2400_NAND_BOOT                          1
+#define     AST2400_SPI_BOOT                           2
+#define     AST2400_DIS_BOOT                           3
+
 #endif /* ASPEED_SCU_H */
--=20
2.7.4

