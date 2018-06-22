Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp538170wrq;
        Fri, 22 Jun 2018 00:57:35 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfbrlmqUACp4Pzb1XNu0+txgmQ8ZBxRusNQsW1QGLgddCjgCDsDkOaH/SCK4N8rNgy5l4m6
X-Received: by 2002:a0c:8047:: with SMTP id 65-v6mr441692qva.226.1529654255881;
        Fri, 22 Jun 2018 00:57:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529654255; cv=none;
        d=google.com; s=arc-20160816;
        b=x+p5Yvw3SKh4ZcWXXhY6v/KTWFt15gA3WSvwdzdGGJAzwoIpxxkwsg9u9Jca5xVM2L
         49nPgrrHYLWq/+UlCJBghBpVeZgcUQR6nmXEU2HGXLL4YMkLEb4OxFLxm+86KIGSZzA8
         /qKJDN9SnKidPB2yYDre0yCjS/ki8Ap1tnJMMOxFrBRO64JAMDvKr1P34LUqY/1iSbFX
         i/i8s25puN9CzQKiN8Zgfws0w2PpUM9HC5BUxF8r/0x9H6cVcp9/6tWAMIT2F9qTJx1/
         4xXa4Ap/kQU4ZPmobPaltBfkMDrLPoJkYqJI5fd94jtp37aIdPeT6SvYR+HzZdrFa+zn
         +P2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=dt5z5dTgWDP7wT3uzJ6DLK88PF318wt2Dj4QSHtQZw8=;
        b=aiJ8hnv8/evVYBVwGzngKfeDUZ/U8SuZ4vTI+08N+3tbrXz80mXNcFMyC4enMlUXCv
         K8a8WAa+GkGHW4ji7BXIqMBAUxH5/sq9STAtN4WLoztlE57nXiduYt3rgAZYNggKMcSp
         Pm05uS7f/jlF04avBukBxrfOtwLr0wkscLeB/xvKK3vsqBiweZ/rC4cGxVTsXz2bZrYJ
         mrEzVLJFr7596nc0YVgafGQLcNZ+BI4vPs9jZK+tgFSFVJjOUwM+fRI6hXwY3EbwJjir
         4kLTcNbBxWQVxi+S+m2JrsFz0WImET6evcgjftPg9oUZT9TutEZFIKF1cVjcmw+QBvc2
         emkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z4-v6si6164148qtg.61.2018.06.22.00.57.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 00:57:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWGwp-0006Xk-A6
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 03:57:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fWGwc-0006Vp-J4
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:57:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fWGwZ-0008NK-GP
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:57:22 -0400
Received: from 12.mo5.mail-out.ovh.net ([46.105.39.65]:41574)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fWGwZ-0008Mg-6b
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:57:19 -0400
Received: from player168.ha.ovh.net (unknown [10.109.122.7])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 47A581C4624
	for <qemu-arm@nongnu.org>; Fri, 22 Jun 2018 09:57:17 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id DC34E4200A9;
	Fri, 22 Jun 2018 09:57:10 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jun 2018 09:56:58 +0200
Message-Id: <20180622075700.5923-2-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180622075700.5923-1-clg@kaod.org>
References: <20180622075700.5923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 12384054551142697792
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrtdehgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.39.65
Subject: [Qemu-arm] [PATCH v2 1/3] aspeed/scu: introduce clock frequencies
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: svGHnW5lMrak

All Aspeed SoC clocks are driven by an input source clock which can
have different frequencies : 24MHz or 25MHz, and also, on the Aspeed
AST2400 SoC, 48MHz. The H-PLL (CPU) clock is defined from a
calculation using parameters in the H-PLL Parameter register or from a
predefined set of frequencies if the setting is strapped by hardware
(Aspeed AST2400 SoC). The other clocks of the SoC are then defined
from the H-PLL using dividers.

We introduce first the APB clock because it should be used to drive
the Aspeed timer model.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_scu.h |  70 ++++++++++++++++++++++++++--
 hw/misc/aspeed_scu.c         | 106 +++++++++++++++++++++++++++++++++++++=
++++++
 2 files changed, 172 insertions(+), 4 deletions(-)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index d70cc0aeca61..f662c38188f4 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -30,6 +30,10 @@ typedef struct AspeedSCUState {
     uint32_t hw_strap1;
     uint32_t hw_strap2;
     uint32_t hw_prot_key;
+
+    uint32_t clkin;
+    uint32_t hpll;
+    uint32_t apb_freq;
 } AspeedSCUState;
=20
 #define AST2400_A0_SILICON_REV   0x02000303U
@@ -58,7 +62,64 @@ extern bool is_supported_silicon_rev(uint32_t silicon_=
rev);
  *       1. 2012/12/29 Ryan Chen Create
  */
=20
-/* Hardware Strapping Register definition (for Aspeed AST2400 SOC)
+/* SCU08   Clock Selection Register
+ *
+ *  31     Enable Video Engine clock dynamic slow down
+ *  30:28  Video Engine clock slow down setting
+ *  27     2D Engine GCLK clock source selection
+ *  26     2D Engine GCLK clock throttling enable
+ *  25:23  APB PCLK divider selection
+ *  22:20  LPC Host LHCLK divider selection
+ *  19     LPC Host LHCLK clock generation/output enable control
+ *  18:16  MAC AHB bus clock divider selection
+ *  15     SD/SDIO clock running enable
+ *  14:12  SD/SDIO divider selection
+ *  11     Reserved
+ *  10:8   Video port output clock delay control bit
+ *  7      ARM CPU/AHB clock slow down enable
+ *  6:4    ARM CPU/AHB clock slow down setting
+ *  3:2    ECLK clock source selection
+ *  1      CPU/AHB clock slow down idle timer
+ *  0      CPU/AHB clock dynamic slow down enable (defined in bit[6:4])
+ */
+#define SCU_CLK_GET_PCLK_DIV(x)                    (((x) >> 23) & 0x7)
+
+/* SCU24   H-PLL Parameter Register (for Aspeed AST2400 SOC)
+ *
+ *  18     H-PLL parameter selection
+ *           0: Select H-PLL by strapping resistors
+ *           1: Select H-PLL by the programmed registers (SCU24[17:0])
+ *  17     Enable H-PLL bypass mode
+ *  16     Turn off H-PLL
+ *  10:5   H-PLL Numerator
+ *  4      H-PLL Output Divider
+ *  3:0    H-PLL Denumerator
+ *
+ *  (Output frequency) =3D 24MHz * (2-OD) * [(Numerator+2) / (Denumerato=
r+1)]
+ */
+
+#define SCU_AST2400_H_PLL_PROGRAMMED               (0x1 << 18)
+#define SCU_AST2400_H_PLL_BYPASS_EN                (0x1 << 17)
+#define SCU_AST2400_H_PLL_OFF                      (0x1 << 16)
+
+/* SCU24   H-PLL Parameter Register (for Aspeed AST2500 SOC)
+ *
+ *  21     Enable H-PLL reset
+ *  20     Enable H-PLL bypass mode
+ *  19     Turn off H-PLL
+ *  18:13  H-PLL Post Divider
+ *  12:5   H-PLL Numerator (M)
+ *  4:0    H-PLL Denumerator (N)
+ *
+ *  (Output frequency) =3D CLKIN(24MHz) * [(M+1) / (N+1)] / (P+1)
+ *
+ * The default frequency is 792Mhz when CLKIN =3D 24MHz
+ */
+
+#define SCU_H_PLL_BYPASS_EN                        (0x1 << 20)
+#define SCU_H_PLL_OFF                              (0x1 << 19)
+
+/* SCU70  Hardware Strapping Register definition (for Aspeed AST2400 SOC=
)
  *
  * 31:29  Software defined strapping registers
  * 28:27  DRAM size setting (for VGA driver use)
@@ -107,12 +168,13 @@ extern bool is_supported_silicon_rev(uint32_t silic=
on_rev);
 #define SCU_AST2400_HW_STRAP_GET_CLK_SOURCE(x)     (((((x) >> 23) & 0x1)=
 << 1) \
                                                     | (((x) >> 18) & 0x1=
))
 #define SCU_AST2400_HW_STRAP_CLK_SOURCE_MASK       ((0x1 << 23) | (0x1 <=
< 18))
-#define     AST2400_CLK_25M_IN                         (0x1 << 23)
+#define SCU_HW_STRAP_CLK_25M_IN                    (0x1 << 23)
 #define     AST2400_CLK_24M_IN                         0
 #define     AST2400_CLK_48M_IN                         1
 #define     AST2400_CLK_25M_IN_24M_USB_CKI             2
 #define     AST2400_CLK_25M_IN_48M_USB_CKI             3
=20
+#define SCU_HW_STRAP_CLK_48M_IN                    (0x1 << 18)
 #define SCU_HW_STRAP_2ND_BOOT_WDT                  (0x1 << 17)
 #define SCU_HW_STRAP_SUPER_IO_CONFIG               (0x1 << 16)
 #define SCU_HW_STRAP_VGA_CLASS_CODE                (0x1 << 15)
@@ -160,8 +222,8 @@ extern bool is_supported_silicon_rev(uint32_t silicon=
_rev);
 #define     AST2400_DIS_BOOT                           3
=20
 /*
- * Hardware strapping register definition (for Aspeed AST2500 SoC and
- * higher)
+ * SCU70  Hardware strapping register definition (for Aspeed AST2500
+ *        SoC and higher)
  *
  * 31     Enable SPI Flash Strap Auto Fetch Mode
  * 30     Enable GPIO Strap Mode
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 59315010db9a..59333b50abdd 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -168,6 +168,27 @@ static uint32_t aspeed_scu_get_random(void)
     return num;
 }
=20
+static void aspeed_scu_set_apb_freq(AspeedSCUState *s)
+{
+    uint32_t apb_divider;
+
+    switch (s->silicon_rev) {
+    case AST2400_A0_SILICON_REV:
+    case AST2400_A1_SILICON_REV:
+        apb_divider =3D 2;
+        break;
+    case AST2500_A0_SILICON_REV:
+    case AST2500_A1_SILICON_REV:
+        apb_divider =3D 4;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    s->apb_freq =3D s->hpll / (SCU_CLK_GET_PCLK_DIV(s->regs[CLK_SEL]) + =
1)
+        / apb_divider;
+}
+
 static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned si=
ze)
 {
     AspeedSCUState *s =3D ASPEED_SCU(opaque);
@@ -222,6 +243,10 @@ static void aspeed_scu_write(void *opaque, hwaddr of=
fset, uint64_t data,
     case PROT_KEY:
         s->regs[reg] =3D (data =3D=3D ASPEED_SCU_PROT_KEY) ? 1 : 0;
         return;
+    case CLK_SEL:
+        s->regs[reg] =3D data;
+        aspeed_scu_set_apb_freq(s);
+        break;
=20
     case FREQ_CNTR_EVAL:
     case VGA_SCRATCH1 ... VGA_SCRATCH8:
@@ -247,19 +272,93 @@ static const MemoryRegionOps aspeed_scu_ops =3D {
     .valid.unaligned =3D false,
 };
=20
+static uint32_t aspeed_scu_get_clkin(AspeedSCUState *s)
+{
+    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN) {
+        return 25000000;
+    } else if (s->hw_strap1 & SCU_HW_STRAP_CLK_48M_IN) {
+        return 48000000;
+    } else {
+        return 24000000;
+    }
+}
+
+/*
+ * Strapped frequencies for the AST2400 in MHz. They depend on the
+ * clkin frequency.
+ */
+static const uint32_t hpll_ast2400_freqs[][4] =3D {
+    { 384, 360, 336, 408 }, /* 24MHz or 48MHz */
+    { 400, 375, 350, 425 }, /* 25MHz */
+};
+
+static uint32_t aspeed_scu_calc_hpll_ast2400(AspeedSCUState *s)
+{
+    uint32_t hpll_reg =3D s->regs[HPLL_PARAM];
+    uint8_t freq_select;
+    bool clk_25m_in;
+
+    if (hpll_reg & SCU_AST2400_H_PLL_OFF) {
+        return 0;
+    }
+
+    if (hpll_reg & SCU_AST2400_H_PLL_PROGRAMMED) {
+        uint32_t multiplier =3D 1;
+
+        if (!(hpll_reg & SCU_AST2400_H_PLL_BYPASS_EN)) {
+            uint32_t n  =3D (hpll_reg >> 5) & 0x3f;
+            uint32_t od =3D (hpll_reg >> 4) & 0x1;
+            uint32_t d  =3D hpll_reg & 0xf;
+
+            multiplier =3D (2 - od) * ((n + 2) / (d + 1));
+        }
+
+        return s->clkin * multiplier;
+    }
+
+    /* HW strapping */
+    clk_25m_in =3D !!(s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN);
+    freq_select =3D SCU_AST2400_HW_STRAP_GET_H_PLL_CLK(s->hw_strap1);
+
+    return hpll_ast2400_freqs[clk_25m_in][freq_select] * 1000000;
+}
+
+static uint32_t aspeed_scu_calc_hpll_ast2500(AspeedSCUState *s)
+{
+    uint32_t hpll_reg   =3D s->regs[HPLL_PARAM];
+    uint32_t multiplier =3D 1;
+
+    if (hpll_reg & SCU_H_PLL_OFF) {
+        return 0;
+    }
+
+    if (!(hpll_reg & SCU_H_PLL_BYPASS_EN)) {
+        uint32_t p =3D (hpll_reg >> 13) & 0x3f;
+        uint32_t m =3D (hpll_reg >> 5) & 0xff;
+        uint32_t n =3D hpll_reg & 0x1f;
+
+        multiplier =3D ((m + 1) / (n + 1)) / (p + 1);
+    }
+
+    return s->clkin * multiplier;
+}
+
 static void aspeed_scu_reset(DeviceState *dev)
 {
     AspeedSCUState *s =3D ASPEED_SCU(dev);
     const uint32_t *reset;
+    uint32_t (*calc_hpll)(AspeedSCUState *s);
=20
     switch (s->silicon_rev) {
     case AST2400_A0_SILICON_REV:
     case AST2400_A1_SILICON_REV:
         reset =3D ast2400_a0_resets;
+        calc_hpll =3D aspeed_scu_calc_hpll_ast2400;
         break;
     case AST2500_A0_SILICON_REV:
     case AST2500_A1_SILICON_REV:
         reset =3D ast2500_a1_resets;
+        calc_hpll =3D aspeed_scu_calc_hpll_ast2500;
         break;
     default:
         g_assert_not_reached();
@@ -270,6 +369,13 @@ static void aspeed_scu_reset(DeviceState *dev)
     s->regs[HW_STRAP1] =3D s->hw_strap1;
     s->regs[HW_STRAP2] =3D s->hw_strap2;
     s->regs[PROT_KEY] =3D s->hw_prot_key;
+
+    /*
+     * All registers are set. Now compute the frequencies of the main cl=
ocks
+     */
+    s->clkin =3D aspeed_scu_get_clkin(s);
+    s->hpll =3D calc_hpll(s);
+    aspeed_scu_set_apb_freq(s);
 }
=20
 static uint32_t aspeed_silicon_revs[] =3D {
--=20
2.13.6

