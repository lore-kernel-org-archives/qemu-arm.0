Received: by 10.25.150.194 with SMTP id y185csp2427415lfd;
        Tue, 29 Nov 2016 08:14:41 -0800 (PST)
X-Received: by 10.233.216.71 with SMTP id u68mr27430309qkf.161.1480436080947;
        Tue, 29 Nov 2016 08:14:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f67si35279739qkj.69.2016.11.29.08.14.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 08:14:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBl3H-0005tT-HV
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 11:14:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkdI-0008NG-VW
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkdH-0005iC-QG
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:49 -0500
Received: from 16.mo1.mail-out.ovh.net ([178.33.104.224]:51073)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkdH-0005hy-Fn
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:47 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 34A5D1F922
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:47:46 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 45A7C1200B4;
	Tue, 29 Nov 2016 16:47:38 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:44:00 +0100
Message-Id: <1480434248-27138-23-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11754676504539794193
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.104.224
Subject: [Qemu-arm] [PATCH for-2.9 22/30] aspeed/smc: handle dummy bytes
 when doing fast reads
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
X-TUID: 09JdMd/dL/qM

When doing fast read, a certain amount of dummy bytes should be sent
before the read. This number is configurable in the controler CE0
Control Register and needs to be modeled using fake transfers the
flash module.

When the controller is configured for Command mode, the SPI command
used to do the read is stored in the CE0 control register but, in User
mode, we need to snoop into the flow of bytes to catch the command. It
should be the first byte after CS select.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/ssi/aspeed_smc.c         | 58 ++++++++++++++++++++++++++++++++++++++-=
------
 include/hw/ssi/aspeed_smc.h |  1 +
 2 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 9596ea94a3bc..733fd8b09c06 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -71,7 +71,9 @@
 #define R_CTRL0           (0x10 / 4)
 #define   CTRL_CMD_SHIFT           16
 #define   CTRL_CMD_MASK            0xff
+#define   CTRL_DUMMY_HIGH_SHIFT    14
 #define   CTRL_AST2400_SPI_4BYTE   (1 << 13)
+#define   CTRL_DUMMY_LOW_SHIFT     6 /* 2 bits [7:6] */
 #define   CTRL_CE_STOP_ACTIVE      (1 << 2)
 #define   CTRL_CMD_MODE_MASK       0x3
 #define     CTRL_READMODE          0x0
@@ -151,6 +153,7 @@
 #define SPI_OP_WRDI       0x04    /* Write disable */
 #define SPI_OP_RDSR       0x05    /* Read status register */
 #define SPI_OP_WREN       0x06    /* Write enable */
+#define SPI_OP_READ_FAST  0x0b    /* Read data bytes (high frequency) */
=20
 /* Used for Macronix and Winbond flashes. */
 #define SPI_OP_EN4B       0xb7    /* Enter 4-byte mode */
@@ -510,6 +513,12 @@ static void aspeed_smc_flash_setup_read(AspeedSMCFla=
sh *fl, uint32_t addr)
     /* access can not exceed CS segment */
     addr =3D aspeed_smc_check_segment_addr(fl, addr);
=20
+    /*
+     * Remember command as we might need to send dummy bytes before
+     * reading data
+     */
+    fl->cmd =3D cmd;
+
     /* TODO: do we have to send 4BYTE each time ? */
     if (aspeed_smc_flash_is_4byte(fl)) {
         ssi_transfer(s->spi, SPI_OP_EN4B);
@@ -525,27 +534,50 @@ static void aspeed_smc_flash_setup_read(AspeedSMCFl=
ash *fl, uint32_t addr)
     ssi_transfer(s->spi, (addr & 0xff));
 }
=20
+static int aspeed_smc_flash_dummies(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s =3D fl->controller;
+    uint32_t r_ctrl0 =3D s->regs[s->r_ctrl0 + fl->id];
+    uint32_t dummy_high =3D (r_ctrl0 >> CTRL_DUMMY_HIGH_SHIFT) & 0x1;
+    uint32_t dummy_low =3D (r_ctrl0 >> CTRL_DUMMY_LOW_SHIFT) & 0x3;
+
+    return ((dummy_high << 2) | dummy_low) * 8;
+}
+
+static uint64_t aspeed_smc_flash_do_read(AspeedSMCFlash *fl, unsigned si=
ze)
+{
+    AspeedSMCState *s =3D fl->controller;
+    uint64_t ret =3D 0;
+    int i;
+
+    if (fl->cmd =3D=3D SPI_OP_READ_FAST) {
+        for (i =3D 0; i < aspeed_smc_flash_dummies(fl); i++) {
+            ssi_transfer(s->spi, 0x0);
+        }
+    }
+    fl->cmd =3D 0;
+
+    for (i =3D 0; i < size; i++) {
+        ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
+    }
+    return ret;
+}
+
 static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigne=
d size)
 {
     AspeedSMCFlash *fl =3D opaque;
-    const AspeedSMCState *s =3D fl->controller;
     uint64_t ret =3D 0;
-    int i;
=20
     switch (aspeed_smc_flash_mode(fl)) {
     case CTRL_USERMODE:
-        for (i =3D 0; i < size; i++) {
-            ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
-        }
+        ret =3D aspeed_smc_flash_do_read(fl, size);
         break;
     case CTRL_READMODE:
     case CTRL_FREADMODE:
         aspeed_smc_flash_select(fl);
         aspeed_smc_flash_setup_read(fl, addr);
=20
-        for (i =3D 0; i < size; i++) {
-            ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
-        }
+        ret =3D aspeed_smc_flash_do_read(fl, size);
=20
         aspeed_smc_flash_unselect(fl);
         break;
@@ -596,6 +628,15 @@ static void aspeed_smc_flash_write(void *opaque, hwa=
ddr addr, uint64_t data,
=20
     switch (aspeed_smc_flash_mode(fl)) {
     case CTRL_USERMODE:
+        /*
+         * First write after chip select is the chip command. Remember
+         * it as we might need to send dummy bytes before reading
+         * data. It will be reseted when the chip is unselected.
+         */
+        if (!fl->cmd) {
+            fl->cmd =3D data & 0xff;
+        }
+
         for (i =3D 0; i < size; i++) {
             ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
         }
@@ -629,6 +670,7 @@ static const MemoryRegionOps aspeed_smc_flash_ops =3D=
 {
 static void aspeed_smc_flash_update_cs(AspeedSMCFlash *fl)
 {
     AspeedSMCState *s =3D fl->controller;
+    fl->cmd =3D 0;
     qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
 }
=20
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 88a904849801..3ae0a369073d 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -52,6 +52,7 @@ typedef struct AspeedSMCFlash {
=20
     uint8_t id;
     uint32_t size;
+    uint8_t cmd;
=20
     MemoryRegion mmio;
     DeviceState *flash;
--=20
2.7.4

