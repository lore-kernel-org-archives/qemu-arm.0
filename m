Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp894613wrp;
        Wed, 25 Sep 2019 07:51:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwcdT2LjCsWIe0a+2VS6/o5HHjeuy2FbTOogVB2HNi9KtraiT7/jlFyoK5nhzH0cx+2UMxX
X-Received: by 2002:ac8:70c8:: with SMTP id g8mr9293443qtp.272.1569423112919;
        Wed, 25 Sep 2019 07:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569423112; cv=none;
        d=google.com; s=arc-20160816;
        b=tlpwZOWe13aMzpbR1yrpnwM/NZ8PmhHGxVAI8IRyLr5u1wT+9J97lE9WYSsxGC4R1G
         veU6IvBCETr/PecnzqX+INFc48zN19lK7/xH1OL3BmnOrYmguilu28FFUeAN64SffZoy
         1L0E5iOqVcrn9POCMnUMntzBpDDMIVSbrb/DXPGr23TLu0mQqRs5FjYCj65elJgG7f30
         MllW7KOsKGWC32LiBP2+LOmIdUTBFwL3JOZC2mtRN1az7zBhrw5FrPGzj5OO1fHgcFa+
         P5jJTxcZjjZF9yhvjxFBpE70aPu+OnqPOUJUcD+UPNwXhWzWhwKCF3kC7fkdDKb/c778
         DDog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=t8XRQwwV74AcDFTSpjPiIDeDR18KjlRt4B4f6zUARKA=;
        b=pFuy/ucSuALcV/u6L3voR+mSXJmBb/Y5URI3IIynq3D87X76lSeYiclReC6rwwLr2y
         zr42KsVSjKVUUKI6NOuxShEKDq4TC7kgRzhjnfBI2eh/xi4Xk7z5hNNgkVN1nJDzsFWz
         3C/fSXdKcIxhMKByxINFiYs45/tYA2SlJZr6s9hQxgIp893Gt4umCrCo6r+JCSKwdozM
         Ic5BqsrRnOSYzzgKWQkzq/0typkQdiS+qodqkN05mvCPE8txsOPKyg9kZrVILOe9eZqb
         62Mqebs886q5IX9DQBI8m+RDkLlFhwNv7TYpZDkS0i5kAsvrxRMjUV0gBdUUyDRSCmc3
         TLRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w42si4020651qvc.132.2019.09.25.07.51.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 07:51:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD8dz-0004LW-GR
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 10:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52696)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8NR-0004PA-Rv
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:34:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8NQ-0001Lc-2p
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:34:45 -0400
Received: from 4.mo179.mail-out.ovh.net ([46.105.36.149]:58547)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8NP-0001Hq-T3
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:34:44 -0400
Received: from player786.ha.ovh.net (unknown [10.108.57.183])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 33D5B14321C
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 16:34:33 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id AC8B2A4D3FF6;
 Wed, 25 Sep 2019 14:34:26 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 13/23] aspeed/smc: Add AST2600 support
Date: Wed, 25 Sep 2019 16:32:38 +0200
Message-Id: <20190925143248.10000-14-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
References: <20190925143248.10000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8861113743238794001
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.36.149
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mPz4oqBYH32I

The AST2600 SoC SMC controller is a SPI only controller now and has a
few extensions which we will need to take into account when SW
requires it. This is enough to support u-boot and Linux.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 132 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 128 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 9909135a2cfe..f0c7bbbad302 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -30,6 +30,7 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
+#include "qemu/units.h"
=20
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
@@ -50,7 +51,7 @@
 #define   CONF_FLASH_TYPE0     0
 #define      CONF_FLASH_TYPE_NOR   0x0
 #define      CONF_FLASH_TYPE_NAND  0x1
-#define      CONF_FLASH_TYPE_SPI   0x2
+#define      CONF_FLASH_TYPE_SPI   0x2 /* AST2600 is SPI only */
=20
 /* CE Control Register */
 #define R_CE_CTRL            (0x04 / 4)
@@ -71,8 +72,11 @@
=20
 /* CEx Control Register */
 #define R_CTRL0           (0x10 / 4)
+#define   CTRL_IO_QPI              (1 << 31)
+#define   CTRL_IO_QUAD_DATA        (1 << 30)
 #define   CTRL_IO_DUAL_DATA        (1 << 29)
 #define   CTRL_IO_DUAL_ADDR_DATA   (1 << 28) /* Includes dummies */
+#define   CTRL_IO_QUAD_ADDR_DATA   (1 << 28) /* Includes dummies */
 #define   CTRL_CMD_SHIFT           16
 #define   CTRL_CMD_MASK            0xff
 #define   CTRL_DUMMY_HIGH_SHIFT    14
@@ -136,7 +140,7 @@
 /* Misc Control Register #2 */
 #define R_TIMINGS         (0x94 / 4)
=20
-/* SPI controller registers and bits */
+/* SPI controller registers and bits (AST2400) */
 #define R_SPI_CONF        (0x00 / 4)
 #define   SPI_CONF_ENABLE_W0   0
 #define R_SPI_CTRL0       (0x4 / 4)
@@ -216,6 +220,35 @@ static uint32_t aspeed_smc_segment_to_reg(const Aspe=
edSMCState *s,
 static void aspeed_smc_reg_to_segment(const AspeedSMCState *s, uint32_t =
reg,
                                       AspeedSegments *seg);
=20
+/*
+ * AST2600 definitions
+ */
+#define ASPEED26_SOC_FMC_FLASH_BASE   0x20000000
+#define ASPEED26_SOC_SPI_FLASH_BASE   0x30000000
+#define ASPEED26_SOC_SPI2_FLASH_BASE  0x50000000
+
+static const AspeedSegments aspeed_segments_ast2600_fmc[] =3D {
+    { 0x0, 128 * MiB }, /* start address is readonly */
+    { 0x0, 0 }, /* disabled */
+    { 0x0, 0 }, /* disabled */
+};
+
+static const AspeedSegments aspeed_segments_ast2600_spi1[] =3D {
+    { 0x0, 128 * MiB }, /* start address is readonly */
+    { 0x0, 0 }, /* disabled */
+};
+
+static const AspeedSegments aspeed_segments_ast2600_spi2[] =3D {
+    { 0x0, 128 * MiB }, /* start address is readonly */
+    { 0x0, 0 }, /* disabled */
+    { 0x0, 0 }, /* disabled */
+};
+
+static uint32_t aspeed_2600_smc_segment_to_reg(const AspeedSMCState *s,
+                                               const AspeedSegments *seg=
);
+static void aspeed_2600_smc_reg_to_segment(const AspeedSMCState *s,
+                                           uint32_t reg, AspeedSegments =
*seg);
+
 static const AspeedSMCController controllers[] =3D {
     {
         .name              =3D "aspeed.smc-ast2400",
@@ -311,6 +344,51 @@ static const AspeedSMCController controllers[] =3D {
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
+    }, {
+        .name              =3D "aspeed.fmc-ast2600",
+        .r_conf            =3D R_CONF,
+        .r_ce_ctrl         =3D R_CE_CTRL,
+        .r_ctrl0           =3D R_CTRL0,
+        .r_timings         =3D R_TIMINGS,
+        .conf_enable_w0    =3D CONF_ENABLE_W0,
+        .max_slaves        =3D 3,
+        .segments          =3D aspeed_segments_ast2600_fmc,
+        .flash_window_base =3D ASPEED26_SOC_FMC_FLASH_BASE,
+        .flash_window_size =3D 0x10000000,
+        .has_dma           =3D true,
+        .nregs             =3D ASPEED_SMC_R_MAX,
+        .segment_to_reg    =3D aspeed_2600_smc_segment_to_reg,
+        .reg_to_segment    =3D aspeed_2600_smc_reg_to_segment,
+    }, {
+        .name              =3D "aspeed.spi1-ast2600",
+        .r_conf            =3D R_CONF,
+        .r_ce_ctrl         =3D R_CE_CTRL,
+        .r_ctrl0           =3D R_CTRL0,
+        .r_timings         =3D R_TIMINGS,
+        .conf_enable_w0    =3D CONF_ENABLE_W0,
+        .max_slaves        =3D 2,
+        .segments          =3D aspeed_segments_ast2600_spi1,
+        .flash_window_base =3D ASPEED26_SOC_SPI_FLASH_BASE,
+        .flash_window_size =3D 0x10000000,
+        .has_dma           =3D false,
+        .nregs             =3D ASPEED_SMC_R_MAX,
+        .segment_to_reg    =3D aspeed_2600_smc_segment_to_reg,
+        .reg_to_segment    =3D aspeed_2600_smc_reg_to_segment,
+    }, {
+        .name              =3D "aspeed.spi2-ast2600",
+        .r_conf            =3D R_CONF,
+        .r_ce_ctrl         =3D R_CE_CTRL,
+        .r_ctrl0           =3D R_CTRL0,
+        .r_timings         =3D R_TIMINGS,
+        .conf_enable_w0    =3D CONF_ENABLE_W0,
+        .max_slaves        =3D 3,
+        .segments          =3D aspeed_segments_ast2600_spi2,
+        .flash_window_base =3D ASPEED26_SOC_SPI2_FLASH_BASE,
+        .flash_window_size =3D 0x10000000,
+        .has_dma           =3D false,
+        .nregs             =3D ASPEED_SMC_R_MAX,
+        .segment_to_reg    =3D aspeed_2600_smc_segment_to_reg,
+        .reg_to_segment    =3D aspeed_2600_smc_reg_to_segment,
     },
 };
=20
@@ -336,6 +414,40 @@ static void aspeed_smc_reg_to_segment(const AspeedSM=
CState *s,
     seg->size =3D (((reg >> SEG_END_SHIFT) & SEG_END_MASK) << 23) - seg-=
>addr;
 }
=20
+/*
+ * The Segment Registers of the AST2600 have a 1MB unit. The address
+ * range of a flash SPI slave is encoded with offsets in the overall
+ * controller window. The previous SoC AST2400 and AST2500 used
+ * absolute addresses. Only bits [27:20] are relevant and the end
+ * address is an upper bound limit.
+ */
+#define AST2600_SEG_ADDR_MASK 0x0ff00000
+
+static uint32_t aspeed_2600_smc_segment_to_reg(const AspeedSMCState *s,
+                                               const AspeedSegments *seg=
)
+{
+    uint32_t reg =3D 0;
+
+    /* Disabled segments have a nil register */
+    if (!seg->size) {
+        return 0;
+    }
+
+    reg |=3D (seg->addr & AST2600_SEG_ADDR_MASK) >> 16; /* start offset =
*/
+    reg |=3D (seg->addr + seg->size - 1) & AST2600_SEG_ADDR_MASK; /* end=
 offset */
+    return reg;
+}
+
+static void aspeed_2600_smc_reg_to_segment(const AspeedSMCState *s,
+                                           uint32_t reg, AspeedSegments =
*seg)
+{
+    uint32_t start_offset =3D (reg << 16) & AST2600_SEG_ADDR_MASK;
+    uint32_t end_offset =3D reg & AST2600_SEG_ADDR_MASK;
+
+    seg->addr =3D s->ctrl->flash_window_base + start_offset;
+    seg->size =3D end_offset + MiB - start_offset;
+}
+
 static bool aspeed_smc_flash_overlap(const AspeedSMCState *s,
                                      const AspeedSegments *new,
                                      int cs)
@@ -470,8 +582,12 @@ static inline int aspeed_smc_flash_cmd(const AspeedS=
MCFlash *fl)
     const AspeedSMCState *s =3D fl->controller;
     int cmd =3D (s->regs[s->r_ctrl0 + fl->id] >> CTRL_CMD_SHIFT) & CTRL_=
CMD_MASK;
=20
-    /* In read mode, the default SPI command is READ (0x3). In other
-     * modes, the command should necessarily be defined */
+    /*
+     * In read mode, the default SPI command is READ (0x3). In other
+     * modes, the command should necessarily be defined
+     *
+     * TODO: add support for READ4 (0x13) on AST2600
+     */
     if (aspeed_smc_flash_mode(fl) =3D=3D CTRL_READMODE) {
         cmd =3D SPI_OP_READ;
     }
@@ -787,6 +903,14 @@ static void aspeed_smc_reset(DeviceState *d)
             s->ctrl->segment_to_reg(s, &s->ctrl->segments[i]);
     }
=20
+    /* HW strapping flash type for the AST2600 controllers  */
+    if (s->ctrl->segments =3D=3D aspeed_segments_ast2600_fmc) {
+        /* flash type is fixed to SPI for all */
+        s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0=
);
+        s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1=
);
+        s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE2=
);
+    }
+
     /* HW strapping flash type for FMC controllers  */
     if (s->ctrl->segments =3D=3D aspeed_segments_ast2500_fmc) {
         /* flash type is fixed to SPI for CE0 and CE1 */
--=20
2.21.0

