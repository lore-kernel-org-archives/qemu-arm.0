Received: by 10.25.21.96 with SMTP id l93csp415057lfi;
        Thu, 30 Jun 2016 08:52:53 -0700 (PDT)
X-Received: by 10.55.104.70 with SMTP id d67mr18616273qkc.60.1467301973379;
        Thu, 30 Jun 2016 08:52:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d187si3232959qkf.69.2016.06.30.08.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Jun 2016 08:52:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51291 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIeGq-0007DX-Ri
	for alex.bennee@linaro.org; Thu, 30 Jun 2016 11:52:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bIeEx-0005Ql-H6
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 11:51:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bIeEs-0006Sx-VZ
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 11:50:55 -0400
Received: from 17.mo6.mail-out.ovh.net ([46.105.36.150]:58765)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bIeEs-0006So-LY
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 11:50:50 -0400
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id A3511FFC033
	for <qemu-arm@nongnu.org>; Thu, 30 Jun 2016 17:50:45 +0200 (CEST)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 15B2A12009E;
	Thu, 30 Jun 2016 17:50:40 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jun 2016 17:50:24 +0200
Message-Id: <1467301824-10123-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467301824-10123-1-git-send-email-clg@kaod.org>
References: <1467301824-10123-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4599582594963639057
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudejgdeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.36.150
Subject: [Qemu-arm] [PATCH 2/2] hw/misc: use macros to define hw-strap1
 register on Aspeed SOC
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fbrihJLer8+X

This gives some explanation behind the magic number 0x120CE416.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/palmetto-bmc.c        | 16 ++++++++-
 include/hw/misc/aspeed_scu.h | 78 ++++++++++++++++++++++++++++++++++++++=
++++++
 2 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index fcbb4f197162..8fac67617825 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -22,6 +22,19 @@
 #include "sysemu/blockdev.h"
 #include "hw/block/flash.h"
=20
+#define PALMETTO_BMC_HW_STRAP1 (                                        =
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
 static struct arm_boot_info palmetto_bmc_binfo =3D {
     .loader_start =3D AST2400_SDRAM_BASE,
     .board_id =3D 0,
@@ -77,7 +90,8 @@ static void palmetto_bmc_init(MachineState *machine)
                                 &bmc->ram);
     object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
                                    &error_abort);
-    object_property_set_int(OBJECT(&bmc->soc), 0x120CE416, "hw-strap1",
+    object_property_set_int(OBJECT(&bmc->soc), PALMETTO_BMC_HW_STRAP1,
+                            "hw-strap1",
                             &error_abort);
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 6b8e46f85fad..92b81de309b6 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -31,4 +31,82 @@ typedef struct AspeedSCUState {
     uint32_t hw_strap2;
 } AspeedSCUState;
=20
+/*
+ * Hardware strapping register definition
+ */
+#define SCU_HW_STRAP_SW_DEFINE(x)          (x << 29)
+#define SCU_HW_STRAP_SW_DEFINE_MASK        (0x3 << 29)
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
+#define SCU_HW_STRAP_GET_CLK_SOURCE(x)     (((x >> 23) & 0x1 << 1) | \
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
 #endif /* ASPEED_SCU_H */
--=20
2.1.4

