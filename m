Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6494650njn;
        Mon, 20 Jan 2025 23:06:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWE6qx9MWyF0/LsQ9vkI4La1OsU7Zzbkeaayff8BQeAbdlLmgHBACVW85z9YqiIlnVKUUomCMKDGKRK2w==@linaro.org
X-Google-Smtp-Source: AGHT+IEKDvGIBh6RjClpoRxJJIvh9qshUWMs57EFPtfqlh3BrVDRsbjLmWY/PHx2W35CotPOyMSW
X-Received: by 2002:a05:6214:4401:b0:6e1:a5c1:d52d with SMTP id 6a1803df08f44-6e1b21c46bdmr252011326d6.31.1737443175748;
        Mon, 20 Jan 2025 23:06:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737443175; cv=none;
        d=google.com; s=arc-20240605;
        b=ikFvVhrHpJC8ELhRQNMpg2wnzrydILDbaFxiOhWAI23NVAjOUg5jkTKQW/mfcTglmc
         riCITBcSF+by63mnQ3zRBLucHg2H8u9unyloVnRL/kpI42114q3AqgVQYs84PkupHpHq
         qBxq8HKx6fgUw/4tkadWix/TUkodi4nYR3Z5L2FIrAzzA+ks5BQPxnVpyVBfUOqfqxSI
         aSJ3hUUjQ1MtFfKQmeN5xJyELPsRSK6qrKNwVBn/rgCGD3gZsPj3fsbqixxnXIJUMA9l
         hdflG7Lu4eEE2w0yegJdzsO99dP7xUJXW1yj8NK49AwTEYXzKVQvt7coR2bo0SNZ7/aG
         d/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=z9phl9SpgkxNxBLnkiUfkcHPFr7K9Y4cQEidyvh8hwE=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=hsJ1hH3iGDUsYp298iT1rYr4ckIGKyLFkzgQ/3DYy72yoiIUmUoSOqr1PbyXkP+spp
         HIMnM3st+nFNC7ccn5WLZRS+tMEoZlQQfqBPFu2eV5HNiqlLDOxqH5knYwZjAs6Ffsge
         KNQ4BgiRQnCLCN2ku97bEL3DZXrgbq9t1N9gPUwvN+AaL5KLLDsZ84k+GdvLAhbHQu0G
         IWcp3BCidZivHPiHJJOAD6HfGFpRuS1mqw89IOiPo0fyMKvlyyTKlnm0iayuVvVhui34
         PM/Tv4Dz7VggqYVZlXp/NHKbFAXt1r2HBkVYdQrdpV/mSVe704ZL28EITnAiMKWd6/lC
         aWmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afbfc353si118922206d6.25.2025.01.20.23.06.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2025 23:06:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ta8Jt-0006ke-O9; Tue, 21 Jan 2025 02:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Jr-0006jp-65; Tue, 21 Jan 2025 02:05:03 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Jo-0001Q8-RJ; Tue, 21 Jan 2025 02:05:02 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 21 Jan
 2025 15:04:26 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 21 Jan 2025 15:04:26 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 06/18] hw/intc/aspeed: Introduce AspeedINTCIRQ structure to
 save the irq index and register address
Date: Tue, 21 Jan 2025 15:04:12 +0800
Message-ID: <20250121070424.2465942-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
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
X-TUID: F+Rb9Cq6ZGCX

The INTC0 controller supports GICINT128 to GICINT136, mapping 1:1 to input and
output IRQs 0 to 8. Previously, the formula "address & 0x0f00" was used to
derive the IRQ index numbers.

However, the INTC0 controller also supports GICINT192_201, mapping 1 input IRQ
pin to 10 output IRQ pins. The pin numbers for input and output are different.
Additionally, the INTC0 controller supports routing to GIC, SSP, TSP, and
BOOTMCU, making it difficult to use a formula to determine the index number of
INTC0 model supported input and output IRQs.

To simplify and improve readability, introduces the AspeedINTCIRQ structure to
save the input/output IRQ index and its enable/status register address.

Introduce the "aspeed_2700_intc0_irqs" table to store IRQ information for INTC0.
Introduce the "aspeed_intc_get_irq" function to retrieve the input/output IRQ
pin index from the provided status/enable register address.
Update the code to use "num_inpins" and "num_outpins" instead of "num_ints".

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c       |   2 +-
 hw/intc/aspeed_intc.c         | 165 ++++++++++++++++++++++------------
 hw/intc/trace-events          |  12 +--
 include/hw/intc/aspeed_intc.h |  26 ++++--
 4 files changed, 135 insertions(+), 70 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index ba461fcd3c..d5e521cd38 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -520,7 +520,7 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
                     sc->memmap[ASPEED_DEV_INTC0]);
 
     /* GICINT orgates -> INTC -> GIC */
-    for (i = 0; i < ic->num_ints; i++) {
+    for (i = 0; i < ic->num_inpins; i++) {
         qdev_connect_gpio_out(DEVICE(&a->intc.orgates[i]), 0,
                                 qdev_get_gpio_in(DEVICE(&a->intc), i));
         sysbus_connect_irq(SYS_BUS_DEVICE(&a->intc), i,
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 7dff5e6039..45f1c59a4b 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -34,20 +34,61 @@ REG32(INTC0_GICINT135_STATUS,     0x1704)
 REG32(INTC0_GICINT136_EN,         0x1800)
 REG32(INTC0_GICINT136_STATUS,     0x1804)
 
-#define GICINT_STATUS_BASE     R_INTC0_GICINT128_STATUS
+static AspeedINTCIRQ aspeed_2700_intc0_irqs[ASPEED_INTC_MAX_INPINS] = {
+    {0, 0, 1, R_INTC0_GICINT128_EN, R_INTC0_GICINT128_STATUS},
+    {1, 1, 1, R_INTC0_GICINT129_EN, R_INTC0_GICINT129_STATUS},
+    {2, 2, 1, R_INTC0_GICINT130_EN, R_INTC0_GICINT130_STATUS},
+    {3, 3, 1, R_INTC0_GICINT131_EN, R_INTC0_GICINT131_STATUS},
+    {4, 4, 1, R_INTC0_GICINT132_EN, R_INTC0_GICINT132_STATUS},
+    {5, 5, 1, R_INTC0_GICINT133_EN, R_INTC0_GICINT133_STATUS},
+    {6, 6, 1, R_INTC0_GICINT134_EN, R_INTC0_GICINT134_STATUS},
+    {7, 7, 1, R_INTC0_GICINT135_EN, R_INTC0_GICINT135_STATUS},
+    {8, 8, 1, R_INTC0_GICINT136_EN, R_INTC0_GICINT136_STATUS},
+};
+
+static const AspeedINTCIRQ *aspeed_intc_get_irq(AspeedINTCClass *aic,
+                                                uint32_t addr)
+{
+    int i;
+
+    for (i = 0; i < aic->irq_table_count; i++) {
+        if (aic->irq_table[i].enable_addr == addr ||
+            aic->irq_table[i].status_addr == addr) {
+            return &aic->irq_table[i];
+        }
+    }
+
+    /*
+     * Invalid addr.
+     */
+    g_assert_not_reached();
+}
 
-static void aspeed_intc_update(AspeedINTCState *s, int irq, int level)
+/*
+ * Update the state of an interrupt controller pin by setting
+ * the specified output pin to the given level.
+ * The input pin index should be between 0 and the number of input pins.
+ * The output pin index should be between 0 and the number of output pins.
+ */
+static void aspeed_intc_update(AspeedINTCState *s, int inpin_idx,
+                               int outpin_idx, int level)
 {
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
 
-    if (irq >= aic->num_ints) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid interrupt number: %d\n",
-                      __func__, irq);
+    if (inpin_idx >= aic->num_inpins) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid input pin index: %d\n",
+                      __func__, inpin_idx);
+        return;
+    }
+
+    if (outpin_idx >= aic->num_outpins) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid output pin index: %d\n",
+                      __func__, outpin_idx);
         return;
     }
 
-    trace_aspeed_intc_update_irq(irq, level);
-    qemu_set_irq(s->output_pins[irq], level);
+    trace_aspeed_intc_update_irq(inpin_idx, outpin_idx, level);
+    qemu_set_irq(s->output_pins[outpin_idx], level);
 }
 
 /*
@@ -56,30 +97,33 @@ static void aspeed_intc_update(AspeedINTCState *s, int irq, int level)
  * The value of irq should be 0 to num_ints.
  * The irq 0 indicates GICINT128, irq 1 indicates GICINT129 and so on.
  */
-static void aspeed_intc_set_irq(void *opaque, int irq, int level)
+static void aspeed_intc_set_irq(void *opaque, int irq_idx, int level)
 {
     AspeedINTCState *s = (AspeedINTCState *)opaque;
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
-    uint32_t status_addr = GICINT_STATUS_BASE + ((0x100 * irq) >> 2);
+    const AspeedINTCIRQ *irq;
     uint32_t select = 0;
     uint32_t enable;
     int i;
 
-    if (irq >= aic->num_ints) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid interrupt number: %d\n",
-                      __func__, irq);
+    if (irq_idx >= aic->num_inpins) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid input interrupt number: %d\n",
+                      __func__, irq_idx);
         return;
     }
 
-    trace_aspeed_intc_set_irq(irq, level);
-    enable = s->enable[irq];
+    irq = &aic->irq_table[irq_idx];
+
+    trace_aspeed_intc_set_irq(irq->inpin_idx, level);
+    enable = s->enable[irq->inpin_idx];
 
     if (!level) {
         return;
     }
 
     for (i = 0; i < aic->num_lines; i++) {
-        if (s->orgates[irq].levels[i]) {
+        if (s->orgates[irq->inpin_idx].levels[i]) {
             if (enable & BIT(i)) {
                 select |= BIT(i);
             }
@@ -92,7 +136,7 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
 
     trace_aspeed_intc_select(select);
 
-    if (s->mask[irq] || s->regs[status_addr]) {
+    if (s->mask[irq->inpin_idx] || s->regs[irq->status_addr]) {
         /*
          * a. mask is not 0 means in ISR mode
          * sources interrupt routine are executing.
@@ -101,16 +145,18 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
          *
          * save source interrupt to pending variable.
          */
-        s->pending[irq] |= select;
-        trace_aspeed_intc_pending_irq(irq, s->pending[irq]);
+        s->pending[irq->inpin_idx] |= select;
+        trace_aspeed_intc_pending_irq(irq->inpin_idx,
+                                      s->pending[irq->inpin_idx]);
     } else {
         /*
          * notify firmware which source interrupt are coming
          * by setting status register
          */
-        s->regs[status_addr] = select;
-        trace_aspeed_intc_trigger_irq(irq, s->regs[status_addr]);
-        aspeed_intc_update(s, irq, 1);
+        s->regs[irq->status_addr] = select;
+        trace_aspeed_intc_trigger_irq(irq->inpin_idx, irq->outpin_idx,
+                                      s->regs[irq->status_addr]);
+        aspeed_intc_update(s, irq->inpin_idx, irq->outpin_idx, 1);
     }
 }
 
@@ -118,16 +164,16 @@ static void aspeed_2700_intc_enable_handler(AspeedINTCState *s, uint32_t addr,
                                             uint64_t data)
 {
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
-    uint32_t offset = addr << 2;
+    const AspeedINTCIRQ *irq;
     uint32_t old_enable;
     uint32_t change;
-    uint32_t irq;
 
-    irq = (offset & 0x0f00) >> 8;
+    irq = aspeed_intc_get_irq(aic, addr);
 
-    if (irq >= aic->num_ints) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid interrupt number: %d\n",
-                      __func__, irq);
+    if (irq->inpin_idx >= aic->num_inpins) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid input pin index number: %d\n",
+                      __func__, irq->inpin_idx);
         return;
     }
 
@@ -138,17 +184,17 @@ static void aspeed_2700_intc_enable_handler(AspeedINTCState *s, uint32_t addr,
      */
 
     /* disable all source interrupt */
-    if (!data && !s->enable[irq]) {
+    if (!data && !s->enable[irq->inpin_idx]) {
         s->regs[addr] = data;
         return;
     }
 
-    old_enable = s->enable[irq];
-    s->enable[irq] |= data;
+    old_enable = s->enable[irq->inpin_idx];
+    s->enable[irq->inpin_idx] |= data;
 
     /* enable new source interrupt */
-    if (old_enable != s->enable[irq]) {
-        trace_aspeed_intc_enable(s->enable[irq]);
+    if (old_enable != s->enable[irq->inpin_idx]) {
+        trace_aspeed_intc_enable(s->enable[irq->inpin_idx]);
         s->regs[addr] = data;
         return;
     }
@@ -156,11 +202,11 @@ static void aspeed_2700_intc_enable_handler(AspeedINTCState *s, uint32_t addr,
     /* mask and unmask source interrupt */
     change = s->regs[addr] ^ data;
     if (change & data) {
-        s->mask[irq] &= ~change;
-        trace_aspeed_intc_unmask(change, s->mask[irq]);
+        s->mask[irq->inpin_idx] &= ~change;
+        trace_aspeed_intc_unmask(change, s->mask[irq->inpin_idx]);
     } else {
-        s->mask[irq] |= change;
-        trace_aspeed_intc_mask(change, s->mask[irq]);
+        s->mask[irq->inpin_idx] |= change;
+        trace_aspeed_intc_mask(change, s->mask[irq->inpin_idx]);
     }
     s->regs[addr] = data;
 }
@@ -169,19 +215,19 @@ static void aspeed_2700_intc_status_handler(AspeedINTCState *s, uint32_t addr,
                                             uint64_t data)
 {
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
-    uint32_t offset = addr << 2;
-    uint32_t irq;
-
-    irq = (offset & 0x0f00) >> 8;
+    const AspeedINTCIRQ *irq;
 
     if (!data) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid data 0\n", __func__);
         return;
     }
 
-    if (irq >= aic->num_ints) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid interrupt number: %d\n",
-                      __func__, irq);
+    irq = aspeed_intc_get_irq(aic, addr);
+
+    if (irq->inpin_idx >= aic->num_inpins) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid input pin index number: %d\n",
+                      __func__, irq->inpin_idx);
         return;
     }
 
@@ -200,21 +246,22 @@ static void aspeed_2700_intc_status_handler(AspeedINTCState *s, uint32_t addr,
 
     /* All source ISR execution are done */
     if (!s->regs[addr]) {
-        trace_aspeed_intc_all_isr_done(irq);
-        if (s->pending[irq]) {
+        trace_aspeed_intc_all_isr_done(irq->inpin_idx);
+        if (s->pending[irq->inpin_idx]) {
             /*
              * handle pending source interrupt
              * notify firmware which source interrupt are pending
              * by setting status register
              */
-            s->regs[addr] = s->pending[irq];
-            s->pending[irq] = 0;
-            trace_aspeed_intc_trigger_irq(irq, s->regs[addr]);
-            aspeed_intc_update(s, irq, 1);
+            s->regs[addr] = s->pending[irq->inpin_idx];
+            s->pending[irq->inpin_idx] = 0;
+            trace_aspeed_intc_trigger_irq(irq->inpin_idx, irq->outpin_idx,
+                                          s->regs[addr]);
+            aspeed_intc_update(s, irq->inpin_idx, irq->outpin_idx, 1);
         } else {
             /* clear irq */
-            trace_aspeed_intc_clear_irq(irq, 0);
-            aspeed_intc_update(s, irq, 0);
+            trace_aspeed_intc_clear_irq(irq->inpin_idx, irq->outpin_idx, 0);
+            aspeed_intc_update(s, irq->inpin_idx, irq->outpin_idx, 0);
         }
     }
 }
@@ -301,8 +348,8 @@ static void aspeed_intc_instance_init(Object *obj)
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     int i;
 
-    assert(aic->num_ints <= ASPEED_INTC_NR_INTS);
-    for (i = 0; i < aic->num_ints; i++) {
+    assert(aic->num_inpins <= ASPEED_INTC_MAX_INPINS);
+    for (i = 0; i < aic->num_inpins; i++) {
         object_initialize_child(obj, "intc-orgates[*]", &s->orgates[i],
                                 TYPE_OR_IRQ);
         object_property_set_int(OBJECT(&s->orgates[i]), "num-lines",
@@ -337,12 +384,15 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
 
     memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
 
-    qdev_init_gpio_in(dev, aspeed_intc_set_irq, aic->num_ints);
+    qdev_init_gpio_in(dev, aspeed_intc_set_irq, aic->num_inpins);
 
-    for (i = 0; i < aic->num_ints; i++) {
+    for (i = 0; i < aic->num_inpins; i++) {
         if (!qdev_realize(DEVICE(&s->orgates[i]), NULL, errp)) {
             return;
         }
+    }
+
+    for (i = 0; i < aic->num_outpins; i++) {
         sysbus_init_irq(sbd, &s->output_pins[i]);
     }
 }
@@ -387,10 +437,13 @@ static void aspeed_2700_intc0_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "ASPEED 2700 INTC 0 Controller";
     aic->num_lines = 32;
-    aic->num_ints = 9;
+    aic->num_inpins = 9;
+    aic->num_outpins = 9;
     aic->reg_ops = &aspeed_2700_intc0_ops;
     aic->mem_size = 0x4000;
     aic->reg_size = 0x2000;
+    aic->irq_table = aspeed_2700_intc0_irqs;
+    aic->irq_table_count = ARRAY_SIZE(aspeed_2700_intc0_irqs);
 }
 
 static const TypeInfo aspeed_2700_intc0_info = {
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 3dcf147198..af9703e1b5 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -82,12 +82,12 @@ aspeed_vic_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64
 # aspeed_intc.c
 aspeed_intc_read(uint64_t offset, unsigned size, uint32_t value) "From 0x%" PRIx64 " of size %u: 0x%" PRIx32
 aspeed_intc_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
-aspeed_intc_set_irq(int irq, int level) "Set IRQ %d: %d"
-aspeed_intc_clear_irq(int irq, int level) "Clear IRQ %d: %d"
-aspeed_intc_update_irq(int irq, int level) "Update IRQ: %d: %d"
-aspeed_intc_pending_irq(int irq, uint32_t value) "Pending IRQ: %d: 0x%x"
-aspeed_intc_trigger_irq(int irq, uint32_t value) "Trigger IRQ: %d: 0x%x"
-aspeed_intc_all_isr_done(int irq) "All source ISR execution are done: %d"
+aspeed_intc_set_irq(int inpin_idx, int level) "Set IRQ %d: %d"
+aspeed_intc_clear_irq(int inpin_idx, int outpin_idx, int level) "Clear IRQ %d-%d: %d"
+aspeed_intc_update_irq(int inpin_idx, int outpin_idx, int level) "Update IRQ: %d-%d: %d"
+aspeed_intc_pending_irq(int inpin_idx, uint32_t value) "Pending IRQ: %d: 0x%x"
+aspeed_intc_trigger_irq(int inpin_idx, int outpin_idx, uint32_t value) "Trigger IRQ: %d-%d: 0x%x"
+aspeed_intc_all_isr_done(int inpin_idx) "All source ISR execution are done: %d"
 aspeed_intc_enable(uint32_t value) "Enable: 0x%x"
 aspeed_intc_select(uint32_t value) "Select: 0x%x"
 aspeed_intc_mask(uint32_t change, uint32_t value) "Mask: 0x%x: 0x%x"
diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index d881cb7088..73261037ea 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -17,7 +17,16 @@
 OBJECT_DECLARE_TYPE(AspeedINTCState, AspeedINTCClass, ASPEED_INTC)
 
 #define ASPEED_INTC_NR_REGS (0x2000 >> 2)
-#define ASPEED_INTC_NR_INTS 9
+#define ASPEED_INTC_MAX_INPINS 9
+#define ASPEED_INTC_MAX_OUTPINS 9
+
+typedef struct AspeedINTCIRQ {
+    int inpin_idx;
+    int outpin_idx;
+    int num_outpins;
+    uint32_t enable_addr;
+    uint32_t status_addr;
+} AspeedINTCIRQ;
 
 struct AspeedINTCState {
     /*< private >*/
@@ -28,22 +37,25 @@ struct AspeedINTCState {
     MemoryRegion iomem_container;
 
     uint32_t regs[ASPEED_INTC_NR_REGS];
-    OrIRQState orgates[ASPEED_INTC_NR_INTS];
-    qemu_irq output_pins[ASPEED_INTC_NR_INTS];
+    OrIRQState orgates[ASPEED_INTC_MAX_INPINS];
+    qemu_irq output_pins[ASPEED_INTC_MAX_OUTPINS];
 
-    uint32_t enable[ASPEED_INTC_NR_INTS];
-    uint32_t mask[ASPEED_INTC_NR_INTS];
-    uint32_t pending[ASPEED_INTC_NR_INTS];
+    uint32_t enable[ASPEED_INTC_MAX_INPINS];
+    uint32_t mask[ASPEED_INTC_MAX_INPINS];
+    uint32_t pending[ASPEED_INTC_MAX_INPINS];
 };
 
 struct AspeedINTCClass {
     SysBusDeviceClass parent_class;
 
     uint32_t num_lines;
-    uint32_t num_ints;
+    uint32_t num_inpins;
+    uint32_t num_outpins;
     const MemoryRegionOps *reg_ops;
     uint64_t mem_size;
     uint64_t reg_size;
+    const AspeedINTCIRQ *irq_table;
+    int irq_table_count;
 };
 
 #endif /* ASPEED_INTC_H */
-- 
2.34.1

