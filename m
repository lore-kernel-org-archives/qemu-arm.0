Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp606613njc;
        Sun, 9 Mar 2025 06:53:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjQEmjt2aSb/CwQCTRhO0y1VxzJ/FYii1vMhg8Z6qdzuLmQ664CU5PQ1NGldPYcGv65qEUMeUO7GMoRA==@linaro.org
X-Google-Smtp-Source: AGHT+IE1Cra2OzR40H2bhbb7ex8bZ6qbeNhc/yu/OIM8iLzBJ//2LGg701/SfH4gJQq22FsaJXZ2
X-Received: by 2002:a05:6214:5096:b0:6e6:5d61:4efd with SMTP id 6a1803df08f44-6e9005b6abcmr128361276d6.9.1741528410410;
        Sun, 09 Mar 2025 06:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528410; cv=none;
        d=google.com; s=arc-20240605;
        b=adqgY6rHqTUsf8TFsudtB6kibO8bcMFgSdz026SqaXNy8cyajGTcohfeaEcVpnWnLh
         T9ioWHoAJo2qWGoxOEpgACqZ1kjxL9UScjESQLagr9vAgGvLWhDYLpiMlNqUe5w6o9Qd
         QYqvJ9rHuL6TC4jcGdXzk377RPdwtdqDzbkxrmHhxB04mtiotOHANXwkcQmyQWryN959
         xlXQupCCWnjRA1x3qgplN9VLTkPq+R+BoetmAv6eC0CdFRInT6Kan/xkBydi+sEErdxh
         5ecnXRbBjLLsH9YYHE4kAUTiQo5fJyIFIg55Q++7weI0k9HgxwSQmgSGTpnCEvDYVELa
         qSPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W3qddrphikrctdRzthvUWfNEMlLVU9dLAl+gbee0EHU=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=ZMbm6fKJ3hXZvVbjJeaeOOfD+wpba+OU1Af56vX+laLxfmbPVieP3dANDfpwZlbaFe
         JkYst44aSKMNR0Skct1Mp/VXARJ+d3v8EBGqyEui3RQFGjqY2MSy6ydfXMhJKY3w+w0f
         mrRH9dgwH9yin6cqxnjh2rO8JZ/4hFtFiGlNsOZbk8mAW1dDFLITVNEt8Ue7AYIxxEfJ
         wbsG5dqswyuMcKqfQccPRgAn++6gpmThE05aUaNsFJsPJtkK9yZmM4YCyhaHexd7pmAq
         eAaeqpR5xVI6WRfO48t87ok5BxIVQyT6FRoQ5P35VPLHRkkSDPJTaRAQqANNmSel/jSd
         6wZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MYxP1s4J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e9083c180esi35967626d6.401.2025.03.09.06.53.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:53:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MYxP1s4J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1trH59-0000Bu-S9; Sun, 09 Mar 2025 09:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH57-00005X-Lo
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH52-0002uo-S4
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W3qddrphikrctdRzthvUWfNEMlLVU9dLAl+gbee0EHU=;
 b=MYxP1s4Jfm5xsYqu27VhzJmsmMooIvXtVCoge4VwbDrkIWYrXbKMIEIbhMDMw9hxXYloHE
 6BQz9i24YYe58PUJ6hOcKBhPqqfBvvuVhlmQJo5MZ7pEHcM25K25qHT2guIaqa8fGfYM/C
 4uW62M+UaSoFdQ1cBgzLcpd1Q+LCzGQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-HO02V1EuNWqt36lApMhoRQ-1; Sun,
 09 Mar 2025 09:52:33 -0400
X-MC-Unique: HO02V1EuNWqt36lApMhoRQ-1
X-Mimecast-MFC-AGG-ID: HO02V1EuNWqt36lApMhoRQ_1741528352
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 428BA1956080; Sun,  9 Mar 2025 13:52:32 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A6A251956094; Sun,  9 Mar 2025 13:52:30 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 23/46] hw/intc/aspeed: Introduce helper functions for enable
 and status registers
Date: Sun,  9 Mar 2025 14:51:07 +0100
Message-ID: <20250309135130.545764-24-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BiF6xPySV0KV

From: Jamin Lin <jamin_lin@aspeedtech.com>

The behavior of the enable and status registers is almost identical between
INTC(CPU Die) and INTCIO(IO Die). To reduce duplicated code, adds
"aspeed_intc_enable_handler" functions to handle enable register write
behavior and "aspeed_intc_status_handler" functions to handle status
register write behavior. No functional change.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250307035945.3698802-7-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/intc/aspeed_intc.c | 191 ++++++++++++++++++++++++------------------
 1 file changed, 108 insertions(+), 83 deletions(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index d684b4bb4fec..b58a7ee7126e 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -120,6 +120,112 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
     }
 }
 
+static void aspeed_intc_enable_handler(AspeedINTCState *s, hwaddr offset,
+                                       uint64_t data)
+{
+    AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
+    uint32_t reg = offset >> 2;
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
+        s->regs[reg] = data;
+        return;
+    }
+
+    old_enable = s->enable[irq];
+    s->enable[irq] |= data;
+
+    /* enable new source interrupt */
+    if (old_enable != s->enable[irq]) {
+        trace_aspeed_intc_enable(s->enable[irq]);
+        s->regs[reg] = data;
+        return;
+    }
+
+    /* mask and unmask source interrupt */
+    change = s->regs[reg] ^ data;
+    if (change & data) {
+        s->mask[irq] &= ~change;
+        trace_aspeed_intc_unmask(change, s->mask[irq]);
+    } else {
+        s->mask[irq] |= change;
+        trace_aspeed_intc_mask(change, s->mask[irq]);
+    }
+
+    s->regs[reg] = data;
+}
+
+static void aspeed_intc_status_handler(AspeedINTCState *s, hwaddr offset,
+                                       uint64_t data)
+{
+    AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
+    uint32_t reg = offset >> 2;
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
+    s->regs[reg] &= ~data;
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
+    if (!s->regs[reg]) {
+        trace_aspeed_intc_all_isr_done(irq);
+        if (s->pending[irq]) {
+            /*
+             * handle pending source interrupt
+             * notify firmware which source interrupt are pending
+             * by setting status register
+             */
+            s->regs[reg] = s->pending[irq];
+            s->pending[irq] = 0;
+            trace_aspeed_intc_trigger_irq(irq, s->regs[reg]);
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
@@ -136,11 +242,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
                                         unsigned size)
 {
     AspeedINTCState *s = ASPEED_INTC(opaque);
-    AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     uint32_t reg = offset >> 2;
-    uint32_t old_enable;
-    uint32_t change;
-    uint32_t irq;
 
     trace_aspeed_intc_write(offset, size, data);
 
@@ -154,45 +256,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
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
-            s->regs[reg] = data;
-            return;
-        }
-
-        old_enable = s->enable[irq];
-        s->enable[irq] |= data;
-
-        /* enable new source interrupt */
-        if (old_enable != s->enable[irq]) {
-            trace_aspeed_intc_enable(s->enable[irq]);
-            s->regs[reg] = data;
-            return;
-        }
-
-        /* mask and unmask source interrupt */
-        change = s->regs[reg] ^ data;
-        if (change & data) {
-            s->mask[irq] &= ~change;
-            trace_aspeed_intc_unmask(change, s->mask[irq]);
-        } else {
-            s->mask[irq] |= change;
-            trace_aspeed_intc_mask(change, s->mask[irq]);
-        }
-        s->regs[reg] = data;
+        aspeed_intc_enable_handler(s, offset, data);
         break;
     case R_GICINT128_STATUS:
     case R_GICINT129_STATUS:
@@ -203,46 +267,7 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
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
-        s->regs[reg] &= ~data;
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
-        if (!s->regs[reg]) {
-            trace_aspeed_intc_all_isr_done(irq);
-            if (s->pending[irq]) {
-                /*
-                 * handle pending source interrupt
-                 * notify firmware which source interrupt are pending
-                 * by setting status register
-                 */
-                s->regs[reg] = s->pending[irq];
-                s->pending[irq] = 0;
-                trace_aspeed_intc_trigger_irq(irq, s->regs[reg]);
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
         s->regs[reg] = data;
-- 
2.48.1

