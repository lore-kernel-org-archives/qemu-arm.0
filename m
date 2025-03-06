Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1389225njm;
        Thu, 6 Mar 2025 02:46:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUQrXFr/XchIR6uIOhovFOKnMS37gLZXP+4ScSyh9BArBMUaaiUSpF5e/UkMWuKb9piN7IhXO/GAbM2nA==@linaro.org
X-Google-Smtp-Source: AGHT+IFKoRG5W7YvMyHfuWEaw08xBxsdcHLvgP8oIbLsoBLWnMFvK/15+1IE4QVUAa4FSKXO8Z7n
X-Received: by 2002:a05:620a:6086:b0:7c3:d969:8c8d with SMTP id af79cd13be357-7c3e3921e58mr497668885a.0.1741258007785;
        Thu, 06 Mar 2025 02:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741258007; cv=none;
        d=google.com; s=arc-20240605;
        b=aXyXUsL7lcWwrO4mONwzgKYI0ERkhbGxJ4Sruh2XaAcjDclyyiXr3sWaSrFT8NUlHt
         1Z8bM3JXYeTfZFdt7nwCD/R48KuoZToU38CM2KgV1ZRxNmsmduBDXAPhUn4L0gOm0E+S
         i3cMsmVFh4DcD79gKIIrAAiO5k29QA1zbPwePWx1UCdM/NUXxny7m95GVM2S88unSd5c
         hjRIxCwE0TFuOevgkrq5ljNkJy5BqCNZN1LAj6wMJA2cveYmglCAvmpocSB9Aa9mUpOV
         yVAupK0CwAMgNQbRjHIgdLDCbhE7+ivrqArTLuXKr+nAAkLDOcLhkzbsSXjUwrJh65xP
         YD5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Ye5EszsCXJKa2y24XRPcciF2g4RvDVRcI5gxLPx6WiY=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=HsiWX37t+DootH5oVw7Vx3fejT/CgO1eUVhDmGPX6Q/PK09r6KSmKAD8PBSZNBQJSV
         oVKZkFI8mGqen8nW8xq3SPC52pIBJjLHJX4umZvaBtvpNCeWltbq1oDE3LG2HdJ4sLIO
         NGTCEQDxlHtpqLy6ba5op/yXtXWR8Ydp46LHIVOUnaQHuyyekRiAm0+XNJvmXIs5oSFJ
         k0Kc8KKznHyHVrCbscwtcwo5WoMTgyBl4TGasZ5dMMZ+dOHpYNEWjTG0ZiVMKIN+jLu4
         +/OEwcDH38JoyNZ815BT/Xneo/NOfj1zmMuNvrSMNu7b21G1jf/UIt/EhDnTNqw/Tw1X
         pqIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f707d1a4si9318616d6.53.2025.03.06.02.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:46:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tq8eg-0007KO-DP; Thu, 06 Mar 2025 05:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8e3-0005ol-76; Thu, 06 Mar 2025 05:40:08 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8dy-0000XB-8F; Thu, 06 Mar 2025 05:40:02 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Mar
 2025 18:38:52 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Mar 2025 18:38:52 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v5 15/29] hw/intc/aspeed: Introduce IRQ handler function to
 reduce code duplication
Date: Thu, 6 Mar 2025 18:38:23 +0800
Message-ID: <20250306103846.429221-16-jamin_lin@aspeedtech.com>
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
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: A2O5xcdE3YEe

The behavior of the INTC set IRQ is almost identical between INTC and INTCIO.
To reduce duplicated code, introduce the "aspeed_intc_set_irq_handler" function
to handle both INTC and INTCIO IRQ behavior. No functional change.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/intc/aspeed_intc.c | 70 ++++++++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 31 deletions(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 0ac59745f6..d0b91d6420 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -76,11 +76,45 @@ static void aspeed_intc_update(AspeedINTCState *s, int inpin_idx,
     qemu_set_irq(s->output_pins[outpin_idx], level);
 }
 
+static void aspeed_intc_set_irq_handler(AspeedINTCState *s,
+                                        const AspeedINTCIRQ *intc_irq,
+                                        uint32_t select)
+{
+    const char *name = object_get_typename(OBJECT(s));
+    uint32_t status_reg;
+    int outpin_idx;
+    int inpin_idx;
+
+    status_reg = intc_irq->status_reg;
+    outpin_idx = intc_irq->outpin_idx;
+    inpin_idx = intc_irq->inpin_idx;
+
+    if (s->mask[inpin_idx] || s->regs[status_reg]) {
+        /*
+         * a. mask is not 0 means in ISR mode
+         * sources interrupt routine are executing.
+         * b. status register value is not 0 means previous
+         * source interrupt does not be executed, yet.
+         *
+         * save source interrupt to pending variable.
+         */
+        s->pending[inpin_idx] |= select;
+        trace_aspeed_intc_pending_irq(name, inpin_idx, s->pending[inpin_idx]);
+    } else {
+        /*
+         * notify firmware which source interrupt are coming
+         * by setting status register
+         */
+        s->regs[status_reg] = select;
+        trace_aspeed_intc_trigger_irq(name, inpin_idx, outpin_idx,
+                                      s->regs[status_reg]);
+        aspeed_intc_update(s, inpin_idx, outpin_idx, 1);
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
@@ -88,20 +122,15 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
     AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
     const char *name = object_get_typename(OBJECT(s));
     const AspeedINTCIRQ *intc_irq;
-    uint32_t status_reg;
     uint32_t select = 0;
     uint32_t enable;
-    int outpin_idx;
     int inpin_idx;
     int i;
 
     assert(irq < aic->num_inpins);
 
     intc_irq = &aic->irq_table[irq];
-    status_reg = intc_irq->status_reg;
-    outpin_idx = intc_irq->outpin_idx;
     inpin_idx = intc_irq->inpin_idx;
-
     trace_aspeed_intc_set_irq(name, inpin_idx, level);
     enable = s->enable[inpin_idx];
 
@@ -122,28 +151,7 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
     }
 
     trace_aspeed_intc_select(name, select);
-
-    if (s->mask[inpin_idx] || s->regs[status_reg]) {
-        /*
-         * a. mask is not 0 means in ISR mode
-         * sources interrupt routine are executing.
-         * b. status register value is not 0 means previous
-         * source interrupt does not be executed, yet.
-         *
-         * save source interrupt to pending variable.
-         */
-        s->pending[inpin_idx] |= select;
-        trace_aspeed_intc_pending_irq(name, inpin_idx, s->pending[inpin_idx]);
-    } else {
-        /*
-         * notify firmware which source interrupt are coming
-         * by setting status register
-         */
-        s->regs[status_reg] = select;
-        trace_aspeed_intc_trigger_irq(name, inpin_idx, outpin_idx,
-                                      s->regs[status_reg]);
-        aspeed_intc_update(s, inpin_idx, outpin_idx, 1);
-    }
+    aspeed_intc_set_irq_handler(s, intc_irq, select);
 }
 
 static void aspeed_intc_enable_handler(AspeedINTCState *s, hwaddr offset,
-- 
2.43.0

