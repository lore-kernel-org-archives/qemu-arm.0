Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp897911wrp;
        Wed, 25 Sep 2019 07:54:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqynN7sWZweYoTJr/1rwfZ2OUUtQazBNsczLiXlqDpeSP9YVhuWY83bAYz6t/lqayiCmNvup
X-Received: by 2002:a17:906:3281:: with SMTP id 1mr4494877ejw.181.1569423294527;
        Wed, 25 Sep 2019 07:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569423294; cv=none;
        d=google.com; s=arc-20160816;
        b=NbKvIKe48CxhRkzeE8MV60LUjnmuNBLLx3gi8DyYj9RCB7umumvUSE/0QdnpEz9p2C
         Hj1/Ee5KDmFnd3pVaK6ntwBWSDnb1XrNUg+p9D9Snrh5eS9LAYhaux7eKCZXXBMqCQiW
         +tkO8HObewPzhQ0jzK2Ga6T4COjJ9UAtV81jxDuEapL9lzGD7Z6EiJYMhDtEFVtWJG72
         mXgt2bV66o7qWOD6L5DWVKYtPhd9/lvVEZ/8y0yu0nv6kMG1+V2mAif02rssIvSuXTXV
         IO/FxGdc0QPyPrmcgSjTLn75VVJEijoUTP+ZhlFKQiC/aD9QQEbBcqm+1BnQ2RJpwsCn
         FO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=LHJmBRg/PxjlZAdcZr2BaSKrtZ5ISV7jic3Q0Nyg+Lo=;
        b=oWu95GefiafIzs7arCctTpdkEPTGs5kcm5dRacLm3mw9YeEkYcN5hnN8hZ0ms5NdX6
         Buh/1kJCW0PL+4mYwyOa8hD7qn+wg3Sh4wZ/GhpiXnKrqMg7na8PET6hrASgOHP1j63Y
         Umydvf1xiga3ctFONQm96dK3ygr0RfX6QI+ECREXzAIAGpyiCGxGb4vl3nFkcJvYdKmq
         lBZPTDGDWFZT24cx6AXO9MgUW95LExi56bM56+RNyWoiYP0aB3OP6hLuQSDK6gi7JMW/
         Q14UdfVHF/u6IuSiF+r/H+6umTJC+5nAMercvDxBZruTYBFJNyEvJkE7DcVP7mYvKH13
         u2Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si2858095ejz.22.2019.09.25.07.54.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 07:54:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD8gu-0007Zt-RN
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 10:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52634)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8NE-0004F4-Jk
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:34:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8NA-0001G0-GC
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:34:32 -0400
Received: from 6.mo177.mail-out.ovh.net ([46.105.51.249]:39793)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8NA-0001FZ-7d
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:34:28 -0400
Received: from player786.ha.ovh.net (unknown [10.109.160.62])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id A78E91098B2
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 16:34:26 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id DE402A4D3F82;
 Wed, 25 Sep 2019 14:34:19 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 12/23] aspeed/smc: Introduce segment operations
Date: Wed, 25 Sep 2019 16:32:37 +0200
Message-Id: <20190925143248.10000-13-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
References: <20190925143248.10000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8859143418346310417
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.51.249
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 260Goo/d+1TW

AST2600 will use a different encoding for the addresses defined in the
Segment Register.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  4 ++++
 hw/ssi/aspeed_smc.c         | 45 ++++++++++++++++++++++++-------------
 2 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 5176ff6bf95f..684d16e33613 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -49,6 +49,10 @@ typedef struct AspeedSMCController {
     hwaddr dma_flash_mask;
     hwaddr dma_dram_mask;
     uint32_t nregs;
+    uint32_t (*segment_to_reg)(const struct AspeedSMCState *s,
+                               const AspeedSegments *seg);
+    void (*reg_to_segment)(const struct AspeedSMCState *s, uint32_t reg,
+                           AspeedSegments *seg);
 } AspeedSMCController;
=20
 typedef struct AspeedSMCFlash {
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 9ffc7e01179a..9909135a2cfe 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -211,6 +211,10 @@ static const AspeedSegments aspeed_segments_ast2500_=
spi2[] =3D {
     { 0x38000000, 32 * 1024 * 1024 }, /* start address is readonly */
     { 0x3A000000, 96 * 1024 * 1024 }, /* end address is readonly */
 };
+static uint32_t aspeed_smc_segment_to_reg(const AspeedSMCState *s,
+                                          const AspeedSegments *seg);
+static void aspeed_smc_reg_to_segment(const AspeedSMCState *s, uint32_t =
reg,
+                                      AspeedSegments *seg);
=20
 static const AspeedSMCController controllers[] =3D {
     {
@@ -226,6 +230,8 @@ static const AspeedSMCController controllers[] =3D {
         .flash_window_size =3D 0x6000000,
         .has_dma           =3D false,
         .nregs             =3D ASPEED_SMC_R_SMC_MAX,
+        .segment_to_reg    =3D aspeed_smc_segment_to_reg,
+        .reg_to_segment    =3D aspeed_smc_reg_to_segment,
     }, {
         .name              =3D "aspeed.fmc-ast2400",
         .r_conf            =3D R_CONF,
@@ -241,6 +247,8 @@ static const AspeedSMCController controllers[] =3D {
         .dma_flash_mask    =3D 0x0FFFFFFC,
         .dma_dram_mask     =3D 0x1FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
+        .segment_to_reg    =3D aspeed_smc_segment_to_reg,
+        .reg_to_segment    =3D aspeed_smc_reg_to_segment,
     }, {
         .name              =3D "aspeed.spi1-ast2400",
         .r_conf            =3D R_SPI_CONF,
@@ -254,6 +262,8 @@ static const AspeedSMCController controllers[] =3D {
         .flash_window_size =3D 0x10000000,
         .has_dma           =3D false,
         .nregs             =3D ASPEED_SMC_R_SPI_MAX,
+        .segment_to_reg    =3D aspeed_smc_segment_to_reg,
+        .reg_to_segment    =3D aspeed_smc_reg_to_segment,
     }, {
         .name              =3D "aspeed.fmc-ast2500",
         .r_conf            =3D R_CONF,
@@ -269,6 +279,8 @@ static const AspeedSMCController controllers[] =3D {
         .dma_flash_mask    =3D 0x0FFFFFFC,
         .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
+        .segment_to_reg    =3D aspeed_smc_segment_to_reg,
+        .reg_to_segment    =3D aspeed_smc_reg_to_segment,
     }, {
         .name              =3D "aspeed.spi1-ast2500",
         .r_conf            =3D R_CONF,
@@ -282,6 +294,8 @@ static const AspeedSMCController controllers[] =3D {
         .flash_window_size =3D 0x8000000,
         .has_dma           =3D false,
         .nregs             =3D ASPEED_SMC_R_MAX,
+        .segment_to_reg    =3D aspeed_smc_segment_to_reg,
+        .reg_to_segment    =3D aspeed_smc_reg_to_segment,
     }, {
         .name              =3D "aspeed.spi2-ast2500",
         .r_conf            =3D R_CONF,
@@ -295,19 +309,19 @@ static const AspeedSMCController controllers[] =3D =
{
         .flash_window_size =3D 0x8000000,
         .has_dma           =3D false,
         .nregs             =3D ASPEED_SMC_R_MAX,
+        .segment_to_reg    =3D aspeed_smc_segment_to_reg,
+        .reg_to_segment    =3D aspeed_smc_reg_to_segment,
     },
 };
=20
 /*
- * The Segment Register uses a 8MB unit to encode the start address
- * and the end address of the mapping window of a flash SPI slave :
- *
- *        | byte 1 | byte 2 | byte 3 | byte 4 |
- *        +--------+--------+--------+--------+
- *        |  end   |  start |   0    |   0    |
- *
+ * The Segment Registers of the AST2400 and AST2500 have a 8MB
+ * unit. The address range of a flash SPI slave is encoded with
+ * absolute addresses which should be part of the overall controller
+ * window.
  */
-static inline uint32_t aspeed_smc_segment_to_reg(const AspeedSegments *s=
eg)
+static uint32_t aspeed_smc_segment_to_reg(const AspeedSMCState *s,
+                                          const AspeedSegments *seg)
 {
     uint32_t reg =3D 0;
     reg |=3D ((seg->addr >> 23) & SEG_START_MASK) << SEG_START_SHIFT;
@@ -315,7 +329,8 @@ static inline uint32_t aspeed_smc_segment_to_reg(cons=
t AspeedSegments *seg)
     return reg;
 }
=20
-static inline void aspeed_smc_reg_to_segment(uint32_t reg, AspeedSegment=
s *seg)
+static void aspeed_smc_reg_to_segment(const AspeedSMCState *s,
+                                      uint32_t reg, AspeedSegments *seg)
 {
     seg->addr =3D ((reg >> SEG_START_SHIFT) & SEG_START_MASK) << 23;
     seg->size =3D (((reg >> SEG_END_SHIFT) & SEG_END_MASK) << 23) - seg-=
>addr;
@@ -333,7 +348,7 @@ static bool aspeed_smc_flash_overlap(const AspeedSMCS=
tate *s,
             continue;
         }
=20
-        aspeed_smc_reg_to_segment(s->regs[R_SEG_ADDR0 + i], &seg);
+        s->ctrl->reg_to_segment(s, s->regs[R_SEG_ADDR0 + i], &seg);
=20
         if (new->addr + new->size > seg.addr &&
             new->addr < seg.addr + seg.size) {
@@ -354,7 +369,7 @@ static void aspeed_smc_flash_set_segment(AspeedSMCSta=
te *s, int cs,
     AspeedSMCFlash *fl =3D &s->flashes[cs];
     AspeedSegments seg;
=20
-    aspeed_smc_reg_to_segment(new, &seg);
+    s->ctrl->reg_to_segment(s, new, &seg);
=20
     /* The start address of CS0 is read-only */
     if (cs =3D=3D 0 && seg.addr !=3D s->ctrl->flash_window_base) {
@@ -362,7 +377,7 @@ static void aspeed_smc_flash_set_segment(AspeedSMCSta=
te *s, int cs,
                       "%s: Tried to change CS0 start address to 0x%"
                       HWADDR_PRIx "\n", s->ctrl->name, seg.addr);
         seg.addr =3D s->ctrl->flash_window_base;
-        new =3D aspeed_smc_segment_to_reg(&seg);
+        new =3D s->ctrl->segment_to_reg(s, &seg);
     }
=20
     /*
@@ -379,7 +394,7 @@ static void aspeed_smc_flash_set_segment(AspeedSMCSta=
te *s, int cs,
                       HWADDR_PRIx "\n", s->ctrl->name, cs, seg.addr + se=
g.size);
         seg.size =3D s->ctrl->segments[cs].addr + s->ctrl->segments[cs].=
size -
             seg.addr;
-        new =3D aspeed_smc_segment_to_reg(&seg);
+        new =3D s->ctrl->segment_to_reg(s, &seg);
     }
=20
     /* Keep the segment in the overall flash window */
@@ -509,7 +524,7 @@ static uint32_t aspeed_smc_check_segment_addr(const A=
speedSMCFlash *fl,
     const AspeedSMCState *s =3D fl->controller;
     AspeedSegments seg;
=20
-    aspeed_smc_reg_to_segment(s->regs[R_SEG_ADDR0 + fl->id], &seg);
+    s->ctrl->reg_to_segment(s, s->regs[R_SEG_ADDR0 + fl->id], &seg);
     if ((addr % seg.size) !=3D addr) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid address 0x%08x for CS%d segment : "
@@ -769,7 +784,7 @@ static void aspeed_smc_reset(DeviceState *d)
     /* setup default segment register values for all */
     for (i =3D 0; i < s->ctrl->max_slaves; ++i) {
         s->regs[R_SEG_ADDR0 + i] =3D
-            aspeed_smc_segment_to_reg(&s->ctrl->segments[i]);
+            s->ctrl->segment_to_reg(s, &s->ctrl->segments[i]);
     }
=20
     /* HW strapping flash type for FMC controllers  */
--=20
2.21.0

