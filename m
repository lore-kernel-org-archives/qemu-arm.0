Received: by 10.25.21.156 with SMTP id 28csp352649lfv;
        Wed, 27 Jul 2016 09:59:22 -0700 (PDT)
X-Received: by 10.55.12.1 with SMTP id 1mr36778645qkm.136.1469638762724;
        Wed, 27 Jul 2016 09:59:22 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t18si4895997qte.74.2016.07.27.09.59.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jul 2016 09:59:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSSB0-0000Ve-7A
	for alex.bennee@linaro.org; Wed, 27 Jul 2016 12:59:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSRzr-0007Vd-9K
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSRzo-00022a-Ed
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:51 -0400
Received: from 20.mo7.mail-out.ovh.net ([46.105.49.208]:46622)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSRzo-00022M-3S
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:48 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 7FD9DFFCFCB
	for <qemu-devel@nongnu.org>; Wed, 27 Jul 2016 18:47:47 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 23BB85C0086;
	Wed, 27 Jul 2016 18:47:42 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jul 2016 18:46:57 +0200
Message-Id: <1469638018-17590-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469638018-17590-1-git-send-email-clg@kaod.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16551573056239143697
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieehgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.49.208
Subject: [Qemu-devel] [PATCH 5/6] aspeed: add ast2500 support to scu and
 sdmc controllers
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
X-TUID: UPK+3FagWCAi

Based on previous work done by Andrew Jeffery <andrew@aj.id.au>.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_scu.c         | 45 ++++++++++++++++++++++++++++++++++++++=
+++++-
 hw/misc/aspeed_sdmc.c        |  1 +
 include/hw/misc/aspeed_scu.h |  1 +
 3 files changed, 46 insertions(+), 1 deletion(-)

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
index fdfd982288f2..e2e4d1864e34 100644
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
--=20
2.1.4

