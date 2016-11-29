Received: by 10.25.150.194 with SMTP id y185csp2422471lfd;
        Tue, 29 Nov 2016 08:06:02 -0800 (PST)
X-Received: by 10.200.42.170 with SMTP id b39mr27031825qta.55.1480435562876;
        Tue, 29 Nov 2016 08:06:02 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b18si27876279qtc.75.2016.11.29.08.06.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 08:06:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkuv-0006NV-FO
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 11:06:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkcj-0007tb-Tg
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:47:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkcf-0005Ww-OV
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:47:13 -0500
Received: from 10.mo1.mail-out.ovh.net ([178.32.96.102]:51825)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkcf-0005Wn-F5
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:47:09 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 24A3D1F889
	for <qemu-devel@nongnu.org>; Tue, 29 Nov 2016 16:47:08 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 442521200A8;
	Tue, 29 Nov 2016 16:47:00 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:55 +0100
Message-Id: <1480434248-27138-18-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11743980454236031761
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.96.102
Subject: [Qemu-devel] [PATCH for-2.9 17/30] aspeed/smc: handle SPI flash
 Command mode
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mdWdO4q30TEY

The Aspeed SMC controllers have a mode (Command mode) in which
accesses to the flash content are no different than doing MMIOs. The
controller generates all the necessary commands to load (or store)
data in memory.

However, accesses are restricted to the segment window assigned the
the flash module by the controller. This window is defined by the
Segment Address Register.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/ssi/aspeed_smc.c | 174 ++++++++++++++++++++++++++++++++++++++++++++++=
++----
 1 file changed, 162 insertions(+), 12 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 72a44150b0a1..eec087199a22 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -69,6 +69,7 @@
 #define R_CTRL0           (0x10 / 4)
 #define   CTRL_CMD_SHIFT           16
 #define   CTRL_CMD_MASK            0xff
+#define   CTRL_AST2400_SPI_4BYTE   (1 << 13)
 #define   CTRL_CE_STOP_ACTIVE      (1 << 2)
 #define   CTRL_CMD_MODE_MASK       0x3
 #define     CTRL_READMODE          0x0
@@ -135,6 +136,16 @@
 #define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
 #define ASPEED_SOC_SPI2_FLASH_BASE  0x38000000
=20
+/* Flash opcodes. */
+#define SPI_OP_READ       0x03    /* Read data bytes (low frequency) */
+#define SPI_OP_WRDI       0x04    /* Write disable */
+#define SPI_OP_RDSR       0x05    /* Read status register */
+#define SPI_OP_WREN       0x06    /* Write enable */
+
+/* Used for Macronix and Winbond flashes. */
+#define SPI_OP_EN4B       0xb7    /* Enter 4-byte mode */
+#define SPI_OP_EX4B       0xe9    /* Exit 4-byte mode */
+
 /*
  * Default segments mapping addresses and size for each slave per
  * controller. These can be changed when board is initialized with the
@@ -357,6 +368,98 @@ static inline bool aspeed_smc_is_writable(const Aspe=
edSMCFlash *fl)
     return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + fl->id));
 }
=20
+static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s =3D fl->controller;
+    int cmd =3D (s->regs[s->r_ctrl0 + fl->id] >> CTRL_CMD_SHIFT) & CTRL_=
CMD_MASK;
+
+    /* This is the default value for read mode. In other modes, the
+     * command should be defined */
+    if (aspeed_smc_flash_mode(fl) =3D=3D CTRL_READMODE) {
+        cmd =3D SPI_OP_READ;
+    }
+
+    if (!cmd) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no command defined for mode =
%d\n",
+                      __func__, aspeed_smc_flash_mode(fl));
+    }
+
+    return cmd;
+}
+
+static inline int aspeed_smc_flash_is_4byte(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s =3D fl->controller;
+
+    if (s->ctrl->segments =3D=3D aspeed_segments_spi) {
+        return s->regs[s->r_ctrl0] & CTRL_AST2400_SPI_4BYTE;
+    } else {
+        return s->regs[s->r_ce_ctrl] & (1 << (CTRL_EXTENDED0 + fl->id));
+    }
+}
+
+static void aspeed_smc_flash_select(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s =3D fl->controller;
+
+    s->regs[s->r_ctrl0 + fl->id] &=3D ~CTRL_CE_STOP_ACTIVE;
+    qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
+}
+
+static void aspeed_smc_flash_unselect(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s =3D fl->controller;
+
+    s->regs[s->r_ctrl0 + fl->id] |=3D CTRL_CE_STOP_ACTIVE;
+    qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
+}
+
+static uint32_t aspeed_smc_check_segment_addr(AspeedSMCFlash *fl, uint32=
_t addr)
+{
+    AspeedSMCState *s =3D fl->controller;
+    AspeedSegments seg;
+
+    aspeed_smc_reg_to_segment(s->regs[R_SEG_ADDR0 + fl->id], &seg);
+    if ((addr & (seg.size - 1)) !=3D addr) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid address 0x%08x for CS%d segment : "
+                      "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
+                      s->ctrl->name, addr, fl->id, seg.addr,
+                      seg.addr + seg.size);
+    }
+
+    addr &=3D seg.size - 1;
+    return addr;
+}
+
+static void aspeed_smc_flash_setup_read(AspeedSMCFlash *fl, uint32_t add=
r)
+{
+    AspeedSMCState *s =3D fl->controller;
+    uint8_t cmd =3D aspeed_smc_flash_cmd(fl);
+
+    /*
+     * To be checked: I am not sure the Aspeed SPI controller needs to
+     * enable writes when running in READ/FREAD command mode
+     */
+
+    /* access can not exceed CS segment */
+    addr =3D aspeed_smc_check_segment_addr(fl, addr);
+
+    /* TODO: do we have to send 4BYTE each time ? */
+    if (aspeed_smc_flash_is_4byte(fl)) {
+        ssi_transfer(s->spi, SPI_OP_EN4B);
+    }
+
+    ssi_transfer(s->spi, cmd);
+
+    if (aspeed_smc_flash_is_4byte(fl)) {
+        ssi_transfer(s->spi, (addr >> 24) & 0xff);
+    }
+    ssi_transfer(s->spi, (addr >> 16) & 0xff);
+    ssi_transfer(s->spi, (addr >> 8) & 0xff);
+    ssi_transfer(s->spi, (addr & 0xff));
+}
+
 static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigne=
d size)
 {
     AspeedSMCFlash *fl =3D opaque;
@@ -364,19 +467,55 @@ static uint64_t aspeed_smc_flash_read(void *opaque,=
 hwaddr addr, unsigned size)
     uint64_t ret =3D 0;
     int i;
=20
-    if (aspeed_smc_is_usermode(fl)) {
+    switch (aspeed_smc_flash_mode(fl)) {
+    case CTRL_USERMODE:
         for (i =3D 0; i < size; i++) {
             ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
         }
-    } else {
-        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
-                      __func__);
-        ret =3D -1;
+        break;
+    case CTRL_READMODE:
+    case CTRL_FREADMODE:
+        aspeed_smc_flash_select(fl);
+        aspeed_smc_flash_setup_read(fl, addr);
+
+        for (i =3D 0; i < size; i++) {
+            ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
+        }
+
+        aspeed_smc_flash_unselect(fl);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid flash mode %d\n",
+                      __func__, aspeed_smc_flash_mode(fl));
     }
=20
     return ret;
 }
=20
+static void aspeed_smc_flash_setup_write(AspeedSMCFlash *fl, uint32_t ad=
dr)
+{
+    AspeedSMCState *s =3D fl->controller;
+    uint8_t cmd =3D aspeed_smc_flash_cmd(fl);
+
+    /* Flash access can not exceed CS segment */
+    addr =3D aspeed_smc_check_segment_addr(fl, addr);
+
+    /* TODO: do we have to send 4BYTE each time ? */
+    if (aspeed_smc_flash_is_4byte(fl)) {
+        ssi_transfer(s->spi, SPI_OP_EN4B);
+    }
+
+    ssi_transfer(s->spi, SPI_OP_WREN);
+    ssi_transfer(s->spi, cmd);
+
+    if (aspeed_smc_flash_is_4byte(fl)) {
+        ssi_transfer(s->spi, (addr >> 24) & 0xff);
+    }
+    ssi_transfer(s->spi, (addr >> 16) & 0xff);
+    ssi_transfer(s->spi, (addr >> 8) & 0xff);
+    ssi_transfer(s->spi, (addr & 0xff));
+}
+
 static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t d=
ata,
                            unsigned size)
 {
@@ -390,14 +529,25 @@ static void aspeed_smc_flash_write(void *opaque, hw=
addr addr, uint64_t data,
         return;
     }
=20
-    if (!aspeed_smc_is_usermode(fl)) {
-        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
-                      __func__);
-        return;
-    }
+    switch (aspeed_smc_flash_mode(fl)) {
+    case CTRL_USERMODE:
+        for (i =3D 0; i < size; i++) {
+            ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
+        }
+        break;
+    case CTRL_WRITEMODE:
+        aspeed_smc_flash_select(fl);
+        aspeed_smc_flash_setup_write(fl, addr);
+
+        for (i =3D 0; i < size; i++) {
+            ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
+        }
=20
-    for (i =3D 0; i < size; i++) {
-        ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
+        aspeed_smc_flash_unselect(fl);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid flash mode %d\n",
+                      __func__, aspeed_smc_flash_mode(fl));
     }
 }
=20
--=20
2.7.4

