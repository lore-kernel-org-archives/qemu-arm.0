Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1387147njm;
        Thu, 6 Mar 2025 02:41:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVVoDy26jJSfKIyXBFrqOnkmdENhu8UF+IX7mLROx7o8yD8smSxxgMFFdxwRBMpKbCkBcqPGIdPbR3oxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHDJRSKx+MlFz9gnfC+mi+vRXO4KKuUXOqchF0eyb9orUmm2IqjaArf3X8cpArluF25NQfw
X-Received: by 2002:a05:622a:d1:b0:474:f8a6:82b with SMTP id d75a77b69052e-4750b467845mr83966941cf.26.1741257670388;
        Thu, 06 Mar 2025 02:41:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741257670; cv=none;
        d=google.com; s=arc-20240605;
        b=Y8npYDcAGVOiQsfxuWZyuTtgBOs7uM/wLefmyzIxFlYpFCaTh4brqIFguUR//IhhZg
         rVNcGil2A/ni/4ghfLUoZWluExvEbO/whJbs1jr8Df2l1QGMv9zQTP8uXVKU561+yAlW
         geP2x7eU6O3coVzoyQDfGkAq61cikCgjjPzUF1vFhpm6ktRcpZ3kkPcMpMGxfvYV6UZS
         guY6e8TpD6rPsBpJko9GKI7qeuh3f4EcCUKpc2wD86O9JzanvOcb8JGBKTuRU4N93IgP
         jAAv7Y2+NkAF9DH2BacrQgf65EergbWZrNfaoHvagEBXWTnYCHZSrgd9zxl4z9/ki8Fp
         d1pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=P4eJBzjkBsBYPDuMd9qdgDfuBEhAcnVp9GW8U6OGI/A=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=UvYeDoUIIhHbiPtz9mi7Aj9K0Me6ZtSAHTeh98dPjIg16xrgAyohlAi/W8HD5+tzdF
         f0AeM2nxflbR7rfGsmtT4VsvuZ9mzgEzeDkwVACShFb2s/hSkLNn3KOft2mkGdh78g41
         wLfjlr+mQ+Xb7/Kx2YmzVtA0JiJ6IWgAZc+PgVO+JXCSLixkQFkGyYbiM3BR8N4meIcM
         Otsd/wHiFeAfaOP1KBNSFoZyhX6hQBsT0FPBy1HQgueQhiJhRQmCVHIViStjzfwEPH0M
         h8xJQHkFHv55vW5Yi3qBCoEcwwF4FiP48odISI7a28RmvgCmZcQH5mHmHCb+AyuS1wX/
         riNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db426adsi9437631cf.569.2025.03.06.02.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:41:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tq8eW-0006mR-MB; Thu, 06 Mar 2025 05:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8eP-0006cd-8C; Thu, 06 Mar 2025 05:40:25 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8eM-0000XB-Vw; Thu, 06 Mar 2025 05:40:24 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Mar
 2025 18:38:53 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Mar 2025 18:38:53 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v5 19/29] hw/arm/aspeed_ast27x0.c Support AST2700 A1 GIC
 Interrupt Mapping
Date: Thu, 6 Mar 2025 18:38:27 +0800
Message-ID: <20250306103846.429221-20-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FLRQYOD/Hbng

Currently, these IRQ tables support from GIC 128 - 136 for AST2700 A0.
These IRQ tables can be reused for AST2700 A1 from GIC 192 - 197.
Updates the interrupt mapping to include support for AST2700 A1 by extending
the existing mappings to the new GIC range.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 77 ++++++++++++++++++++++++++---------------
 1 file changed, 50 insertions(+), 27 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 2d24361daa..343fe87921 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -120,21 +120,27 @@ static const int aspeed_soc_ast2700a0_irqmap[] = {
 };
 
 /* GICINT 128 */
-static const int aspeed_soc_ast2700_gic128_intcmap[] = {
+/* GICINT 192 */
+static const int ast2700_gic128_gic192_intcmap[] = {
     [ASPEED_DEV_LPC]       = 0,
     [ASPEED_DEV_IBT]       = 2,
     [ASPEED_DEV_KCS]       = 4,
 };
 
+/* GICINT 129 */
+/* GICINT 193 */
+
 /* GICINT 130 */
-static const int aspeed_soc_ast2700_gic130_intcmap[] = {
+/* GICINT 194 */
+static const int ast2700_gic130_gic194_intcmap[] = {
     [ASPEED_DEV_I2C]        = 0,
     [ASPEED_DEV_ADC]        = 16,
     [ASPEED_DEV_GPIO]       = 18,
 };
 
 /* GICINT 131 */
-static const int aspeed_soc_ast2700_gic131_intcmap[] = {
+/* GICINT 195 */
+static const int ast2700_gic131_gic195_intcmap[] = {
     [ASPEED_DEV_I3C]       = 0,
     [ASPEED_DEV_WDT]       = 16,
     [ASPEED_DEV_FMC]       = 25,
@@ -142,7 +148,8 @@ static const int aspeed_soc_ast2700_gic131_intcmap[] = {
 };
 
 /* GICINT 132 */
-static const int aspeed_soc_ast2700_gic132_intcmap[] = {
+/* GICINT 196 */
+static const int ast2700_gic132_gic196_intcmap[] = {
     [ASPEED_DEV_ETH1]      = 0,
     [ASPEED_DEV_ETH2]      = 1,
     [ASPEED_DEV_ETH3]      = 2,
@@ -161,24 +168,26 @@ static const int aspeed_soc_ast2700_gic132_intcmap[] = {
 };
 
 /* GICINT 133 */
-static const int aspeed_soc_ast2700_gic133_intcmap[] = {
+/* GICINT 197 */
+static const int ast2700_gic133_gic197_intcmap[] = {
     [ASPEED_DEV_SDHCI]     = 1,
     [ASPEED_DEV_PECI]      = 4,
 };
 
 /* GICINT 128 ~ 136 */
+/* GICINT 192 ~ 201 */
 struct gic_intc_irq_info {
     int irq;
     const int *ptr;
 };
 
-static const struct gic_intc_irq_info aspeed_soc_ast2700_gic_intcmap[] = {
-    {128,  aspeed_soc_ast2700_gic128_intcmap},
+static const struct gic_intc_irq_info ast2700_gic_intcmap[] = {
+    {128,  ast2700_gic128_gic192_intcmap},
     {129,  NULL},
-    {130,  aspeed_soc_ast2700_gic130_intcmap},
-    {131,  aspeed_soc_ast2700_gic131_intcmap},
-    {132,  aspeed_soc_ast2700_gic132_intcmap},
-    {133,  aspeed_soc_ast2700_gic133_intcmap},
+    {130,  ast2700_gic130_gic194_intcmap},
+    {131,  ast2700_gic131_gic195_intcmap},
+    {132,  ast2700_gic132_gic196_intcmap},
+    {133,  ast2700_gic133_gic197_intcmap},
     {134,  NULL},
     {135,  NULL},
     {136,  NULL},
@@ -190,11 +199,11 @@ static qemu_irq aspeed_soc_ast2700_get_irq(AspeedSoCState *s, int dev)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     int i;
 
-    for (i = 0; i < ARRAY_SIZE(aspeed_soc_ast2700_gic_intcmap); i++) {
-        if (sc->irqmap[dev] == aspeed_soc_ast2700_gic_intcmap[i].irq) {
-            assert(aspeed_soc_ast2700_gic_intcmap[i].ptr);
+    for (i = 0; i < ARRAY_SIZE(ast2700_gic_intcmap); i++) {
+        if (sc->irqmap[dev] == ast2700_gic_intcmap[i].irq) {
+            assert(ast2700_gic_intcmap[i].ptr);
             return qdev_get_gpio_in(DEVICE(&a->intc.orgates[i]),
-                aspeed_soc_ast2700_gic_intcmap[i].ptr[dev]);
+                ast2700_gic_intcmap[i].ptr[dev]);
         }
     }
 
@@ -208,16 +217,17 @@ static qemu_irq aspeed_soc_ast2700_get_irq_index(AspeedSoCState *s, int dev,
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     int i;
 
-    for (i = 0; i < ARRAY_SIZE(aspeed_soc_ast2700_gic_intcmap); i++) {
-        if (sc->irqmap[dev] == aspeed_soc_ast2700_gic_intcmap[i].irq) {
-            assert(aspeed_soc_ast2700_gic_intcmap[i].ptr);
+    for (i = 0; i < ARRAY_SIZE(ast2700_gic_intcmap); i++) {
+        if (sc->irqmap[dev] == ast2700_gic_intcmap[i].irq) {
+            assert(ast2700_gic_intcmap[i].ptr);
             return qdev_get_gpio_in(DEVICE(&a->intc.orgates[i]),
-                aspeed_soc_ast2700_gic_intcmap[i].ptr[dev] + index);
+                                    ast2700_gic_intcmap[i].ptr[dev] + index);
         }
     }
 
     /*
-     * Invalid orgate index, device irq should be 128 to 136.
+     * Invalid OR gate index, device IRQ should be between 128 to 136
+     * and 192 to 201.
      */
     g_assert_not_reached();
 }
@@ -530,17 +540,18 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->intc), 0,
                     sc->memmap[ASPEED_DEV_INTC]);
 
-    /* source orgates -> INTC */
+    /* irq sources -> orgates -> INTC */
     for (i = 0; i < ic->num_inpins; i++) {
         qdev_connect_gpio_out(DEVICE(&a->intc.orgates[i]), 0,
-                                qdev_get_gpio_in(DEVICE(&a->intc), i));
+                              qdev_get_gpio_in(DEVICE(&a->intc), i));
     }
 
+    /* INTC -> GIC192 - GIC201 */
     /* INTC -> GIC128 - GIC136 */
     for (i = 0; i < ic->num_outpins; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(&a->intc), i,
                            qdev_get_gpio_in(DEVICE(&a->gic),
-                                aspeed_soc_ast2700_gic_intcmap[i].irq));
+                                            ast2700_gic_intcmap[i].irq));
     }
 
     /* SRAM */
@@ -691,10 +702,22 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
         /*
          * The AST2700 I2C controller has one source INTC per bus.
-         * I2C buses interrupt are connected to GICINT130_INTC
-         * from bit 0 to bit 15.
-         * I2C bus 0 is connected to GICINT130_INTC at bit 0.
-         * I2C bus 15 is connected to GICINT130_INTC at bit 15.
+         *
+         * For AST2700 A0:
+         * I2C bus interrupts are connected to the OR gate from bit 0 to bit
+         * 15, and the OR gate output pin is connected to the input pin of
+         * GICINT130 of INTC (CPU Die). Then, the output pin is connected to
+         * the GIC.
+         *
+         * For AST2700 A1:
+         * I2C bus interrupts are connected to the OR gate from bit 0 to bit
+         * 15, and the OR gate output pin is connected to the input pin of
+         * GICINT194 of INTCIO (IO Die). Then, the output pin is connected
+         * to the INTC (CPU Die) input pin, and its output pin is connected
+         * to the GIC.
+         *
+         * I2C bus 0 is connected to the OR gate at bit 0.
+         * I2C bus 15 is connected to the OR gate at bit 15.
          */
         irq = aspeed_soc_ast2700_get_irq_index(s, ASPEED_DEV_I2C, i);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
-- 
2.43.0

