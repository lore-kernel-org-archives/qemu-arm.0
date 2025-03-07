Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1937701njm;
        Thu, 6 Mar 2025 20:00:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWnT17JLLPTmsNpQhh3qCD6Ro2u7UD64Vjv7sGdCWDBRZ9sQkZVYvOLdVuy2iHyx5yja0OqtQHW6Wj4YQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEaJtU07/RGSc80DeKdAMRNbSWGBsUcFrVjEr449tuyYCcG1N+GhdQiyK9HtMw8FFiNZSGh
X-Received: by 2002:a05:6214:2464:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6e900698278mr27923936d6.38.1741320053829;
        Thu, 06 Mar 2025 20:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741320053; cv=none;
        d=google.com; s=arc-20240605;
        b=C7bq+TgWsAMFcXlB8BkkVntjhZxC6LZclJc0tvPNbkP6EJlW8H+VbJjmqDLMqYN3vT
         IqmzqsXItL1BjI8qeQ2+QR7IZ1b2iyFSTBp895vTkZ0jAhSRxD20rx2bGRsn7PWwCbZS
         EjzmJAjE76Z3AlsAWrrsyAWhCj2IAoLUk7oFkKdkYZzxCX2HuroxzSm7FW3uZnCPNBfH
         t7jhQMWsEVtQTaSA2NTCq9ev/uAxvLl1NJ2RKiWVhg4rKsykHBGK0xp0TUto7RwaLaLe
         UNVk4PwFwBySjh0fpGjCdy29zIFb5gLpY4Pj7UfXPt09L6V22yjlSbVwkNc2diEsZemI
         yUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=7xFUnrfXSAZqyC0o6XEzTWsw3PkVn9VjQt/81C4ledk=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=NGKce9zOWTWgBbAgaTGqrWhbPZ/s8aKsZwJSiu+JWVFhT8QpXl47bWB2Cy6lQR3uDW
         JHKxHBEwxhlhEKpr3l/inIzfeylkKAAintVJAomP+vyl4WOmg9bRiWMI1q5UC9uMggdw
         8yrGgX3yboJIquBxuJ80c9iARFcKkvhvnIwzQq7bYT9G/CzhsKj7EwP+d9eyHNwyK1LR
         VYJduK/c/aviooxs5iNcSZ7cB1Uke9RxhZrKUUV36Fm1AgMYCmgIh5gDkS3MK3S7VGqe
         T8f81iBThDcQB/vmPQkwAapX5wEL1Xwr45V0Uk64ZZcGD7aulyaeG0lup8wZAJ8x81AX
         aw7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f71755b1si26678276d6.329.2025.03.06.20.00.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 20:00:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqOtB-0008Ke-IM; Thu, 06 Mar 2025 23:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOt5-00086G-M9; Thu, 06 Mar 2025 23:00:39 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOt3-00050B-Cz; Thu, 06 Mar 2025 23:00:39 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 7 Mar
 2025 11:59:50 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 7 Mar 2025 11:59:50 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v6 13/29] hw/intc/aspeed: Refactor INTC to support separate
 input and output pin indices
Date: Fri, 7 Mar 2025 11:59:22 +0800
Message-ID: <20250307035945.3698802-14-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
References: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
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
X-TUID: y+W/nVG5GOjl

Refactors the INTC to distinguish between input and output pin indices,
improving interrupt handling clarity and accuracy.

Updated the functions to handle both input and output pin indices.
Added detailed logging for input and output pin indices in trace events.

These changes ensure that the INTC controller can handle multiple input and
output pins, improving support for the AST2700 A1.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/intc/aspeed_intc.c | 97 +++++++++++++++++++++++++++----------------
 hw/intc/trace-events  | 12 +++---
 2 files changed, 67 insertions(+), 42 deletions(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 6f37afc17e..1cbee0e17a 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -42,20 +42,32 @@ REG32(GICINT136_STATUS,     0x804)
 
 #define GICINT_STATUS_BASE     R_GICINT128_STATUS
 
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
     const char *name = object_get_typename(OBJECT(s));
 
-    if (irq >= aic->num_inpins) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Invalid input pin index: %d\n",
-                      __func__, irq);
+    if (inpin_idx >= aic->num_inpins) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid input pin index: %d\n",
+                      __func__, inpin_idx);
         return;
     }
 
-    trace_aspeed_intc_update_irq(name, irq, level);
-    qemu_set_irq(s->output_pins[irq], level);
+    if (outpin_idx >= aic->num_outpins) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid output pin index: %d\n",
+                      __func__, outpin_idx);
+        return;
+    }
+
+    trace_aspeed_intc_update_irq(name, inpin_idx, outpin_idx, level);
+    qemu_set_irq(s->output_pins[outpin_idx], level);
 }
 
 /*
@@ -72,23 +84,28 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
     uint32_t status_reg = GICINT_STATUS_BASE + ((0x100 * irq) >> 2);
     uint32_t select = 0;
     uint32_t enable;
+    int outpin_idx;
+    int inpin_idx;
     int i;
 
+    outpin_idx = irq;
+    inpin_idx = irq;
+
     if (irq >= aic->num_inpins) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid input pin index: %d\n",
                       __func__, irq);
         return;
     }
 
-    trace_aspeed_intc_set_irq(name, irq, level);
-    enable = s->enable[irq];
+    trace_aspeed_intc_set_irq(name, inpin_idx, level);
+    enable = s->enable[inpin_idx];
 
     if (!level) {
         return;
     }
 
     for (i = 0; i < aic->num_lines; i++) {
-        if (s->orgates[irq].levels[i]) {
+        if (s->orgates[inpin_idx].levels[i]) {
             if (enable & BIT(i)) {
                 select |= BIT(i);
             }
@@ -101,7 +118,7 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
 
     trace_aspeed_intc_select(name, select);
 
-    if (s->mask[irq] || s->regs[status_reg]) {
+    if (s->mask[inpin_idx] || s->regs[status_reg]) {
         /*
          * a. mask is not 0 means in ISR mode
          * sources interrupt routine are executing.
@@ -110,16 +127,17 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
          *
          * save source interrupt to pending variable.
          */
-        s->pending[irq] |= select;
-        trace_aspeed_intc_pending_irq(name, irq, s->pending[irq]);
+        s->pending[inpin_idx] |= select;
+        trace_aspeed_intc_pending_irq(name, inpin_idx, s->pending[inpin_idx]);
     } else {
         /*
          * notify firmware which source interrupt are coming
          * by setting status register
          */
         s->regs[status_reg] = select;
-        trace_aspeed_intc_trigger_irq(name, irq, s->regs[status_reg]);
-        aspeed_intc_update(s, irq, 1);
+        trace_aspeed_intc_trigger_irq(name, inpin_idx, outpin_idx,
+                                      s->regs[status_reg]);
+        aspeed_intc_update(s, inpin_idx, outpin_idx, 1);
     }
 }
 
@@ -131,14 +149,16 @@ static void aspeed_intc_enable_handler(AspeedINTCState *s, hwaddr offset,
     uint32_t reg = offset >> 2;
     uint32_t old_enable;
     uint32_t change;
+    int inpin_idx;
     uint32_t irq;
 
     irq = (offset & 0x0f00) >> 8;
+    inpin_idx = irq;
 
-    if (irq >= aic->num_inpins) {
+    if (inpin_idx >= aic->num_inpins) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Invalid input pin index: %d\n",
-                      __func__, irq);
+                      __func__, inpin_idx);
         return;
     }
 
@@ -149,17 +169,17 @@ static void aspeed_intc_enable_handler(AspeedINTCState *s, hwaddr offset,
      */
 
     /* disable all source interrupt */
-    if (!data && !s->enable[irq]) {
+    if (!data && !s->enable[inpin_idx]) {
         s->regs[reg] = data;
         return;
     }
 
-    old_enable = s->enable[irq];
-    s->enable[irq] |= data;
+    old_enable = s->enable[inpin_idx];
+    s->enable[inpin_idx] |= data;
 
     /* enable new source interrupt */
-    if (old_enable != s->enable[irq]) {
-        trace_aspeed_intc_enable(name, s->enable[irq]);
+    if (old_enable != s->enable[inpin_idx]) {
+        trace_aspeed_intc_enable(name, s->enable[inpin_idx]);
         s->regs[reg] = data;
         return;
     }
@@ -167,11 +187,11 @@ static void aspeed_intc_enable_handler(AspeedINTCState *s, hwaddr offset,
     /* mask and unmask source interrupt */
     change = s->regs[reg] ^ data;
     if (change & data) {
-        s->mask[irq] &= ~change;
-        trace_aspeed_intc_unmask(name, change, s->mask[irq]);
+        s->mask[inpin_idx] &= ~change;
+        trace_aspeed_intc_unmask(name, change, s->mask[inpin_idx]);
     } else {
-        s->mask[irq] |= change;
-        trace_aspeed_intc_mask(name, change, s->mask[irq]);
+        s->mask[inpin_idx] |= change;
+        trace_aspeed_intc_mask(name, change, s->mask[inpin_idx]);
     }
 
     s->regs[reg] = data;
@@ -183,6 +203,8 @@ static void aspeed_intc_status_handler(AspeedINTCState *s, hwaddr offset,
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     const char *name = object_get_typename(OBJECT(s));
     uint32_t reg = offset >> 2;
+    int outpin_idx;
+    int inpin_idx;
     uint32_t irq;
 
     if (!data) {
@@ -191,11 +213,13 @@ static void aspeed_intc_status_handler(AspeedINTCState *s, hwaddr offset,
     }
 
     irq = (offset & 0x0f00) >> 8;
+    outpin_idx = irq;
+    inpin_idx = irq;
 
-    if (irq >= aic->num_inpins) {
+    if (inpin_idx >= aic->num_inpins) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Invalid input pin index: %d\n",
-                      __func__, irq);
+                      __func__, inpin_idx);
         return;
     }
 
@@ -214,21 +238,22 @@ static void aspeed_intc_status_handler(AspeedINTCState *s, hwaddr offset,
 
     /* All source ISR execution are done */
     if (!s->regs[reg]) {
-        trace_aspeed_intc_all_isr_done(name, irq);
-        if (s->pending[irq]) {
+        trace_aspeed_intc_all_isr_done(name, inpin_idx);
+        if (s->pending[inpin_idx]) {
             /*
              * handle pending source interrupt
              * notify firmware which source interrupt are pending
              * by setting status register
              */
-            s->regs[reg] = s->pending[irq];
-            s->pending[irq] = 0;
-            trace_aspeed_intc_trigger_irq(name, irq, s->regs[reg]);
-            aspeed_intc_update(s, irq, 1);
+            s->regs[reg] = s->pending[inpin_idx];
+            s->pending[inpin_idx] = 0;
+            trace_aspeed_intc_trigger_irq(name, inpin_idx, outpin_idx,
+                                          s->regs[reg]);
+            aspeed_intc_update(s, inpin_idx, outpin_idx, 1);
         } else {
             /* clear irq */
-            trace_aspeed_intc_clear_irq(name, irq, 0);
-            aspeed_intc_update(s, irq, 0);
+            trace_aspeed_intc_clear_irq(name, inpin_idx, outpin_idx, 0);
+            aspeed_intc_update(s, inpin_idx, outpin_idx, 0);
         }
     }
 }
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index e9ca34755e..e97eea820b 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -82,12 +82,12 @@ aspeed_vic_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64
 # aspeed_intc.c
 aspeed_intc_read(const char *s, uint64_t offset, unsigned size, uint32_t value) "%s: From 0x%" PRIx64 " of size %u: 0x%" PRIx32
 aspeed_intc_write(const char *s, uint64_t offset, unsigned size, uint32_t data) "%s: To 0x%" PRIx64 " of size %u: 0x%" PRIx32
-aspeed_intc_set_irq(const char *s, int irq, int level) "%s: Set IRQ %d: %d"
-aspeed_intc_clear_irq(const char *s, int irq, int level) "%s: Clear IRQ %d: %d"
-aspeed_intc_update_irq(const char *s, int irq, int level) "%s: Update IRQ: %d: %d"
-aspeed_intc_pending_irq(const char *s, int irq, uint32_t value) "%s: Pending IRQ: %d: 0x%x"
-aspeed_intc_trigger_irq(const char *s, int irq, uint32_t value) "%s: Trigger IRQ: %d: 0x%x"
-aspeed_intc_all_isr_done(const char *s, int irq) "%s: All source ISR execution are done: %d"
+aspeed_intc_set_irq(const char *s, int inpin_idx, int level) "%s: Set IRQ %d: %d"
+aspeed_intc_clear_irq(const char *s, int inpin_idx, int outpin_idx, int level) "%s: Clear IRQ %d-%d: %d"
+aspeed_intc_update_irq(const char *s, int inpin_idx, int outpin_idx, int level) "%s: Update IRQ: %d-%d: %d"
+aspeed_intc_pending_irq(const char *s, int inpin_idx, uint32_t value) "%s: Pending IRQ: %d: 0x%x"
+aspeed_intc_trigger_irq(const char *s, int inpin_idx, int outpin_idx, uint32_t value) "%s: Trigger IRQ: %d-%d: 0x%x"
+aspeed_intc_all_isr_done(const char *s, int inpin_idx) "%s: All source ISR execution are done: %d"
 aspeed_intc_enable(const char *s, uint32_t value) "%s: Enable: 0x%x"
 aspeed_intc_select(const char *s, uint32_t value) "%s: Select: 0x%x"
 aspeed_intc_mask(const char *s, uint32_t change, uint32_t value) "%s: Mask: 0x%x: 0x%x"
-- 
2.43.0

