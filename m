Received: by 10.80.163.71 with SMTP id 65csp198559edn;
        Fri, 9 Sep 2016 09:24:25 -0700 (PDT)
X-Received: by 10.55.184.198 with SMTP id i189mr4748398qkf.96.1473438264496;
        Fri, 09 Sep 2016 09:24:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19si2532272qkz.112.2016.09.09.09.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 09:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58979 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biObH-00036c-S4
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 12:24:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biOb5-0002uW-Le
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:24:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biOb1-0005tt-HG
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:24:11 -0400
Received: from 1.mo178.mail-out.ovh.net ([178.33.251.53]:54131)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1biOb1-0005th-8o
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:24:07 -0400
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id CBFCDFFC897
	for <qemu-arm@nongnu.org>; Fri,  9 Sep 2016 18:24:06 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 6AA193C0065;
	Fri,  9 Sep 2016 18:24:01 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  9 Sep 2016 18:22:51 +0200
Message-Id: <1473438177-26079-9-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473438177-26079-1-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16295712304816818961
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrieeggddutddvucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.251.53
Subject: [Qemu-arm] [PATCH v5 08/14] aspeed: add a ast2500 SoC and support
 to the SCU and SDMC controllers
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
X-TUID: WJBF+U6NBOsx

Based on previous work done by Andrew Jeffery <andrew@aj.id.au>.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

 Changes since v3:

 - added brackets around macro parameters
 - fixed trailing comma in enum

 Changes since v2:

 - more precise definitions of the hw-strap1 register

 hw/arm/aspeed_soc.c          |  2 ++
 hw/misc/aspeed_scu.c         | 45 +++++++++++++++++++++++++-
 hw/misc/aspeed_sdmc.c        |  1 +
 include/hw/misc/aspeed_scu.h | 75 ++++++++++++++++++++++++++++++++++++++=
++++++
 4 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 07c9c90d7d3b..93bc7bb66e4b 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -38,10 +38,12 @@ static const int uart_irqs[] =3D { 9, 32, 33, 34, 10 =
};
 static const int timer_irqs[] =3D { 16, 17, 18, 35, 36, 37, 38, 39, };
=20
 #define AST2400_SDRAM_BASE       0x40000000
+#define AST2500_SDRAM_BASE       0x80000000
=20
 static const AspeedSoCInfo aspeed_socs[] =3D {
     { "ast2400-a0", "arm926", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE=
 },
     { "ast2400",    "arm926", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE=
 },
+    { "ast2500-a1", "arm1176", AST2500_A1_SILICON_REV, AST2500_SDRAM_BAS=
E },
 };
=20
 /*
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index c7e2c8263f55..b1f3e6f6b87a 100644
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
+    AST2500_A1_SILICON_REV,
+};
=20
 bool is_supported_silicon_rev(uint32_t silicon_rev)
 {
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index fc4217b3ce64..244e5c0dc5ef 100644
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
index 4d3e770cec21..14ffc43de809 100644
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
@@ -154,4 +155,78 @@ extern bool is_supported_silicon_rev(uint32_t silico=
n_rev);
 #define     AST2400_SPI_BOOT                           2
 #define     AST2400_DIS_BOOT                           3
=20
+/*
+ * Hardware strapping register definition (for Aspeed AST2500 SoC and
+ * higher)
+ *
+ * 31     Enable SPI Flash Strap Auto Fetch Mode
+ * 30     Enable GPIO Strap Mode
+ * 29     Select UART Debug Port
+ * 28     Reserved (1)
+ * 27     Enable fast reset mode for ARM ICE debugger
+ * 26     Enable eSPI flash mode
+ * 25     Enable eSPI mode
+ * 24     Select DDR4 SDRAM
+ * 23     Select 25 MHz reference clock input mode
+ * 22     Enable GPIOE pass-through mode
+ * 21     Enable GPIOD pass-through mode
+ * 20     Disable LPC to decode SuperIO 0x2E/0x4E address
+ * 19     Enable ACPI function
+ * 18     Select USBCKI input frequency
+ * 17     Enable BMC 2nd boot watchdog timer
+ * 16     SuperIO configuration address selection
+ * 15     VGA Class Code selection
+ * 14     Select dedicated LPC reset input
+ * 13:12  SPI mode selection
+ * 11:9   AXI/AHB clock frequency ratio selection
+ * 8      Reserved (0)
+ * 7      Define MAC#2 interface
+ * 6      Define MAC#1 interface
+ * 5      Enable dedicated VGA BIOS ROM
+ * 4      Reserved (0)
+ * 3:2    VGA memory size selection
+ * 1      Reserved (1)
+ * 0      Disable CPU boot
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
+#define SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(x)  ((x) << 9)
+#define SCU_AST2500_HW_STRAP_GET_AXI_AHB_RATIO(x)  (((x) >> 9) & 7)
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
 #endif /* ASPEED_SCU_H */
--=20
2.7.4

