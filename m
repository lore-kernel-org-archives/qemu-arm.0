Received: by 10.25.21.156 with SMTP id 28csp320932lfv;
        Fri, 8 Jul 2016 09:08:22 -0700 (PDT)
X-Received: by 10.129.145.136 with SMTP id i130mr5016939ywg.1.1467994100573;
        Fri, 08 Jul 2016 09:08:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si2053543qkk.34.2016.07.08.09.08.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jul 2016 09:08:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46607 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bLYKB-0000EJ-RW
	for alex.bennee@linaro.org; Fri, 08 Jul 2016 12:08:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bLYK2-00008u-65
	for qemu-arm@nongnu.org; Fri, 08 Jul 2016 12:08:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bLYJx-0002Lt-JU
	for qemu-arm@nongnu.org; Fri, 08 Jul 2016 12:08:10 -0400
Received: from 10.mo179.mail-out.ovh.net ([46.105.79.46]:33077)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bLYJx-0002Ld-Dh
	for qemu-arm@nongnu.org; Fri, 08 Jul 2016 12:08:05 -0400
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 2D198100C44F
	for <qemu-arm@nongnu.org>; Fri,  8 Jul 2016 18:08:04 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player715.ha.ovh.net (Postfix) with ESMTPSA id C687A1C0076;
	Fri,  8 Jul 2016 18:07:57 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri,  8 Jul 2016 18:06:55 +0200
Message-Id: <1467994016-11678-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467994016-11678-1-git-send-email-clg@kaod.org>
References: <1467994016-11678-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14980098261715880721
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrfedtgdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.79.46
Subject: [Qemu-arm] [PATCH 4/5] ast2400: externalize revision numbers
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
X-TUID: MRFseh+UGO2M

AST2400_A0_SILICON_REV is defined twice. Fix this by including the
definition in the header file as well as the routine to check if a
silicon revision is supported. It will useful to reuse in other
controllers.

Let's add also AST2500_A0_SILICON_REV for future use.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/ast2400.c             | 2 --
 hw/misc/aspeed_scu.c         | 4 +---
 include/hw/misc/aspeed_scu.h | 5 +++++
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index 055584362073..326fdb36eed5 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -34,8 +34,6 @@
 #define AST2400_FMC_FLASH_BASE   0x20000000
 #define AST2400_SPI_FLASH_BASE   0x30000000
=20
-#define AST2400_A0_SILICON_REV   0x02000303
-
 static const int uart_irqs[] =3D { 9, 32, 33, 34, 10 };
 static const int timer_irqs[] =3D { 16, 17, 18, 35, 36, 37, 38, 39, };
=20
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index b61c05ea4dbc..c7e2c8263f55 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -88,8 +88,6 @@
 #define PROT_KEY_UNLOCK 0x1688A8A8
 #define SCU_IO_REGION_SIZE 0x20000
=20
-#define AST2400_A0_SILICON_REV     0x02000303U
-
 static const uint32_t ast2400_a0_resets[ASPEED_SCU_NR_REGS] =3D {
      [SYS_RST_CTRL]    =3D 0xFFCFFEDCU,
      [CLK_SEL]         =3D 0xF3F40000U,
@@ -212,7 +210,7 @@ static void aspeed_scu_reset(DeviceState *dev)
=20
 static uint32_t aspeed_silicon_revs[] =3D { AST2400_A0_SILICON_REV, };
=20
-static bool is_supported_silicon_rev(uint32_t silicon_rev)
+bool is_supported_silicon_rev(uint32_t silicon_rev)
 {
     int i;
=20
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 6b8e46f85fad..fdfd982288f2 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -31,4 +31,9 @@ typedef struct AspeedSCUState {
     uint32_t hw_strap2;
 } AspeedSCUState;
=20
+#define AST2400_A0_SILICON_REV   0x02000303U
+#define AST2500_A0_SILICON_REV   0x04000303U
+
+extern bool is_supported_silicon_rev(uint32_t silicon_rev);
+
 #endif /* ASPEED_SCU_H */
--=20
2.1.4

