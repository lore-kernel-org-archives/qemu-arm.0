Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1938879njm;
        Thu, 6 Mar 2025 20:03:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYx7V5yJ6dh9WUEbt8CxC89ez5XqzeV4RRZsvF35fvMdjbBx34TCKqINlUZ0/A2fyUgeFWpWQZlqHdIg==@linaro.org
X-Google-Smtp-Source: AGHT+IEo48whz/bOPgA6CCBxu+lZPraaDKB14sm+SccoWjCh/imF97qrn086Mm+DrOgzxyWqlHaY
X-Received: by 2002:a05:6214:1d02:b0:6e4:4274:aaf8 with SMTP id 6a1803df08f44-6e90063f89emr26602566d6.17.1741320214584;
        Thu, 06 Mar 2025 20:03:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741320214; cv=none;
        d=google.com; s=arc-20240605;
        b=LRTQUoBiOb9mcun8wrpkhun2lVN9NZ2LyUrgBuJlW6iTakeWsFqp6LNFQcsiI0TO1+
         wUvr6kYUVPNJF3YvYrIsBGV+CEMlZLXKdGnvGDV2u+lh3G6MhdhvS/oCwhOPNlj8eVx1
         hr4ddgCexdJ0m25m7a2OYnBF7pxKvQ3RrA32RYDmfhW175g8LKoNTPaxRihNI1NktrNH
         /pj/vIc2Y1x8Xm3SW5oQfu4NwKm3TjIk07In8BczDtJgE5fsbriftgQV5h9pD+6/A5KI
         EeQn7jMf5dtvB+atCPkuUJxYYMTF8EElLMIpfiJQK/GQcJq4y9ngTM8l2SieY8bA4D0j
         y0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=fo4mi1Owqtn0IPFLb5Bytlv60SieGkEAzTUgy08oKAU=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=ADRUF7WFIl79XFm/C+6PfjsVEBMYa9E77YP6Or8Q1kx2iolY5rslhayZ8U/MKGPb1O
         Fl0H6IdyWmB/BIYHrbNF9J4xelXkyk7TZWb6ZqkN4xp8TQJjFWxRYWG9s1NNTiZuofGf
         j3fZienfFObg0wl1V5yfE5tUOb85htBmIncpl2W6dtAUjBnplHcQ8oS0jbWxzAwEiw8Z
         I77byGybzGiqHF4R/ncgl7RZk+qFmhOeAHWkmR6nOiTbbIoHGymbef/Ujlb9XosXT+Aa
         yiTCZJcPAAxOFlWFo53sIBHkF8ho9EMUioSydvMMXWEF88RDurXrldaBNINdfqTFa0zp
         oKYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7174c2esi25525206d6.299.2025.03.06.20.03.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 20:03:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqOsS-0007Zs-Cu; Thu, 06 Mar 2025 23:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOsR-0007ZT-7l; Thu, 06 Mar 2025 22:59:59 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOsP-0004iq-IM; Thu, 06 Mar 2025 22:59:58 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 7 Mar
 2025 11:59:46 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 7 Mar 2025 11:59:46 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v6 02/29] hw/intc/aspeed: Rename status_addr and addr to
 status_reg and reg for clarity
Date: Fri, 7 Mar 2025 11:59:11 +0800
Message-ID: <20250307035945.3698802-3-jamin_lin@aspeedtech.com>
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
X-TUID: dawzLxZtLlDK

Rename the variables "status_addr" to "status_reg" and "addr" to "reg" because
they are used as register index. This change makes the code more appropriate
and improves readability.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/intc/aspeed_intc.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 033b574c1e..465f41e4fd 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -60,7 +60,7 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
 {
     AspeedINTCState *s = (AspeedINTCState *)opaque;
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
-    uint32_t status_addr = GICINT_STATUS_BASE + ((0x100 * irq) >> 2);
+    uint32_t status_reg = GICINT_STATUS_BASE + ((0x100 * irq) >> 2);
     uint32_t select = 0;
     uint32_t enable;
     int i;
@@ -92,7 +92,7 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
 
     trace_aspeed_intc_select(select);
 
-    if (s->mask[irq] || s->regs[status_addr]) {
+    if (s->mask[irq] || s->regs[status_reg]) {
         /*
          * a. mask is not 0 means in ISR mode
          * sources interrupt routine are executing.
@@ -108,8 +108,8 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
          * notify firmware which source interrupt are coming
          * by setting status register
          */
-        s->regs[status_addr] = select;
-        trace_aspeed_intc_trigger_irq(irq, s->regs[status_addr]);
+        s->regs[status_reg] = select;
+        trace_aspeed_intc_trigger_irq(irq, s->regs[status_reg]);
         aspeed_intc_update(s, irq, 1);
     }
 }
@@ -117,17 +117,17 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
 static uint64_t aspeed_intc_read(void *opaque, hwaddr offset, unsigned int size)
 {
     AspeedINTCState *s = ASPEED_INTC(opaque);
-    uint32_t addr = offset >> 2;
+    uint32_t reg = offset >> 2;
     uint32_t value = 0;
 
-    if (addr >= ASPEED_INTC_NR_REGS) {
+    if (reg >= ASPEED_INTC_NR_REGS) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
         return 0;
     }
 
-    value = s->regs[addr];
+    value = s->regs[reg];
     trace_aspeed_intc_read(offset, size, value);
 
     return value;
@@ -138,12 +138,12 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
 {
     AspeedINTCState *s = ASPEED_INTC(opaque);
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
-    uint32_t addr = offset >> 2;
+    uint32_t reg = offset >> 2;
     uint32_t old_enable;
     uint32_t change;
     uint32_t irq;
 
-    if (addr >= ASPEED_INTC_NR_REGS) {
+    if (reg >= ASPEED_INTC_NR_REGS) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -152,7 +152,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
 
     trace_aspeed_intc_write(offset, size, data);
 
-    switch (addr) {
+    switch (reg) {
     case R_GICINT128_EN:
     case R_GICINT129_EN:
     case R_GICINT130_EN:
@@ -177,7 +177,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
 
         /* disable all source interrupt */
         if (!data && !s->enable[irq]) {
-            s->regs[addr] = data;
+            s->regs[reg] = data;
             return;
         }
 
@@ -187,12 +187,12 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
         /* enable new source interrupt */
         if (old_enable != s->enable[irq]) {
             trace_aspeed_intc_enable(s->enable[irq]);
-            s->regs[addr] = data;
+            s->regs[reg] = data;
             return;
         }
 
         /* mask and unmask source interrupt */
-        change = s->regs[addr] ^ data;
+        change = s->regs[reg] ^ data;
         if (change & data) {
             s->mask[irq] &= ~change;
             trace_aspeed_intc_unmask(change, s->mask[irq]);
@@ -200,7 +200,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
             s->mask[irq] |= change;
             trace_aspeed_intc_mask(change, s->mask[irq]);
         }
-        s->regs[addr] = data;
+        s->regs[reg] = data;
         break;
     case R_GICINT128_STATUS:
     case R_GICINT129_STATUS:
@@ -220,7 +220,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
         }
 
         /* clear status */
-        s->regs[addr] &= ~data;
+        s->regs[reg] &= ~data;
 
         /*
          * These status registers are used for notify sources ISR are executed.
@@ -233,7 +233,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
         }
 
         /* All source ISR execution are done */
-        if (!s->regs[addr]) {
+        if (!s->regs[reg]) {
             trace_aspeed_intc_all_isr_done(irq);
             if (s->pending[irq]) {
                 /*
@@ -241,9 +241,9 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
                  * notify firmware which source interrupt are pending
                  * by setting status register
                  */
-                s->regs[addr] = s->pending[irq];
+                s->regs[reg] = s->pending[irq];
                 s->pending[irq] = 0;
-                trace_aspeed_intc_trigger_irq(irq, s->regs[addr]);
+                trace_aspeed_intc_trigger_irq(irq, s->regs[reg]);
                 aspeed_intc_update(s, irq, 1);
             } else {
                 /* clear irq */
@@ -253,7 +253,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
         }
         break;
     default:
-        s->regs[addr] = data;
+        s->regs[reg] = data;
         break;
     }
 
-- 
2.43.0

