Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp344772njc;
        Wed, 12 Feb 2025 19:38:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW1+suYq8E4ltGsIHNbNBd+rdQHCtd2X8bLZzAdinSuSjP1aQ+BfYyKpfo6sNio9mlsl4Wu9IkKZlbPhA==@linaro.org
X-Google-Smtp-Source: AGHT+IFMZjYuyuGAIlMZeWC+3d51mf2WYJ5KWdYBSUPEysHj7MIogW07wCMiGsV+zvX3+dMEKsxn
X-Received: by 2002:a05:6214:29cb:b0:6cd:ec00:205e with SMTP id 6a1803df08f44-6e46ed187f8mr87907916d6.0.1739417903371;
        Wed, 12 Feb 2025 19:38:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739417903; cv=none;
        d=google.com; s=arc-20240605;
        b=iv1Q96qPF2mzOAICvNPazskP+8j0LvRkH3as3zOuAlw1QbkreHd5d/eW3nNfxZHMCF
         AgLBG6qcSHzDhkzUDIZN/TKmgVhHrh2CXckapJGBc6zgkrYZGiFX9KGinMHulBpTsx3u
         gvJTnzQmD6D5s43HOsvG2LANLQdho5HimufM6BttWKb4XnyKA65AWPkAa/VR0QW3LXs2
         ZoH2ggkfQDhmNc4HzZ2b4Hae447uzKBk7uio6hLqYW9xZ4wL7/MIDDou1Qa4u7O1WBW2
         /9CgrTySk1gnRXb7S42AVYu9hp8PvkoCF0w2dFPkEg6dPQALrSgc3HKerzOIB0o7a/tv
         aFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=zryV5yyhgJCKN8y9xYBfSjMMC3e+mj8ts2o+s6bcAGo=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=Bh0TV6O0Bh6ZqaE4QPY6QZ6/QL+zcKO4/jrqd5j8FDBkm9JK3vTQ6clsYGeQ1bSNox
         HfuINGhT7deOx9/2ZypEZzf4H98Gcy1fjeUiz8YWr6YO6AfLyr/zkV6sgGIrJQeDyoGe
         Eqg2nxumW3GixWdBZkJlGfvNWFUCnyz16+V/Hq0wjfL93IAiEifIg+ppfHPZdkvPCi4R
         JIv+bbkUvBZxCnTnoZHIlZBVkkrigslUl0dcE1Rs/PDmy/eDBKC000q3BxzU6OGOFpth
         R82d8ZjUdbVuDMoklQS019g4Z09Etl87RHKJieG6E22ZIeqtV9qMI4XtslcaDEyi2jAN
         f+Vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9cf7f7si5538976d6.464.2025.02.12.19.38.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 19:38:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiQ1l-0007c5-6p; Wed, 12 Feb 2025 22:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ1Y-0007Hq-51; Wed, 12 Feb 2025 22:36:24 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ1W-0000gz-Kn; Wed, 12 Feb 2025 22:36:23 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Feb
 2025 11:35:36 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Feb 2025 11:35:36 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 11/28] hw/intc/aspeed: Introduce IRQ handler function to
 reduce code duplication
Date: Thu, 13 Feb 2025 11:35:14 +0800
Message-ID: <20250213033531.3367697-12-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
References: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-TUID: 2S7GGcJ3xo/Y

The behavior of the INTC set IRQ is almost identical between INTC and INTCIO.
To reduce duplicated code, introduce the "aspeed_intc_set_irq_handler" function
to handle both INTC and INTCIO IRQ behavior.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/intc/aspeed_intc.c | 62 ++++++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 59c1069294..fd4f75805a 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -92,11 +92,40 @@ static void aspeed_intc_update(AspeedINTCState *s, int inpin_idx,
     qemu_set_irq(s->output_pins[outpin_idx], level);
 }
 
+static void aspeed_intc_set_irq_handler(AspeedINTCState *s,
+                                        const AspeedINTCIRQ *intc_irq,
+                                        uint32_t select)
+{
+    const char *name = object_get_typename(OBJECT(s));
+
+    if (s->mask[intc_irq->inpin_idx] || s->regs[intc_irq->status_addr]) {
+        /*
+         * a. mask is not 0 means in ISR mode
+         * sources interrupt routine are executing.
+         * b. status register value is not 0 means previous
+         * source interrupt does not be executed, yet.
+         *
+         * save source interrupt to pending variable.
+         */
+        s->pending[intc_irq->inpin_idx] |= select;
+        trace_aspeed_intc_pending_irq(name, intc_irq->inpin_idx,
+                                      s->pending[intc_irq->inpin_idx]);
+    } else {
+        /*
+         * notify firmware which source interrupt are coming
+         * by setting status register
+         */
+        s->regs[intc_irq->status_addr] = select;
+        trace_aspeed_intc_trigger_irq(name, intc_irq->inpin_idx,
+                                      intc_irq->outpin_idx,
+                                      s->regs[intc_irq->status_addr]);
+        aspeed_intc_update(s, intc_irq->inpin_idx, intc_irq->outpin_idx, 1);
+    }
+}
+
 /*
- * The address of GICINT128 to GICINT136 are from 0x1000 to 0x1804.
- * Utilize "address & 0x0f00" to get the irq and irq output pin index
- * The value of irq should be 0 to num_inpins.
- * The irq 0 indicates GICINT128, irq 1 indicates GICINT129 and so on.
+ * GICINT128 to GICINT136 map 1:1 to input and output IRQs 0 to 8.
+ * The value of input IRQ should be between 0 and the number of inputs.
  */
 static void aspeed_intc_set_irq(void *opaque, int irq, int level)
 {
@@ -135,30 +164,7 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
     }
 
     trace_aspeed_intc_select(name, select);
-
-    if (s->mask[intc_irq->inpin_idx] || s->regs[intc_irq->status_addr]) {
-        /*
-         * a. mask is not 0 means in ISR mode
-         * sources interrupt routine are executing.
-         * b. status register value is not 0 means previous
-         * source interrupt does not be executed, yet.
-         *
-         * save source interrupt to pending variable.
-         */
-        s->pending[intc_irq->inpin_idx] |= select;
-        trace_aspeed_intc_pending_irq(name, intc_irq->inpin_idx,
-                                      s->pending[intc_irq->inpin_idx]);
-    } else {
-        /*
-         * notify firmware which source interrupt are coming
-         * by setting status register
-         */
-        s->regs[intc_irq->status_addr] = select;
-        trace_aspeed_intc_trigger_irq(name, intc_irq->inpin_idx,
-                                      intc_irq->outpin_idx,
-                                      s->regs[intc_irq->status_addr]);
-        aspeed_intc_update(s, intc_irq->inpin_idx, intc_irq->outpin_idx, 1);
-    }
+    aspeed_intc_set_irq_handler(s, intc_irq, select);
 }
 
 static void aspeed_intc_enable_handler(AspeedINTCState *s, hwaddr offset,
-- 
2.34.1

