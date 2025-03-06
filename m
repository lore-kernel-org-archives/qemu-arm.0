Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1388821njm;
        Thu, 6 Mar 2025 02:45:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVAIdeBOEos7cE8bft4ApO2DHJWJhy7VgRSuG/10A7UHR7Cbteq39y68IUQWB27L1znFq5wuo4AZNOYsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGeZs2iQJLhuSYcB5portKxKS2XO6r6EF+KDrJfSrP3oubhugWy17WCrt3fy0xWT0i9hz6F
X-Received: by 2002:a05:620a:8011:b0:7c3:c33f:df33 with SMTP id af79cd13be357-7c3d8e8c052mr996249085a.50.1741257938240;
        Thu, 06 Mar 2025 02:45:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741257938; cv=none;
        d=google.com; s=arc-20240605;
        b=grhvKNHWmoA7vJVmhoYwH2HA9v6CHZfZhrdv7CQzFsfMoiCmHpXzyyRkRLpExP+kUZ
         XEW7gCLApp57SbrVX8KBfi0k+WrP88nOA748Q3eo6EiM6nhals4kunri7OiGAtMCftuN
         a80u3owUNTEQiys7x/eYOf5MyJEhvNxFD/o2+BlVjMc17VcofezOyWU8velk4yYfg7ND
         kPa6wgqM1V3tMQB8F9Ni1dKXqk8EIJt1ypuEeKXZjxJuiT43f9j28JHZpX18DT9muy4q
         WeXxwJPHv9TyUpiT8BjaAObYEI4YXjWmVe6Qzck9/YwY2+DgrNDwS5az87BBjbkl6UxM
         +ziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=BzxfFkpcR7bivS8FaR6nZvZ+6w0Gdth/3nWGV/vpcXU=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=guuM1ddXbejpzrKzatpJYQXnKZrU1h/ZueD/mDXT+Q+jSVJUFui0ML5zebSxJpyraA
         HUaP79UF7E08wFjaqtU4qUv1MyUXaCmKBxYg8/iSwNZ8P0rs6EW8wmwFnEEU3ZWuW+aq
         lfktv7nCDZo6devr6foztjP0uMFmOwlvznlyz5K3cBuFiggf36BulwOKJ9nG9SCUNdGZ
         hLhO4fEZx4TyFjv6VWSeaEAsPIHDUj/VjrbAOqET6asVTqlS/iFlQr+vh9rtrkvIrMsi
         3NDMvGORXYjfjeA4ytxb9oPaHXXk45Jz0NQ40BGALlaHK4mElW19LzfWJA3heqdxpVzY
         DIzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e55110c8si95489385a.406.2025.03.06.02.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:45:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tq8eH-00063V-Sn; Thu, 06 Mar 2025 05:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8dx-0005n1-8l; Thu, 06 Mar 2025 05:40:02 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8dv-0000XB-1y; Thu, 06 Mar 2025 05:39:56 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Mar
 2025 18:38:51 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Mar 2025 18:38:51 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v5 14/29] hw/intc/aspeed: Introduce AspeedINTCIRQ structure to
 save the irq index and register address
Date: Thu, 6 Mar 2025 18:38:22 +0800
Message-ID: <20250306103846.429221-15-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TKD77QMa8rhN

The INTC controller supports GICINT128 to GICINT136, mapping 1:1 to input and
output IRQs 0 to 8. Previously, the formula "address & 0x0f00" was used to
derive the IRQ index numbers.

However, the INTC controller also supports GICINT192_201, mapping 1 input IRQ
pin to 10 output IRQ pins. The pin numbers for input and output are different.
It is difficult to use a formula to determine the index number of INTC model
supported input and output IRQs.

To simplify and improve readability, introduces the AspeedINTCIRQ structure to
save the input/output IRQ index and its enable/status register address.

Introduce the "aspeed_2700_intc_irqs" table to store IRQ information for INTC.
Introduce the "aspeed_intc_get_irq" function to retrieve the input/output IRQ
pin index from the provided status/enable register address.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/intc/aspeed_intc.h | 10 ++++
 hw/intc/aspeed_intc.c         | 87 +++++++++++++++++++----------------
 2 files changed, 58 insertions(+), 39 deletions(-)

diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index 41b1f82d73..fa92e9eef2 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -19,6 +19,14 @@ OBJECT_DECLARE_TYPE(AspeedINTCState, AspeedINTCClass, ASPEED_INTC)
 #define ASPEED_INTC_MAX_INPINS 9
 #define ASPEED_INTC_MAX_OUTPINS 9
 
+typedef struct AspeedINTCIRQ {
+    int inpin_idx;
+    int outpin_idx;
+    int num_outpins;
+    uint32_t enable_reg;
+    uint32_t status_reg;
+} AspeedINTCIRQ;
+
 struct AspeedINTCState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -46,6 +54,8 @@ struct AspeedINTCClass {
     uint64_t reg_size;
     uint64_t reg_offset;
     const MemoryRegionOps *reg_ops;
+    const AspeedINTCIRQ *irq_table;
+    int irq_table_count;
 };
 
 #endif /* ASPEED_INTC_H */
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 5b0d15f463..0ac59745f6 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -40,7 +40,23 @@ REG32(GICINT135_STATUS,     0x704)
 REG32(GICINT136_EN,         0x800)
 REG32(GICINT136_STATUS,     0x804)
 
-#define GICINT_STATUS_BASE     R_GICINT128_STATUS
+static const AspeedINTCIRQ *aspeed_intc_get_irq(AspeedINTCClass *aic,
+                                                uint32_t reg)
+{
+    int i;
+
+    for (i = 0; i < aic->irq_table_count; i++) {
+        if (aic->irq_table[i].enable_reg == reg ||
+            aic->irq_table[i].status_reg == reg) {
+            return &aic->irq_table[i];
+        }
+    }
+
+    /*
+     * Invalid reg.
+     */
+    g_assert_not_reached();
+}
 
 /*
  * Update the state of an interrupt controller pin by setting
@@ -54,17 +70,7 @@ static void aspeed_intc_update(AspeedINTCState *s, int inpin_idx,
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     const char *name = object_get_typename(OBJECT(s));
 
-    if (inpin_idx >= aic->num_inpins) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid input pin index: %d\n",
-                      __func__, inpin_idx);
-        return;
-    }
-
-    if (outpin_idx >= aic->num_outpins) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid output pin index: %d\n",
-                      __func__, outpin_idx);
-        return;
-    }
+    assert((outpin_idx < aic->num_outpins) && (inpin_idx < aic->num_inpins));
 
     trace_aspeed_intc_update_irq(name, inpin_idx, outpin_idx, level);
     qemu_set_irq(s->output_pins[outpin_idx], level);
@@ -81,21 +87,20 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
     AspeedINTCState *s = (AspeedINTCState *)opaque;
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     const char *name = object_get_typename(OBJECT(s));
-    uint32_t status_reg = GICINT_STATUS_BASE + ((0x100 * irq) >> 2);
+    const AspeedINTCIRQ *intc_irq;
+    uint32_t status_reg;
     uint32_t select = 0;
     uint32_t enable;
     int outpin_idx;
     int inpin_idx;
     int i;
 
-    outpin_idx = irq;
-    inpin_idx = irq;
+    assert(irq < aic->num_inpins);
 
-    if (irq >= aic->num_inpins) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid input pin index: %d\n",
-                      __func__, irq);
-        return;
-    }
+    intc_irq = &aic->irq_table[irq];
+    status_reg = intc_irq->status_reg;
+    outpin_idx = intc_irq->outpin_idx;
+    inpin_idx = intc_irq->inpin_idx;
 
     trace_aspeed_intc_set_irq(name, inpin_idx, level);
     enable = s->enable[inpin_idx];
@@ -146,21 +151,16 @@ static void aspeed_intc_enable_handler(AspeedINTCState *s, hwaddr offset,
 {
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     const char *name = object_get_typename(OBJECT(s));
+    const AspeedINTCIRQ *intc_irq;
     uint32_t reg = offset >> 2;
     uint32_t old_enable;
     uint32_t change;
     int inpin_idx;
-    uint32_t irq;
 
-    irq = (offset & 0x0f00) >> 8;
-    inpin_idx = irq;
+    intc_irq = aspeed_intc_get_irq(aic, reg);
+    inpin_idx = intc_irq->inpin_idx;
 
-    if (inpin_idx >= aic->num_inpins) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Invalid input pin index: %d\n",
-                      __func__, inpin_idx);
-        return;
-    }
+    assert(inpin_idx < aic->num_inpins);
 
     /*
      * The enable registers are used to enable source interrupts.
@@ -202,26 +202,21 @@ static void aspeed_intc_status_handler(AspeedINTCState *s, hwaddr offset,
 {
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     const char *name = object_get_typename(OBJECT(s));
+    const AspeedINTCIRQ *intc_irq;
     uint32_t reg = offset >> 2;
     int outpin_idx;
     int inpin_idx;
-    uint32_t irq;
 
     if (!data) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid data 0\n", __func__);
         return;
     }
 
-    irq = (offset & 0x0f00) >> 8;
-    outpin_idx = irq;
-    inpin_idx = irq;
+    intc_irq = aspeed_intc_get_irq(aic, reg);
+    outpin_idx = intc_irq->outpin_idx;
+    inpin_idx = intc_irq->inpin_idx;
 
-    if (inpin_idx >= aic->num_inpins) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Invalid input pin index: %d\n",
-                      __func__, inpin_idx);
-        return;
-    }
+    assert(inpin_idx < aic->num_inpins);
 
     /* clear status */
     s->regs[reg] &= ~data;
@@ -411,6 +406,18 @@ static const TypeInfo aspeed_intc_info = {
     .abstract = true,
 };
 
+static AspeedINTCIRQ aspeed_2700_intc_irqs[ASPEED_INTC_MAX_INPINS] = {
+    {0, 0, 1, R_GICINT128_EN, R_GICINT128_STATUS},
+    {1, 1, 1, R_GICINT129_EN, R_GICINT129_STATUS},
+    {2, 2, 1, R_GICINT130_EN, R_GICINT130_STATUS},
+    {3, 3, 1, R_GICINT131_EN, R_GICINT131_STATUS},
+    {4, 4, 1, R_GICINT132_EN, R_GICINT132_STATUS},
+    {5, 5, 1, R_GICINT133_EN, R_GICINT133_STATUS},
+    {6, 6, 1, R_GICINT134_EN, R_GICINT134_STATUS},
+    {7, 7, 1, R_GICINT135_EN, R_GICINT135_STATUS},
+    {8, 8, 1, R_GICINT136_EN, R_GICINT136_STATUS},
+};
+
 static void aspeed_2700_intc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -423,6 +430,8 @@ static void aspeed_2700_intc_class_init(ObjectClass *klass, void *data)
     aic->mem_size = 0x4000;
     aic->reg_size = 0x808 >> 2;
     aic->reg_offset = 0x1000;
+    aic->irq_table = aspeed_2700_intc_irqs;
+    aic->irq_table_count = ARRAY_SIZE(aspeed_2700_intc_irqs);
 }
 
 static const TypeInfo aspeed_2700_intc_info = {
-- 
2.43.0

