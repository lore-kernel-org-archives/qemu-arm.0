Received: by 10.25.150.194 with SMTP id y185csp2418272lfd;
        Tue, 29 Nov 2016 07:59:01 -0800 (PST)
X-Received: by 10.55.118.65 with SMTP id r62mr27171619qkc.21.1480435141013;
        Tue, 29 Nov 2016 07:59:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o8si35178099qkh.138.2016.11.29.07.59.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 07:59:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBko7-0001BE-KV
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 10:58:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkcO-0007cC-Am
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkcI-0005Nn-4h
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:52 -0500
Received: from 3.mo1.mail-out.ovh.net ([46.105.60.232]:43321)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkcH-0005NB-Tx
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:46 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 551791F412
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:46:44 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id D0BCE12007A;
	Tue, 29 Nov 2016 16:46:35 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:52 +0100
Message-Id: <1480434248-27138-15-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11737225054715611921
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.60.232
Subject: [Qemu-arm] [PATCH for-2.9 14/30] aspeed/smc: rework the prototype
 of the AspeedSMCFlash helper routines
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
X-TUID: ZDvDoKIpbvcY

Change the routines prototype to use a 'AspeedSMCFlash *' instead of
'AspeedSMCState *'. The result will help in making future changes
clearer.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/ssi/aspeed_smc.c         | 36 ++++++++++++++++++++++++------------
 include/hw/ssi/aspeed_smc.h |  2 +-
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 78f5aed53247..66622f198a2f 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -328,19 +328,30 @@ static const MemoryRegionOps aspeed_smc_flash_defau=
lt_ops =3D {
     },
 };
=20
-static inline int aspeed_smc_flash_mode(const AspeedSMCState *s, int cs)
+static inline int aspeed_smc_flash_mode(const AspeedSMCFlash *fl)
 {
-    return s->regs[s->r_ctrl0 + cs] & CTRL_CMD_MODE_MASK;
+    AspeedSMCState *s =3D fl->controller;
+
+    return s->regs[s->r_ctrl0 + fl->id] & CTRL_CMD_MODE_MASK;
+}
+
+static inline bool aspeed_smc_is_usermode(const AspeedSMCFlash *fl)
+{
+    return aspeed_smc_flash_mode(fl) =3D=3D CTRL_USERMODE;
 }
=20
-static inline bool aspeed_smc_is_usermode(const AspeedSMCState *s, int c=
s)
+static inline bool aspeed_smc_is_ce_stop_active(const AspeedSMCFlash *fl=
)
 {
-    return aspeed_smc_flash_mode(s, cs) =3D=3D CTRL_USERMODE;
+    AspeedSMCState *s =3D fl->controller;
+
+    return s->regs[s->r_ctrl0 + fl->id] & CTRL_CE_STOP_ACTIVE;
 }
=20
-static inline bool aspeed_smc_is_writable(const AspeedSMCState *s, int c=
s)
+static inline bool aspeed_smc_is_writable(const AspeedSMCFlash *fl)
 {
-    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + cs));
+    AspeedSMCState *s =3D fl->controller;
+
+    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + fl->id));
 }
=20
 static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigne=
d size)
@@ -350,7 +361,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, h=
waddr addr, unsigned size)
     uint64_t ret =3D 0;
     int i;
=20
-    if (aspeed_smc_is_usermode(s, fl->id)) {
+    if (aspeed_smc_is_usermode(fl)) {
         for (i =3D 0; i < size; i++) {
             ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
         }
@@ -370,13 +381,13 @@ static void aspeed_smc_flash_write(void *opaque, hw=
addr addr, uint64_t data,
     const AspeedSMCState *s =3D fl->controller;
     int i;
=20
-    if (!aspeed_smc_is_writable(s, fl->id)) {
+    if (!aspeed_smc_is_writable(fl)) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: flash is not writable at 0x%=
"
                       HWADDR_PRIx "\n", __func__, addr);
         return;
     }
=20
-    if (!aspeed_smc_is_usermode(s, fl->id)) {
+    if (!aspeed_smc_is_usermode(fl)) {
         qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
                       __func__);
         return;
@@ -397,9 +408,10 @@ static const MemoryRegionOps aspeed_smc_flash_ops =3D=
 {
     },
 };
=20
-static bool aspeed_smc_is_ce_stop_active(const AspeedSMCState *s, int cs=
)
+static void aspeed_smc_flash_update_cs(AspeedSMCFlash *fl)
 {
-    return s->regs[s->r_ctrl0 + cs] & CTRL_CE_STOP_ACTIVE;
+    AspeedSMCState *s =3D fl->controller;
+    qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
 }
=20
 static void aspeed_smc_update_cs(const AspeedSMCState *s)
@@ -407,7 +419,7 @@ static void aspeed_smc_update_cs(const AspeedSMCState=
 *s)
     int i;
=20
     for (i =3D 0; i < s->num_cs; ++i) {
-        qemu_set_irq(s->cs_lines[i], aspeed_smc_is_ce_stop_active(s, i))=
;
+        aspeed_smc_flash_update_cs(&s->flashes[i]);
     }
 }
=20
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index bdfbcc0ffa7d..c64954f6103f 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -47,7 +47,7 @@ typedef struct AspeedSMCController {
 } AspeedSMCController;
=20
 typedef struct AspeedSMCFlash {
-    const struct AspeedSMCState *controller;
+    struct AspeedSMCState *controller;
=20
     uint8_t id;
     uint32_t size;
--=20
2.7.4

