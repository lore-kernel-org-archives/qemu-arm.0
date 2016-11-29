Received: by 10.25.150.194 with SMTP id y185csp2417061lfd;
        Tue, 29 Nov 2016 07:56:18 -0800 (PST)
X-Received: by 10.55.143.195 with SMTP id r186mr26954197qkd.152.1480434978535;
        Tue, 29 Nov 2016 07:56:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p3si27822431qtb.90.2016.11.29.07.56.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 07:56:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBklV-00079s-AI
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 10:56:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkbk-00076Y-90
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkbg-00052M-B7
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:12 -0500
Received: from 2.mo1.mail-out.ovh.net ([178.32.119.250]:55936)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkbg-00051m-3L
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:08 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 597A21F909
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:46:05 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id CBDEA1200A0;
	Tue, 29 Nov 2016 16:45:57 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:47 +0100
Message-Id: <1480434248-27138-10-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11726529008380709649
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.119.250
Subject: [Qemu-arm] [PATCH for-2.9 09/30] aspeed: add the definitions for
 the AST2400 A1 SoC
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7rvMbSyJhXzH

There is not much differences with the A0 revision a part from the DDR
calibration.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_soc.c          | 10 ++++++++++
 hw/misc/aspeed_scu.c         |  2 ++
 hw/misc/aspeed_sdmc.c        |  3 +++
 include/hw/misc/aspeed_scu.h |  1 +
 4 files changed, 16 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 233a6b9bf59f..d111d2e1feca 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -59,6 +59,16 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
         .fmc_typename =3D "aspeed.smc.fmc",
         .spi_typename =3D aspeed_soc_ast2400_typenames,
     }, {
+        .name         =3D "ast2400-a1",
+        .cpu_model    =3D "arm926",
+        .silicon_rev  =3D AST2400_A1_SILICON_REV,
+        .sdram_base   =3D AST2400_SDRAM_BASE,
+        .sram_size    =3D 0x8000,
+        .spis_num     =3D 1,
+        .spi_bases    =3D aspeed_soc_ast2400_spi_bases,
+        .fmc_typename =3D "aspeed.smc.fmc",
+        .spi_typename =3D aspeed_soc_ast2400_typenames,
+    }, {
         .name         =3D "ast2400",
         .cpu_model    =3D "arm926",
         .silicon_rev  =3D AST2400_A0_SILICON_REV,
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index b1f3e6f6b87a..34e86385d837 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -231,6 +231,7 @@ static void aspeed_scu_reset(DeviceState *dev)
=20
     switch (s->silicon_rev) {
     case AST2400_A0_SILICON_REV:
+    case AST2400_A1_SILICON_REV:
         reset =3D ast2400_a0_resets;
         break;
     case AST2500_A0_SILICON_REV:
@@ -249,6 +250,7 @@ static void aspeed_scu_reset(DeviceState *dev)
=20
 static uint32_t aspeed_silicon_revs[] =3D {
     AST2400_A0_SILICON_REV,
+    AST2400_A1_SILICON_REV,
     AST2500_A0_SILICON_REV,
     AST2500_A1_SILICON_REV,
 };
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 8830dc084c38..5f3ac0b6f608 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -119,6 +119,7 @@ static void aspeed_sdmc_write(void *opaque, hwaddr ad=
dr, uint64_t data,
         /* Make sure readonly bits are kept */
         switch (s->silicon_rev) {
         case AST2400_A0_SILICON_REV:
+        case AST2400_A1_SILICON_REV:
             data &=3D ~ASPEED_SDMC_READONLY_MASK;
             break;
         case AST2500_A0_SILICON_REV:
@@ -193,6 +194,7 @@ static void aspeed_sdmc_reset(DeviceState *dev)
     /* Set ram size bit and defaults values */
     switch (s->silicon_rev) {
     case AST2400_A0_SILICON_REV:
+    case AST2400_A1_SILICON_REV:
         s->regs[R_CONF] |=3D
             ASPEED_SDMC_VGA_COMPAT |
             ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
@@ -224,6 +226,7 @@ static void aspeed_sdmc_realize(DeviceState *dev, Err=
or **errp)
=20
     switch (s->silicon_rev) {
     case AST2400_A0_SILICON_REV:
+    case AST2400_A1_SILICON_REV:
         s->ram_bits =3D ast2400_rambits(s);
         break;
     case AST2500_A0_SILICON_REV:
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 14ffc43de809..bd4ac013f997 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -32,6 +32,7 @@ typedef struct AspeedSCUState {
 } AspeedSCUState;
=20
 #define AST2400_A0_SILICON_REV   0x02000303U
+#define AST2400_A1_SILICON_REV   0x02010303U
 #define AST2500_A0_SILICON_REV   0x04000303U
 #define AST2500_A1_SILICON_REV   0x04010303U
=20
--=20
2.7.4

