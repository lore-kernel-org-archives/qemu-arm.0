Received: by 10.25.21.156 with SMTP id 28csp838305lfv;
        Thu, 28 Jul 2016 07:33:14 -0700 (PDT)
X-Received: by 10.55.104.70 with SMTP id d67mr42130054qkc.60.1469716394070;
        Thu, 28 Jul 2016 07:33:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m22si8170815qtc.21.2016.07.28.07.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 07:33:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSmN7-0002fg-E9
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 10:33:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmJR-00087F-Lv
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:29:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmJN-0005zm-CI
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:29:25 -0400
Received: from 10.mo7.mail-out.ovh.net ([178.33.250.56]:54365)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSmJN-0005ze-2U
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:29:21 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 38EBA1010444
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 16:29:16 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id E8A125C0092;
	Thu, 28 Jul 2016 16:29:10 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 16:28:17 +0200
Message-Id: <1469716099-8975-8-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469716099-8975-1-git-send-email-clg@kaod.org>
References: <1469716099-8975-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1638184366819805969
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieejgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.250.56
Subject: [Qemu-arm] [PATCH v2 7/9] aspeed: add ast2500 support to scu and
 sdmc controllers
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
X-TUID: i7D8BkedqYU4

Based on previous work done by Andrew Jeffery <andrew@aj.id.au>.

The ast2500 eval board has a hardware strapping register value of
0xF100C2E6 which we use for a definition of AST2500_HW_STRAP1 below.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Andrew,
=20
 I did not add your 'Reviewed-by' because of the changes below.

 Changes since v1:

 - added Hardware strapping register definition for soc AST2500

 hw/misc/aspeed_scu.c         | 45 ++++++++++++++++++++++++++++++++++-
 hw/misc/aspeed_sdmc.c        |  1 +
 include/hw/misc/aspeed_scu.h | 56 ++++++++++++++++++++++++++++++++++++++=
++++++
 3 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index c7e2c8263f55..6dd7e1085420 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -120,6 +120,41 @@ static const uint32_t ast2400_a0_resets[ASPEED_SCU_N=
R_REGS] =3D {
      [BMC_DEV_ID]      =3D 0x00002402U
 };
=20
+/* SCU70 bit 23: 0 24Mhz. bit 11:9: 0b001 AXI:ABH ratio 2:1 */
+/* AST2500 revision A1 */
+
+static const uint32_t ast2500_a1_resets[ASPEED_SCU_NR_REGS] =3D {
+     [SYS_RST_CTRL]    =3D 0xFFCFFEDCU,
+     [CLK_SEL]         =3D 0xF3F40000U,
+     [CLK_STOP_CTRL]   =3D 0x19FC3E8BU,
+     [D2PLL_PARAM]     =3D 0x00026108U,
+     [MPLL_PARAM]      =3D 0x00030291U,
+     [HPLL_PARAM]      =3D 0x93000400U,
+     [MISC_CTRL1]      =3D 0x00000010U,
+     [PCI_CTRL1]       =3D 0x20001A03U,
+     [PCI_CTRL2]       =3D 0x20001A03U,
+     [PCI_CTRL3]       =3D 0x04000030U,
+     [SYS_RST_STATUS]  =3D 0x00000001U,
+     [SOC_SCRATCH1]    =3D 0x000000C0U, /* SoC completed DRAM init */
+     [MISC_CTRL2]      =3D 0x00000023U,
+     [RNG_CTRL]        =3D 0x0000000EU,
+     [PINMUX_CTRL2]    =3D 0x0000F000U,
+     [PINMUX_CTRL3]    =3D 0x03000000U,
+     [PINMUX_CTRL4]    =3D 0x00000000U,
+     [PINMUX_CTRL5]    =3D 0x0000A000U,
+     [WDT_RST_CTRL]    =3D 0x023FFFF3U,
+     [PINMUX_CTRL8]    =3D 0xFFFF0000U,
+     [PINMUX_CTRL9]    =3D 0x000FFFFFU,
+     [FREE_CNTR4]      =3D 0x000000FFU,
+     [FREE_CNTR4_EXT]  =3D 0x000000FFU,
+     [CPU2_BASE_SEG1]  =3D 0x80000000U,
+     [CPU2_BASE_SEG4]  =3D 0x1E600000U,
+     [CPU2_BASE_SEG5]  =3D 0xC0000000U,
+     [UART_HPLL_CLK]   =3D 0x00001903U,
+     [PCIE_CTRL]       =3D 0x0000007BU,
+     [BMC_DEV_ID]      =3D 0x00002402U
+};
+
 static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned si=
ze)
 {
     AspeedSCUState *s =3D ASPEED_SCU(opaque);
@@ -198,6 +233,10 @@ static void aspeed_scu_reset(DeviceState *dev)
     case AST2400_A0_SILICON_REV:
         reset =3D ast2400_a0_resets;
         break;
+    case AST2500_A0_SILICON_REV:
+    case AST2500_A1_SILICON_REV:
+        reset =3D ast2500_a1_resets;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -208,7 +247,11 @@ static void aspeed_scu_reset(DeviceState *dev)
     s->regs[HW_STRAP2] =3D s->hw_strap2;
 }
=20
-static uint32_t aspeed_silicon_revs[] =3D { AST2400_A0_SILICON_REV, };
+static uint32_t aspeed_silicon_revs[] =3D {
+    AST2400_A0_SILICON_REV,
+    AST2500_A0_SILICON_REV,
+    AST2500_A1_SILICON_REV
+};
=20
 bool is_supported_silicon_rev(uint32_t silicon_rev)
 {
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 6cc0301a6331..621d166890fa 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -196,6 +196,7 @@ static void aspeed_sdmc_reset(DeviceState *dev)
         break;
=20
     case AST2500_A0_SILICON_REV:
+    case AST2500_A1_SILICON_REV:
         s->regs[R_CONF] |=3D
             ASPEED_SDMC_HW_VERSION(1) |
             ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index dfc3e023f3ba..d79e2214457d 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -33,6 +33,7 @@ typedef struct AspeedSCUState {
=20
 #define AST2400_A0_SILICON_REV   0x02000303U
 #define AST2500_A0_SILICON_REV   0x04000303U
+#define AST2500_A1_SILICON_REV   0x04010303U
=20
 extern bool is_supported_silicon_rev(uint32_t silicon_rev);
=20
@@ -145,4 +146,59 @@ extern bool is_supported_silicon_rev(uint32_t silico=
n_rev);
         SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       =
\
         SCU_HW_STRAP_BOOT_MODE(SPI_BOOT))
=20
+/*
+ * Hardware strapping register definition (for Aspeed AST2500 SOC and
+ * higher)
+ */
+#define SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE  (0x1 << 31)
+#define SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE     (0x1 << 30)
+#define SCU_AST2500_HW_STRAP_UART_DEBUG            (0x1 << 29)
+#define     UART_DEBUG_UART1                           0
+#define     UART_DEBUG_UART5                           1
+#define SCU_AST2500_HW_STRAP_RESERVED28            (0x1 << 28)
+
+#define SCU_AST2500_HW_STRAP_FAST_RESET_DBG        (0x1 << 27)
+#define SCU_AST2500_HW_STRAP_ESPI_FLASH_ENABLE     (0x1 << 26)
+#define SCU_AST2500_HW_STRAP_ESPI_ENABLE           (0x1 << 25)
+#define SCU_AST2500_HW_STRAP_DDR4_ENABLE           (0x1 << 24)
+
+#define SCU_AST2500_HW_STRAP_ACPI_ENABLE           (0x1 << 19)
+#define SCU_AST2500_HW_STRAP_USBCKI_FREQ           (0x1 << 18)
+#define     USBCKI_FREQ_24MHZ                          0
+#define     USBCKI_FREQ_28MHZ                          1
+
+#define SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(x)  (x << 9)
+#define SCU_AST2500_HW_STRAP_GET_AXI_AHB_RATIO(x)  ((x >> 9) & 7)
+#define SCU_AST2500_HW_STRAP_CPU_AXI_RATIO_MASK    (0x7 << 9)
+#define     AXI_AHB_RATIO_UNDEFINED                    0
+#define     AXI_AHB_RATIO_2_1                          1
+#define     AXI_AHB_RATIO_3_1                          2
+#define     AXI_AHB_RATIO_4_1                          3
+#define     AXI_AHB_RATIO_5_1                          4
+#define     AXI_AHB_RATIO_6_1                          5
+#define     AXI_AHB_RATIO_7_1                          6
+#define     AXI_AHB_RATIO_8_1                          7
+
+#define SCU_AST2500_HW_STRAP_RESERVED1             (0x1 << 1)
+#define SCU_AST2500_HW_STRAP_DIS_BOOT              (0x1 << 0)
+
+#define AST2500_HW_STRAP1_DEFAULTS (                                    =
\
+        SCU_AST2500_HW_STRAP_RESERVED28 |                               =
\
+        SCU_HW_STRAP_2ND_BOOT_WDT |                                     =
\
+        SCU_HW_STRAP_VGA_CLASS_CODE |                                   =
\
+        SCU_HW_STRAP_LPC_RESET_PIN |                                    =
\
+        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |     =
\
+        SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       =
\
+        SCU_AST2500_HW_STRAP_RESERVED1)
+
+#define AST2500_HW_STRAP1 ((                                            =
\
+        AST2500_HW_STRAP1_DEFAULTS |                                    =
\
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     =
\
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        =
\
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               =
\
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              =
\
+        SCU_HW_STRAP_MAC1_RGMII |                                       =
\
+        SCU_HW_STRAP_MAC0_RGMII) &                                      =
\
+        ~SCU_HW_STRAP_2ND_BOOT_WDT)
+
 #endif /* ASPEED_SCU_H */
--=20
2.1.4

