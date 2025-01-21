Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6494576njn;
        Mon, 20 Jan 2025 23:06:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUcqU10l7M9fT0qhuaKtK5elN7DKZw9XnGHWsT/B0Ee3t40hnyDENBeFRyjO6tMCG7VlMb3lAsj+5oaLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG2Vu+NM4fbJRV9GBZLzp+uhSxyJRWl4GPjsaZ4fExleGoOCjQwWVzK+a6bsKBbHQov/Mtp
X-Received: by 2002:a05:620a:45a2:b0:7b6:da2d:73e5 with SMTP id af79cd13be357-7be6323cd83mr2585131485a.27.1737443164466;
        Mon, 20 Jan 2025 23:06:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737443164; cv=none;
        d=google.com; s=arc-20240605;
        b=SRUY2EXIuRQwdzkdtaKOpT52LCYHua4iz2b7t4t5GUnLol49aB5u65bEw8/NFW7AkL
         j81yWhcMAmVWGZQOb/4A9bBGwLvHCJ0JKN1KTetqTUbeoJFWFtPyZan8LK4CKr3PxOXr
         Vq3u17YmzWn6oOvhuIBHsMrUaI4k3mzMcAWa6m/8vzmrlpjEMoj0VUGS1rtw8hcncwY2
         Z6i8eRwgcy03Kz0UVTtBDbMLZ3swYXOIGj7S8apZXI7AeB2Rf4uux3RSM4FnPhXJMtMU
         9SFSXlVJHrGmmD3jrYufxekZ2Vv985MiEyi6Sta2a+gaWgu/WAIp4XuIuMx5e9TQAJTo
         Mxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=xrul3ShRz4JMGl6MvXjq4w84zY7EY4bE+Gk8W6ylkvc=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=D4HuUz0RrfFDNPHgzYS29SLZT3+90f3qqHq0b5YPTvbRWfuZO4FEcuo47paS11ZbY8
         QucwNzsgoXV4UcExlYnfMxcl+4/mB26/yW4bWjzFlCC6eX2YhWQfwzmVPTb2GYrxqBWe
         W5gEEk993aSOZ8lT7fWfm9voAZRxUe78SYNapHRtqhypR8YfLDzE0hzYMId9sEaaI+qd
         0i9fl0QHd/TrV28p4K70mHov3gor9es8d/Y7FbtLGJW0XsdIDHp/5v2ma1sxWY/rLd24
         DXJit2TrpzV4dU8Sm1BU6CGSuTlKb0ZJWAJETWoe+SLt6P4n3dueSUoHPTT+ILYIvbkF
         ahJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be6146e340si1173694085a.69.2025.01.20.23.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2025 23:06:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ta8Jt-0006kP-Bz; Tue, 21 Jan 2025 02:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Jo-0006in-1P; Tue, 21 Jan 2025 02:05:00 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Jm-0001Q8-4K; Tue, 21 Jan 2025 02:04:59 -0500
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
Subject: [PATCH v1 05/18] hw/intc/aspeed: Introduce helper functions for
 enable and status registers
Date: Tue, 21 Jan 2025 15:04:11 +0800
Message-ID: <20250121070424.2465942-6-jamin_lin@aspeedtech.com>
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
X-TUID: KwrWr58qQzbt

The behavior of the enable and status registers is almost identical between
INTC0 and INTC1. To reduce duplicated code, adds
"aspeed_2700_intc_enable_handler" functions to handle enable register write
behavior and "aspeed_2700_intc_status_handler" functions to handle status
register write behavior.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/intc/aspeed_intc.c | 189 ++++++++++++++++++++++++------------------
 1 file changed, 107 insertions(+), 82 deletions(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 25035c65ca..7dff5e6039 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -114,6 +114,111 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
     }
 }
 
+static void aspeed_2700_intc_enable_handler(AspeedINTCState *s, uint32_t addr,
+                                            uint64_t data)
+{
+    AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
+    uint32_t offset = addr << 2;
+    uint32_t old_enable;
+    uint32_t change;
+    uint32_t irq;
+
+    irq = (offset & 0x0f00) >> 8;
+
+    if (irq >= aic->num_ints) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid interrupt number: %d\n",
+                      __func__, irq);
+        return;
+    }
+
+    /*
+     * The enable registers are used to enable source interrupts.
+     * They also handle masking and unmasking of source interrupts
+     * during the execution of the source ISR.
+     */
+
+    /* disable all source interrupt */
+    if (!data && !s->enable[irq]) {
+        s->regs[addr] = data;
+        return;
+    }
+
+    old_enable = s->enable[irq];
+    s->enable[irq] |= data;
+
+    /* enable new source interrupt */
+    if (old_enable != s->enable[irq]) {
+        trace_aspeed_intc_enable(s->enable[irq]);
+        s->regs[addr] = data;
+        return;
+    }
+
+    /* mask and unmask source interrupt */
+    change = s->regs[addr] ^ data;
+    if (change & data) {
+        s->mask[irq] &= ~change;
+        trace_aspeed_intc_unmask(change, s->mask[irq]);
+    } else {
+        s->mask[irq] |= change;
+        trace_aspeed_intc_mask(change, s->mask[irq]);
+    }
+    s->regs[addr] = data;
+}
+
+static void aspeed_2700_intc_status_handler(AspeedINTCState *s, uint32_t addr,
+                                            uint64_t data)
+{
+    AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
+    uint32_t offset = addr << 2;
+    uint32_t irq;
+
+    irq = (offset & 0x0f00) >> 8;
+
+    if (!data) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid data 0\n", __func__);
+        return;
+    }
+
+    if (irq >= aic->num_ints) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid interrupt number: %d\n",
+                      __func__, irq);
+        return;
+    }
+
+    /* clear status */
+    s->regs[addr] &= ~data;
+
+    /*
+     * The status registers are used for notify sources ISR are executed.
+     * If one source ISR is executed, it will clear one bit.
+     * If it clear all bits, it means to initialize this register status
+     * rather than sources ISR are executed.
+     */
+    if (data == 0xffffffff) {
+        return;
+    }
+
+    /* All source ISR execution are done */
+    if (!s->regs[addr]) {
+        trace_aspeed_intc_all_isr_done(irq);
+        if (s->pending[irq]) {
+            /*
+             * handle pending source interrupt
+             * notify firmware which source interrupt are pending
+             * by setting status register
+             */
+            s->regs[addr] = s->pending[irq];
+            s->pending[irq] = 0;
+            trace_aspeed_intc_trigger_irq(irq, s->regs[addr]);
+            aspeed_intc_update(s, irq, 1);
+        } else {
+            /* clear irq */
+            trace_aspeed_intc_clear_irq(irq, 0);
+            aspeed_intc_update(s, irq, 0);
+        }
+    }
+}
+
 static uint64_t aspeed_2700_intc0_read(void *opaque, hwaddr offset,
                                        unsigned int size)
 {
@@ -141,9 +246,6 @@ static void aspeed_2700_intc0_write(void *opaque, hwaddr offset, uint64_t data,
     AspeedINTCState *s = ASPEED_INTC(opaque);
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     uint32_t addr = offset >> 2;
-    uint32_t old_enable;
-    uint32_t change;
-    uint32_t irq;
 
     if (offset >= aic->reg_size) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -164,45 +266,7 @@ static void aspeed_2700_intc0_write(void *opaque, hwaddr offset, uint64_t data,
     case R_INTC0_GICINT134_EN:
     case R_INTC0_GICINT135_EN:
     case R_INTC0_GICINT136_EN:
-        irq = (offset & 0x0f00) >> 8;
-
-        if (irq >= aic->num_ints) {
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid interrupt number: %d\n",
-                          __func__, irq);
-            return;
-        }
-
-        /*
-         * These registers are used for enable sources interrupt and
-         * mask and unmask source interrupt while executing source ISR.
-         */
-
-        /* disable all source interrupt */
-        if (!data && !s->enable[irq]) {
-            s->regs[addr] = data;
-            return;
-        }
-
-        old_enable = s->enable[irq];
-        s->enable[irq] |= data;
-
-        /* enable new source interrupt */
-        if (old_enable != s->enable[irq]) {
-            trace_aspeed_intc_enable(s->enable[irq]);
-            s->regs[addr] = data;
-            return;
-        }
-
-        /* mask and unmask source interrupt */
-        change = s->regs[addr] ^ data;
-        if (change & data) {
-            s->mask[irq] &= ~change;
-            trace_aspeed_intc_unmask(change, s->mask[irq]);
-        } else {
-            s->mask[irq] |= change;
-            trace_aspeed_intc_mask(change, s->mask[irq]);
-        }
-        s->regs[addr] = data;
+        aspeed_2700_intc_enable_handler(s, addr, data);
         break;
     case R_INTC0_GICINT128_STATUS:
     case R_INTC0_GICINT129_STATUS:
@@ -213,46 +277,7 @@ static void aspeed_2700_intc0_write(void *opaque, hwaddr offset, uint64_t data,
     case R_INTC0_GICINT134_STATUS:
     case R_INTC0_GICINT135_STATUS:
     case R_INTC0_GICINT136_STATUS:
-        irq = (offset & 0x0f00) >> 8;
-
-        if (irq >= aic->num_ints) {
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid interrupt number: %d\n",
-                          __func__, irq);
-            return;
-        }
-
-        /* clear status */
-        s->regs[addr] &= ~data;
-
-        /*
-         * These status registers are used for notify sources ISR are executed.
-         * If one source ISR is executed, it will clear one bit.
-         * If it clear all bits, it means to initialize this register status
-         * rather than sources ISR are executed.
-         */
-        if (data == 0xffffffff) {
-            return;
-        }
-
-        /* All source ISR execution are done */
-        if (!s->regs[addr]) {
-            trace_aspeed_intc_all_isr_done(irq);
-            if (s->pending[irq]) {
-                /*
-                 * handle pending source interrupt
-                 * notify firmware which source interrupt are pending
-                 * by setting status register
-                 */
-                s->regs[addr] = s->pending[irq];
-                s->pending[irq] = 0;
-                trace_aspeed_intc_trigger_irq(irq, s->regs[addr]);
-                aspeed_intc_update(s, irq, 1);
-            } else {
-                /* clear irq */
-                trace_aspeed_intc_clear_irq(irq, 0);
-                aspeed_intc_update(s, irq, 0);
-            }
-        }
+        aspeed_2700_intc_status_handler(s, addr, data);
         break;
     default:
         s->regs[addr] = data;
-- 
2.34.1

