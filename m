Received: by 10.25.150.194 with SMTP id y185csp2427501lfd;
        Tue, 29 Nov 2016 08:14:49 -0800 (PST)
X-Received: by 10.237.42.65 with SMTP id k1mr24705957qtf.210.1480436089853;
        Tue, 29 Nov 2016 08:14:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t73si35267453qki.337.2016.11.29.08.14.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 08:14:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37856 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBl3Q-00061N-Cx
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 11:14:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkdR-0008TR-00
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkdP-0005k3-5b
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:57 -0500
Received: from 11.mo1.mail-out.ovh.net ([188.165.48.29]:59199)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkdO-0005jo-VM
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:55 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id A1FB71F954
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:47:53 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id E2B9712007A;
	Tue, 29 Nov 2016 16:47:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:44:01 +0100
Message-Id: <1480434248-27138-24-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11756928304069970705
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.48.29
Subject: [Qemu-arm] [PATCH for-2.9 23/30] aspeed/smc: adjust the size of the
 register region
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
X-TUID: YadZvEamcZ+q

The SPI controller of the AST2400 SoC has less registers. So we can
adjust the size of the memory region holding the registers depending
on the controller type. We can also remove the guest_error logging
which is useless as the range of the region is strict enough.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/ssi/aspeed_smc.c         | 25 ++++++++++---------------
 include/hw/ssi/aspeed_smc.h |  1 +
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 733fd8b09c06..2d1e604ca3e7 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -135,6 +135,9 @@
 #define R_SPI_MISC_CTRL   (0x10 / 4)
 #define R_SPI_TIMINGS     (0x14 / 4)
=20
+#define ASPEED_SMC_R_SPI_MAX (0x20 / 4)
+#define ASPEED_SMC_R_SMC_MAX (0x20 / 4)
+
 #define ASPEED_SOC_SMC_FLASH_BASE   0x10000000
 #define ASPEED_SOC_FMC_FLASH_BASE   0x20000000
 #define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
@@ -209,6 +212,7 @@ static const AspeedSMCController controllers[] =3D {
         .flash_window_base =3D ASPEED_SOC_SMC_FLASH_BASE,
         .flash_window_size =3D 0x6000000,
         .has_dma           =3D false,
+        .nregs             =3D ASPEED_SMC_R_SMC_MAX,
     }, {
         .name              =3D "aspeed.smc.fmc",
         .r_conf            =3D R_CONF,
@@ -221,6 +225,7 @@ static const AspeedSMCController controllers[] =3D {
         .flash_window_base =3D ASPEED_SOC_FMC_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
         .has_dma           =3D true,
+        .nregs             =3D ASPEED_SMC_R_MAX,
     }, {
         .name              =3D "aspeed.smc.spi",
         .r_conf            =3D R_SPI_CONF,
@@ -233,6 +238,7 @@ static const AspeedSMCController controllers[] =3D {
         .flash_window_base =3D ASPEED_SOC_SPI_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
         .has_dma           =3D false,
+        .nregs             =3D ASPEED_SMC_R_SPI_MAX,
     }, {
         .name              =3D "aspeed.smc.ast2500-fmc",
         .r_conf            =3D R_CONF,
@@ -245,6 +251,7 @@ static const AspeedSMCController controllers[] =3D {
         .flash_window_base =3D ASPEED_SOC_FMC_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
         .has_dma           =3D true,
+        .nregs             =3D ASPEED_SMC_R_MAX,
     }, {
         .name              =3D "aspeed.smc.ast2500-spi1",
         .r_conf            =3D R_CONF,
@@ -257,6 +264,7 @@ static const AspeedSMCController controllers[] =3D {
         .flash_window_base =3D ASPEED_SOC_SPI_FLASH_BASE,
         .flash_window_size =3D 0x8000000,
         .has_dma           =3D false,
+        .nregs             =3D ASPEED_SMC_R_MAX,
     }, {
         .name              =3D "aspeed.smc.ast2500-spi2",
         .r_conf            =3D R_CONF,
@@ -269,6 +277,7 @@ static const AspeedSMCController controllers[] =3D {
         .flash_window_base =3D ASPEED_SOC_SPI2_FLASH_BASE,
         .flash_window_size =3D 0x8000000,
         .has_dma           =3D false,
+        .nregs             =3D ASPEED_SMC_R_MAX,
     },
 };
=20
@@ -713,13 +722,6 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr=
 addr, unsigned int size)
=20
     addr >>=3D 2;
=20
-    if (addr >=3D ARRAY_SIZE(s->regs)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Out-of-bounds read at 0x%" HWADDR_PRIx "\n",
-                      __func__, addr);
-        return 0;
-    }
-
     if (addr =3D=3D s->r_conf ||
         addr =3D=3D s->r_timings ||
         addr =3D=3D s->r_ce_ctrl ||
@@ -943,13 +945,6 @@ static void aspeed_smc_write(void *opaque, hwaddr ad=
dr, uint64_t data,
=20
     addr >>=3D 2;
=20
-    if (addr >=3D ARRAY_SIZE(s->regs)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Out-of-bounds write at 0x%" HWADDR_PRIx "\n",
-                      __func__, addr);
-        return;
-    }
-
     if (addr =3D=3D s->r_conf ||
         addr =3D=3D s->r_timings ||
         addr =3D=3D s->r_ce_ctrl) {
@@ -1031,7 +1026,7 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
=20
     /* The memory region for the controller registers */
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
-                          s->ctrl->name, ASPEED_SMC_R_MAX * 4);
+                          s->ctrl->name, s->ctrl->nregs * 4);
     sysbus_init_mmio(sbd, &s->mmio);
=20
     /*
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 3ae0a369073d..91bad82e9c65 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -45,6 +45,7 @@ typedef struct AspeedSMCController {
     hwaddr flash_window_base;
     uint32_t flash_window_size;
     bool has_dma;
+    uint32_t nregs;
 } AspeedSMCController;
=20
 typedef struct AspeedSMCFlash {
--=20
2.7.4

