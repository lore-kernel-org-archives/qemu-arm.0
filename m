Received: by 10.80.163.71 with SMTP id 65csp1919827edn;
        Tue, 27 Sep 2016 05:18:46 -0700 (PDT)
X-Received: by 10.55.31.76 with SMTP id f73mr25593936qkf.260.1474978726534;
        Tue, 27 Sep 2016 05:18:46 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q16si1426466qta.8.2016.09.27.05.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Sep 2016 05:18:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1borLR-0006U5-Td
	for alex.bennee@linaro.org; Tue, 27 Sep 2016 08:18:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bor78-0001WX-9w
	for qemu-devel@nongnu.org; Tue, 27 Sep 2016 08:04:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bor74-0002yo-C2
	for qemu-devel@nongnu.org; Tue, 27 Sep 2016 08:03:58 -0400
Received: from 1.mo178.mail-out.ovh.net ([178.33.251.53]:52909)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bor74-0002ya-2z
	for qemu-devel@nongnu.org; Tue, 27 Sep 2016 08:03:54 -0400
Received: from player169.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 91AADFFA237
	for <qemu-devel@nongnu.org>; Tue, 27 Sep 2016 14:03:53 +0200 (CEST)
Received: from hermes.kaod.org.com (deibp9eh1--blueice2n7.emea.ibm.com
	[195.212.29.169]) (Authenticated sender: clg@kaod.org)
	by player169.ha.ovh.net (Postfix) with ESMTPSA id 27C40580082;
	Tue, 27 Sep 2016 14:03:47 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 27 Sep 2016 13:57:42 +0200
Message-Id: <1474977462-28032-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1474977462-28032-1-git-send-email-clg@kaod.org>
References: <1474977462-28032-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6929069501860776721
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrudehgdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.251.53
Subject: [Qemu-devel] [PATCH 6/6] aspeed: add support for the SMC segment
 registers
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
X-TUID: ylSo3hoRHlWu

The SMC controller on the Aspeed SoC has a set of registers to
configure the mapping of each flash module in the SoC address
space. Writing to these registers triggers a remap of the memory
region and the spec requires a certain number of checks before doing
so.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 135 ++++++++++++++++++++++++++++++++++++++++++++++=
++++--
 1 file changed, 130 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index ecf39ccfde0e..6e8403ebc246 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -79,10 +79,10 @@
=20
 /* CEx Segment Address Register */
 #define R_SEG_ADDR0       (0x30 / 4)
-#define   SEG_SIZE_SHIFT       24   /* 8MB units */
-#define   SEG_SIZE_MASK        0x7f
+#define   SEG_END_SHIFT        24   /* 8MB units */
+#define   SEG_END_MASK         0xff
 #define   SEG_START_SHIFT      16   /* address bit [A29-A23] */
-#define   SEG_START_MASK       0x7f
+#define   SEG_START_MASK       0xff
 #define R_SEG_ADDR1       (0x34 / 4)
 #define R_SEG_ADDR2       (0x38 / 4)
 #define R_SEG_ADDR3       (0x3C / 4)
@@ -135,8 +135,7 @@
 /*
  * Default segments mapping addresses and size for each slave per
  * controller. These can be changed when board is initialized with the
- * Segment Address Registers but they don't seem do be used on the
- * field.
+ * Segment Address Registers.
  */
 static const AspeedSegments aspeed_segments_legacy[] =3D {
     { 0x10000000, 32 * 1024 * 1024 },
@@ -191,6 +190,118 @@ static const AspeedSMCController controllers[] =3D =
{
       ASPEED_SOC_SPI2_FLASH_BASE, 0x8000000 },
 };
=20
+/*
+ * The Segment Register uses a 8MB unit to encode the start address
+ * and the end address of the mapping window of a flash SPI slave :
+ *
+ *        | byte 1 | byte 2 | byte 3 | byte 4 |
+ *        +--------+--------+--------+--------+
+ *        |  end   |  start |   0    |   0    |
+ *
+ */
+static inline uint32_t aspeed_smc_segment_to_reg(const AspeedSegments *s=
eg)
+{
+    uint32_t reg =3D 0;
+    reg |=3D ((seg->addr >> 23) & SEG_START_MASK) << SEG_START_SHIFT;
+    reg |=3D (((seg->addr + seg->size) >> 23) & SEG_END_MASK) << SEG_END=
_SHIFT;
+    return reg;
+}
+
+static inline void aspeed_smc_reg_to_segment(uint32_t reg, AspeedSegment=
s *seg)
+{
+    seg->addr =3D ((reg >> SEG_START_SHIFT) & SEG_START_MASK) << 23;
+    seg->size =3D (((reg >> SEG_END_SHIFT) & SEG_END_MASK) << 23) - seg-=
>addr;
+}
+
+static bool aspeed_smc_flash_overlap(const AspeedSMCState *s,
+                                     const AspeedSegments *new,
+                                     int cs)
+{
+    AspeedSegments seg;
+    int i;
+
+    for (i =3D 0; i < s->ctrl->max_slaves; i++) {
+        if (i =3D=3D cs) {
+            continue;
+        }
+
+        aspeed_smc_reg_to_segment(s->regs[R_SEG_ADDR0 + i], &seg);
+
+        if (new->addr + new->size > seg.addr &&
+            new->addr < seg.addr + seg.size) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: new segment CS%d [ 0x%"
+                          HWADDR_PRIx" - 0x%"HWADDR_PRIx" ] overlaps wit=
h "
+                          "CS%d [ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\=
n",
+                          s->ctrl->name, cs, new->addr, new->addr + new-=
>size,
+                          i, seg.addr, seg.addr + seg.size);
+            return true;
+        }
+    }
+    return false;
+}
+
+static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
+                                         uint64_t new)
+{
+    AspeedSMCFlash *fl =3D &s->flashes[cs];
+    AspeedSegments seg;
+
+    aspeed_smc_reg_to_segment(new, &seg);
+
+    /* The start address of CS0 is read-only */
+    if (cs =3D=3D 0 && seg.addr !=3D s->ctrl->flash_window_base) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Tried to change CS0 start address to 0x%"
+                      HWADDR_PRIx "\n", s->ctrl->name, seg.addr);
+        return;
+    }
+
+    /*
+     * The end address of the AST2500 spi controllers is also
+     * read-only.
+     */
+    if ((s->ctrl->segments =3D=3D aspeed_segments_ast2500_spi1 ||
+         s->ctrl->segments =3D=3D aspeed_segments_ast2500_spi2) &&
+        cs =3D=3D s->ctrl->max_slaves &&
+        seg.addr + seg.size !=3D s->ctrl->segments[cs].addr +
+        s->ctrl->segments[cs].size) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Tried to change CS%d end address to 0x%"
+                      HWADDR_PRIx "\n", s->ctrl->name, cs, seg.addr);
+        return;
+    }
+
+    /* Keep the segment in the overall flash window */
+    if (seg.addr + seg.size <=3D s->ctrl->flash_window_base ||
+        seg.addr > s->ctrl->flash_window_base + s->ctrl->flash_window_si=
ze) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: new segment for CS%d is inva=
lid : "
+                      "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
+                      s->ctrl->name, cs, seg.addr, seg.addr + seg.size);
+        return;
+    }
+
+    /* Check start address vs. alignment */
+    if (seg.addr % seg.size) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: new segment for CS%d is not =
"
+                      "aligned : [ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]=
\n",
+                      s->ctrl->name, cs, seg.addr, seg.addr + seg.size);
+    }
+
+    /* And segments should not overlap */
+    if (aspeed_smc_flash_overlap(s, &seg, cs)) {
+        return;
+    }
+
+    /* All should be fine now to move the region */
+    memory_region_transaction_begin();
+    memory_region_set_size(&fl->mmio, seg.size);
+    memory_region_set_address(&fl->mmio, seg.addr - s->ctrl->flash_windo=
w_base);
+    memory_region_set_enabled(&fl->mmio, true);
+    memory_region_transaction_commit();
+
+    s->regs[R_SEG_ADDR0 + cs] =3D new;
+}
+
 static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr addr,
                                               unsigned size)
 {
@@ -314,6 +425,12 @@ static void aspeed_smc_reset(DeviceState *d)
         s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
     }
=20
+    /* setup default segment register values for all */
+    for (i =3D 0; i < s->ctrl->max_slaves; ++i) {
+        s->regs[R_SEG_ADDR0 + i] =3D
+            aspeed_smc_segment_to_reg(&s->ctrl->segments[i]);
+    }
+
     aspeed_smc_update_cs(s);
 }
=20
@@ -334,6 +451,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
         addr =3D=3D s->r_timings ||
         addr =3D=3D s->r_ce_ctrl ||
         addr =3D=3D R_INTR_CTRL ||
+        (addr >=3D R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_slav=
es) ||
         (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs)) {
         return s->regs[addr];
     } else {
@@ -365,6 +483,13 @@ static void aspeed_smc_write(void *opaque, hwaddr ad=
dr, uint64_t data,
     } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
         s->regs[addr] =3D value;
         aspeed_smc_update_cs(s);
+    } else if (addr >=3D R_SEG_ADDR0 &&
+               addr < R_SEG_ADDR0 + s->ctrl->max_slaves) {
+        int cs =3D addr - R_SEG_ADDR0;
+
+        if (value !=3D s->regs[R_SEG_ADDR0 + cs]) {
+            aspeed_smc_flash_set_segment(s, cs, value);
+        }
     } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
                       __func__, addr);
--=20
2.7.4

