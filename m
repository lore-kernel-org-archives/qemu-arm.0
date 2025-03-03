Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2503609njb;
        Mon, 3 Mar 2025 01:55:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUC1XLoOn3fNGWHydHFt273vrsT+7EO6UTQisCQ8CNHr/ixYjor76sNrGUuYGnS53xRaTGOZHJRu72DHw==@linaro.org
X-Google-Smtp-Source: AGHT+IEWgAwt4MO3Av3n4A6shnqp8CBc82bLrbMWVhH2Y0S9PoXCYZhCd9ZIxbOmHCl2JdiKREyS
X-Received: by 2002:a05:6214:2462:b0:6e6:69d8:6c16 with SMTP id 6a1803df08f44-6e8a0d6d8f5mr204380066d6.35.1740995752167;
        Mon, 03 Mar 2025 01:55:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740995752; cv=none;
        d=google.com; s=arc-20240605;
        b=Eea/5wJU1mAbqigPFGLgFFJnyQ6F3Tr7uKw+zUEkWZrxJvSn8pQT+jyXeVXhtxzB9d
         66O/3AbYWhuzIvUzCfBloyduNG2aDk1b6TAox554xgM18SX4Y3UfTH/m/LaaLUReRlbn
         V9Hc8nU+CpPnmTS2RqMvcPTxrapT+1QUBWdaG0sPnI2+HnJQstENi1V7ecJHteOsdSev
         OMfAgqRJ9mrV4ypcYLeHlLaZ66Lwqw2h8yK+ouZcRF/Q6TC6SBDEllhtZ+ltole6IYbO
         4rHxYIDiEizfzyBzLIROm/nHjYaKYcPAeJjVTWgjp4Cw/tr7tufw7TlKRheSZAvjauGV
         ywcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=vt8/+FHVubOIbr5M8Ot3A1mCMg3t1WyYeWHQLbv4Dzk=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=DqG10pifPJ1zAyVajrx5gbScDpHQlopjVe1VmAgdCGHJaikaQJG3RYgWV1rEiLDobU
         FNT6pz0cqv00Nxz1z9OttxAOsOpxhyRxvTl5IKx+3CB6WQ8VdKirBekUQF4FlrY+wv7t
         gUFno6YzWt/k0U4fkysEL2v5uMdi5bMrXit6Q2NxuCdaHH3xcOL8nhciz471HB45uUFR
         QqjfgQwFOKl0jTPF3B9XuMBYqNj+tfgAhM9GWixRsoLytHxZphLAzJKhNmoYH7ziV7nF
         rCPTnkhPWA/maP8MGSiNdzhXb0UK3r504UHsi/nccspAy08CpJAEP0TSwvL9A0bq2lj5
         /Scw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976e3779si84205946d6.402.2025.03.03.01.55.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 01:55:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp2W5-0007s8-HC; Mon, 03 Mar 2025 04:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2W4-0007rV-28; Mon, 03 Mar 2025 04:55:16 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2W1-0001s3-5T; Mon, 03 Mar 2025 04:55:14 -0500
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
Subject: [PATCH v4 04/23] hw/intc/aspeed: Introduce helper functions for
 enable and status registers
Date: Mon, 3 Mar 2025 17:54:32 +0800
Message-ID: <20250303095457.2337631-5-jamin_lin@aspeedtech.com>
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
X-TUID: bMta0a2Ef+1c

The behavior of the enable and status registers is almost identical between
INTC(CPU Die) and INTCIO(IO Die). To reduce duplicated code, adds
"aspeed_intc_enable_handler" functions to handle enable register write
behavior and "aspeed_intc_status_handler" functions to handle status
register write behavior. No functional change.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/intc/aspeed_intc.c | 190 ++++++++++++++++++++++++------------------
 1 file changed, 108 insertions(+), 82 deletions(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 0f630ffab7..906331fa32 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -120,6 +120,112 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
     }
 }
 
+static void aspeed_intc_enable_handler(AspeedINTCState *s, hwaddr offset,
+                                       uint64_t data)
+{
+    AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
+    uint32_t addr = offset >> 2;
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
+
+    s->regs[addr] = data;
+}
+
+static void aspeed_intc_status_handler(AspeedINTCState *s, hwaddr offset,
+                                       uint64_t data)
+{
+    AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
+    uint32_t addr = offset >> 2;
+    uint32_t irq;
+
+    if (!data) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid data 0\n", __func__);
+        return;
+    }
+
+    irq = (offset & 0x0f00) >> 8;
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
+     * These status registers are used for notify sources ISR are executed.
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
 static uint64_t aspeed_intc_read(void *opaque, hwaddr offset, unsigned int size)
 {
     AspeedINTCState *s = ASPEED_INTC(opaque);
@@ -146,9 +252,6 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
     AspeedINTCState *s = ASPEED_INTC(opaque);
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     uint32_t addr = offset >> 2;
-    uint32_t old_enable;
-    uint32_t change;
-    uint32_t irq;
 
     if (offset >= aic->reg_size) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -169,45 +272,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
     case R_GICINT134_EN:
     case R_GICINT135_EN:
     case R_GICINT136_EN:
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
+        aspeed_intc_enable_handler(s, offset, data);
         break;
     case R_GICINT128_STATUS:
     case R_GICINT129_STATUS:
@@ -218,46 +283,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
     case R_GICINT134_STATUS:
     case R_GICINT135_STATUS:
     case R_GICINT136_STATUS:
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
+        aspeed_intc_status_handler(s, offset, data);
         break;
     default:
         s->regs[addr] = data;
-- 
2.34.1

