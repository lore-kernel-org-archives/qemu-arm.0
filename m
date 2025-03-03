Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2503914njb;
        Mon, 3 Mar 2025 01:56:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXkzhYCIJOcXy5rPA9geVnniBMHvAVaHHAAYykEoGXRbU+LxVq4RlH9BPYpIScdWxWOUMf/c1lRkBJUWw==@linaro.org
X-Google-Smtp-Source: AGHT+IEQCBFXyCVFe9T6xwdLJvlxyhaqvy2icQPFf5Hw2+oLc0kBQsNSNuJJMKlPQNf4vKd7XnJ7
X-Received: by 2002:a05:620a:17aa:b0:7c0:c2a9:94e5 with SMTP id af79cd13be357-7c39c49d9bcmr1939022085a.1.1740995809611;
        Mon, 03 Mar 2025 01:56:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740995809; cv=none;
        d=google.com; s=arc-20240605;
        b=cBqIh6RYxZQBa57d2WtKSsDar7P27erdn3p/nZ9KJ2VBfps76Gyy4Q+M60W+MIBLSI
         rXQuO4aT0dmIwf0KLNbuWVMg7/k6IxasRjyCCcR6tzIJFN+BXtwpIR8+51U7XEdd10QT
         jg7DWTqczmrQD97G8pVK3gicCvFDvnlFKuICtaxzhMhs8rbKsjTy1lT0aSBfmqDtBkB8
         lTy7Dc4z5W78TDykGUqMjdB/JRAxh6icYoo9kSSvEsV1QXTDVJP4XIdA9Cj/GS/u24Nm
         bXqfgR4Vvwhtfv8ny1dN7R/93Yer6W682oODQtCbHBfc96wInuC+Nhr1fYyGBTeI7+qR
         ZV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=GDlk30t4ZHOTpSXgVAsp3LRrEAd/Aw5BVAoQv/jjJUU=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=d+yar7L2gK056XxDQceBHS7h28Q4mLnW84qAzLQo/mFRV4YMG7jP8OLUMhKvw11ZPY
         LPKKHwfCT7ed2wKYjis8k0PYywofKwseyPdtokAMTaQKHJ4Qp2+QurcQry3yarC3PnAa
         ogzPDqbx1xby/h+yflXusOb0+sJMJNxclX4617tUQwZHia1AJELl02K9//+c3eiAygxr
         w0yVhobc7a07LXqKIjC6Xut47o3I7XfAhvtTLtWOQaSDmETwXBL6B+bMX3s3kiPRmA9k
         +zquBIlnJ7uJhfQ9Kyi0m/BgwooVB4LQgtuZWzp3+DOQxbDSgtUe2HfEKjtaBzv/xxq6
         NJBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3749e006asi854241585a.361.2025.03.03.01.56.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 01:56:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tp2Wq-00083B-P8; Mon, 03 Mar 2025 04:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2W4-0007rq-Gg; Mon, 03 Mar 2025 04:55:16 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2W2-0001gH-Ha; Mon, 03 Mar 2025 04:55:16 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 3 Mar
 2025 17:54:59 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 3 Mar 2025 17:54:59 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v4 05/23] hw/intc/aspeed: Add object type name to trace events
 for better debugging
Date: Mon, 3 Mar 2025 17:54:33 +0800
Message-ID: <20250303095457.2337631-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
References: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: WlzUZDd368R3

Currently, these trace events only refer to INTC. To simplify the INTC model,
both INTC(CPU Die) and INTCIO(IO Die) will share the same helper functions.

However, it is difficult to recognize whether these trace events are comes from
INTC or INTCIO. To make these trace events more readable, adds object type name
to the INTC trace events.
Update trace events to include the "name" field for better identification.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/intc/aspeed_intc.c | 32 +++++++++++++++++++-------------
 hw/intc/trace-events  | 24 ++++++++++++------------
 2 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 906331fa32..e94ebb6f4e 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -45,6 +45,7 @@ REG32(GICINT136_STATUS,     0x804)
 static void aspeed_intc_update(AspeedINTCState *s, int irq, int level)
 {
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
+    const char *name = object_get_typename(OBJECT(s));
 
     if (irq >= aic->num_ints) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid interrupt number: %d\n",
@@ -52,7 +53,7 @@ static void aspeed_intc_update(AspeedINTCState *s, int irq, int level)
         return;
     }
 
-    trace_aspeed_intc_update_irq(irq, level);
+    trace_aspeed_intc_update_irq(name, irq, level);
     qemu_set_irq(s->output_pins[irq], level);
 }
 
@@ -66,6 +67,7 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
 {
     AspeedINTCState *s = (AspeedINTCState *)opaque;
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
+    const char *name = object_get_typename(OBJECT(s));
     uint32_t status_addr = GICINT_STATUS_BASE + ((0x100 * irq) >> 2);
     uint32_t select = 0;
     uint32_t enable;
@@ -77,7 +79,7 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
         return;
     }
 
-    trace_aspeed_intc_set_irq(irq, level);
+    trace_aspeed_intc_set_irq(name, irq, level);
     enable = s->enable[irq];
 
     if (!level) {
@@ -96,7 +98,7 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
         return;
     }
 
-    trace_aspeed_intc_select(select);
+    trace_aspeed_intc_select(name, select);
 
     if (s->mask[irq] || s->regs[status_addr]) {
         /*
@@ -108,14 +110,14 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
          * save source interrupt to pending variable.
          */
         s->pending[irq] |= select;
-        trace_aspeed_intc_pending_irq(irq, s->pending[irq]);
+        trace_aspeed_intc_pending_irq(name, irq, s->pending[irq]);
     } else {
         /*
          * notify firmware which source interrupt are coming
          * by setting status register
          */
         s->regs[status_addr] = select;
-        trace_aspeed_intc_trigger_irq(irq, s->regs[status_addr]);
+        trace_aspeed_intc_trigger_irq(name, irq, s->regs[status_addr]);
         aspeed_intc_update(s, irq, 1);
     }
 }
@@ -124,6 +126,7 @@ static void aspeed_intc_enable_handler(AspeedINTCState *s, hwaddr offset,
                                        uint64_t data)
 {
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
+    const char *name = object_get_typename(OBJECT(s));
     uint32_t addr = offset >> 2;
     uint32_t old_enable;
     uint32_t change;
@@ -154,7 +157,7 @@ static void aspeed_intc_enable_handler(AspeedINTCState *s, hwaddr offset,
 
     /* enable new source interrupt */
     if (old_enable != s->enable[irq]) {
-        trace_aspeed_intc_enable(s->enable[irq]);
+        trace_aspeed_intc_enable(name, s->enable[irq]);
         s->regs[addr] = data;
         return;
     }
@@ -163,10 +166,10 @@ static void aspeed_intc_enable_handler(AspeedINTCState *s, hwaddr offset,
     change = s->regs[addr] ^ data;
     if (change & data) {
         s->mask[irq] &= ~change;
-        trace_aspeed_intc_unmask(change, s->mask[irq]);
+        trace_aspeed_intc_unmask(name, change, s->mask[irq]);
     } else {
         s->mask[irq] |= change;
-        trace_aspeed_intc_mask(change, s->mask[irq]);
+        trace_aspeed_intc_mask(name, change, s->mask[irq]);
     }
 
     s->regs[addr] = data;
@@ -176,6 +179,7 @@ static void aspeed_intc_status_handler(AspeedINTCState *s, hwaddr offset,
                                        uint64_t data)
 {
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
+    const char *name = object_get_typename(OBJECT(s));
     uint32_t addr = offset >> 2;
     uint32_t irq;
 
@@ -207,7 +211,7 @@ static void aspeed_intc_status_handler(AspeedINTCState *s, hwaddr offset,
 
     /* All source ISR execution are done */
     if (!s->regs[addr]) {
-        trace_aspeed_intc_all_isr_done(irq);
+        trace_aspeed_intc_all_isr_done(name, irq);
         if (s->pending[irq]) {
             /*
              * handle pending source interrupt
@@ -216,11 +220,11 @@ static void aspeed_intc_status_handler(AspeedINTCState *s, hwaddr offset,
              */
             s->regs[addr] = s->pending[irq];
             s->pending[irq] = 0;
-            trace_aspeed_intc_trigger_irq(irq, s->regs[addr]);
+            trace_aspeed_intc_trigger_irq(name, irq, s->regs[addr]);
             aspeed_intc_update(s, irq, 1);
         } else {
             /* clear irq */
-            trace_aspeed_intc_clear_irq(irq, 0);
+            trace_aspeed_intc_clear_irq(name, irq, 0);
             aspeed_intc_update(s, irq, 0);
         }
     }
@@ -230,6 +234,7 @@ static uint64_t aspeed_intc_read(void *opaque, hwaddr offset, unsigned int size)
 {
     AspeedINTCState *s = ASPEED_INTC(opaque);
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
+    const char *name = object_get_typename(OBJECT(s));
     uint32_t addr = offset >> 2;
     uint32_t value = 0;
 
@@ -241,7 +246,7 @@ static uint64_t aspeed_intc_read(void *opaque, hwaddr offset, unsigned int size)
     }
 
     value = s->regs[addr];
-    trace_aspeed_intc_read(offset, size, value);
+    trace_aspeed_intc_read(name, offset, size, value);
 
     return value;
 }
@@ -251,6 +256,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
 {
     AspeedINTCState *s = ASPEED_INTC(opaque);
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
+    const char *name = object_get_typename(OBJECT(s));
     uint32_t addr = offset >> 2;
 
     if (offset >= aic->reg_size) {
@@ -260,7 +266,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
         return;
     }
 
-    trace_aspeed_intc_write(offset, size, data);
+    trace_aspeed_intc_write(name, offset, size, data);
 
     switch (addr) {
     case R_GICINT128_EN:
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 3dcf147198..e9ca34755e 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -80,18 +80,18 @@ aspeed_vic_update_irq(int flags) "Raising IRQ: %d"
 aspeed_vic_read(uint64_t offset, unsigned size, uint32_t value) "From 0x%" PRIx64 " of size %u: 0x%" PRIx32
 aspeed_vic_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
 # aspeed_intc.c
-aspeed_intc_read(uint64_t offset, unsigned size, uint32_t value) "From 0x%" PRIx64 " of size %u: 0x%" PRIx32
-aspeed_intc_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
-aspeed_intc_set_irq(int irq, int level) "Set IRQ %d: %d"
-aspeed_intc_clear_irq(int irq, int level) "Clear IRQ %d: %d"
-aspeed_intc_update_irq(int irq, int level) "Update IRQ: %d: %d"
-aspeed_intc_pending_irq(int irq, uint32_t value) "Pending IRQ: %d: 0x%x"
-aspeed_intc_trigger_irq(int irq, uint32_t value) "Trigger IRQ: %d: 0x%x"
-aspeed_intc_all_isr_done(int irq) "All source ISR execution are done: %d"
-aspeed_intc_enable(uint32_t value) "Enable: 0x%x"
-aspeed_intc_select(uint32_t value) "Select: 0x%x"
-aspeed_intc_mask(uint32_t change, uint32_t value) "Mask: 0x%x: 0x%x"
-aspeed_intc_unmask(uint32_t change, uint32_t value) "UnMask: 0x%x: 0x%x"
+aspeed_intc_read(const char *s, uint64_t offset, unsigned size, uint32_t value) "%s: From 0x%" PRIx64 " of size %u: 0x%" PRIx32
+aspeed_intc_write(const char *s, uint64_t offset, unsigned size, uint32_t data) "%s: To 0x%" PRIx64 " of size %u: 0x%" PRIx32
+aspeed_intc_set_irq(const char *s, int irq, int level) "%s: Set IRQ %d: %d"
+aspeed_intc_clear_irq(const char *s, int irq, int level) "%s: Clear IRQ %d: %d"
+aspeed_intc_update_irq(const char *s, int irq, int level) "%s: Update IRQ: %d: %d"
+aspeed_intc_pending_irq(const char *s, int irq, uint32_t value) "%s: Pending IRQ: %d: 0x%x"
+aspeed_intc_trigger_irq(const char *s, int irq, uint32_t value) "%s: Trigger IRQ: %d: 0x%x"
+aspeed_intc_all_isr_done(const char *s, int irq) "%s: All source ISR execution are done: %d"
+aspeed_intc_enable(const char *s, uint32_t value) "%s: Enable: 0x%x"
+aspeed_intc_select(const char *s, uint32_t value) "%s: Select: 0x%x"
+aspeed_intc_mask(const char *s, uint32_t change, uint32_t value) "%s: Mask: 0x%x: 0x%x"
+aspeed_intc_unmask(const char *s, uint32_t change, uint32_t value) "%s: UnMask: 0x%x: 0x%x"
 
 # arm_gic.c
 gic_enable_irq(int irq) "irq %d enabled"
-- 
2.34.1

