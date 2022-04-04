Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp294564lfu;
        Mon, 4 Apr 2022 08:55:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdC7q64IcixiTGN15cGVm43H0gH2flHV8F5A+hEjUT3dRJcfXLDx7EYvX4jyLUPPx7IBWA
X-Received: by 2002:a25:2517:0:b0:634:63cb:68fe with SMTP id l23-20020a252517000000b0063463cb68femr394180ybl.271.1649087758638;
        Mon, 04 Apr 2022 08:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649087758; cv=none;
        d=google.com; s=arc-20160816;
        b=aa3IR/dCWMVevBMKlxURhrEsAgnhffg1CGGyR2JyQecMykcV39BxrEm51RjcVyHY4e
         NVDD0vjwpLfeyPYR7MWCpRAehDRONfqB7AcouGi1o1i1meS/PQWTgb2E5Tzv45d39fnt
         n7WzZdgkLjeLUEgmBaBn1WKYHUW74fdlMl91qxwHRLBjrslyHCEXJGit1nmcUD0XEMUo
         T0YlVuSBrNXbNdMsKlKDpfkXI1e2pOeFRN6wSGxb/wX60eRoxFxG/YdCE8VccoxOGw+H
         QBRpPnIm1Vnrz4vY7Z6l7EB8kSixFS1xfNVcBxcMdvYO5zI0OJMh1ehCUXGMS64N18sc
         YGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cvW6KLwNy/I8unDDel937UbRRUD/Y4bI2f5TEKtV4Wk=;
        b=QuPggciIC1Rse3W6DV0BthffskxO3F6YqqUWhgcEDLuHqICdPrmlgUjNXaFwH8lYNs
         TIZOfCGb6HK7uSc9taxlPTTjriOF0PSBzFivMMVZbrfajPgCvrlsTiG0UE6YZ43Fb1wG
         K3gVu+pLn+yt/6Sz8OlO5KwIduyY4GV/hdczJK5iHmU9NIiyqHM7WbDZLN1qDlpR/UyU
         HBf3EEyyS203Tp8tW5yuufB5hFAn2pzqjm48UMM5gQPfWPxkuGP5pcJOetRowVG5MbcS
         n5WnZZCA4MhQAxnPdnb3LEV1y9VeCSGakykM6iQFKNGYKkjhaZWR9jlkhvVHV3IQd3yi
         lK4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Tn8id/b/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v130-20020a812f88000000b002e5cf65c02asi7813714ywv.253.2022.04.04.08.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 08:55:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Tn8id/b/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbP3d-0002g0-Vt
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 11:55:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvD-0004xS-VL
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 11:47:16 -0400
Received: from [2a00:1450:4864:20::42a] (port=37771
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv9-0000Uy-P1
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 11:47:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z1so2833337wrg.4
 for <qemu-arm@nongnu.org>; Mon, 04 Apr 2022 08:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cvW6KLwNy/I8unDDel937UbRRUD/Y4bI2f5TEKtV4Wk=;
 b=Tn8id/b/pY5ogxZXpNKg4j3P9IxRNwJBEBPSK598X9DFekqeWou/ErbBLQC3yed8es
 4o0DlaVRYJaoW4Ak7DM+J8yKwjsVNIufYiUtQ24DtNvloeUf/f/nlMHnMpqgSd+KhfyK
 ncSHJXaQ2Mk8WvLl4Pj29CkC4YFEgkgqfo0zh9D3OgLdYjlZklbSTIuOFMcgeqATG/VQ
 hTkOns0nwYRXh0SaY3RU++9HQvDmwij/KvfzCJzb17cWpSbrtuLkVN3ZbiqnnetYeCHk
 ZEDZDSEpYuSfwKSaTrvNOtClmBkfiVzFsxGuNqWGBFMJLce9QzYCo+E/XeNiB+0U6M1H
 fcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cvW6KLwNy/I8unDDel937UbRRUD/Y4bI2f5TEKtV4Wk=;
 b=CROphD+G9vbZmXvjvPxPS3olmCCcx66WZk5Ph8196gXnzVfjsE9gMOE6Kbfos/vwY7
 qbmkGr04UTUktU1NS866dtU6i4GK0WVzcoO3DPcfrP3wrxyX9b9MGs4dPQ60VPk8wzag
 ujuSIin+G91lTYgh4C4TyF3hLrJLHmKXKcfX+1gglpapMBl9gQGBNFcxXc3EOm3Cgeo2
 a9SaQ+8QyQ7FcuHNfZ75kl4xw1Ab0yYlPlgAl6oUwy3yA4OKkblHGrdIPPUgWcM8y1fe
 uHq1fWZwvEg4PaWTfctzsdahMqzeiu8VAeLk3PQLqhzDWhZEyrujd+V/nqNWPPOWUZ4U
 O2wA==
X-Gm-Message-State: AOAM532QV9XPziAmD2wTkANsmoVWB/qnqg0hEumme1q2V4Q9pwYuUbWJ
 wuZVPn2HCu3hhcCJioOJCEWjdlY2iremHA==
X-Received: by 2002:adf:e181:0:b0:203:f0cc:da0c with SMTP id
 az1-20020adfe181000000b00203f0ccda0cmr288328wrb.668.1649087230393; 
 Mon, 04 Apr 2022 08:47:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 10/18] hw/arm/exynos4210: Move
 exynos4210_combiner_get_gpioin() into exynos4210.c
Date: Mon,  4 Apr 2022 16:46:50 +0100
Message-Id: <20220404154658.565020-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xj2uzNqCLuOW

The function exynos4210_combiner_get_gpioin() currently lives in
exynos4210_combiner.c, but it isn't really part of the combiner
device itself -- it is a function that implements the wiring up of
some interrupt sources to multiple combiner inputs.  Move it to live
with the other SoC-level code in exynos4210.c, along with a few
macros previously defined in exynos4210.h which are now used only
in exynos4210.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h   | 11 -----
 hw/arm/exynos4210.c           | 82 +++++++++++++++++++++++++++++++++++
 hw/intc/exynos4210_combiner.c | 77 --------------------------------
 3 files changed, 82 insertions(+), 88 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 08f52c511ff..b564e3582bb 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -67,11 +67,6 @@
 #define EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ   \
     (EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ * 8)
 
-#define EXYNOS4210_COMBINER_GET_IRQ_NUM(grp, bit)  ((grp)*8 + (bit))
-#define EXYNOS4210_COMBINER_GET_GRP_NUM(irq)       ((irq) / 8)
-#define EXYNOS4210_COMBINER_GET_BIT_NUM(irq) \
-    ((irq) - 8 * EXYNOS4210_COMBINER_GET_GRP_NUM(irq))
-
 /* IRQs number for external and internal GIC */
 #define EXYNOS4210_EXT_GIC_NIRQ     (160-32)
 #define EXYNOS4210_INT_GIC_NIRQ     64
@@ -118,12 +113,6 @@ void exynos4210_write_secondary(ARMCPU *cpu,
  *  bit - bit number inside group */
 uint32_t exynos4210_get_irq(uint32_t grp, uint32_t bit);
 
-/*
- * Get Combiner input GPIO into irqs structure
- */
-void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *dev,
-        int ext);
-
 /*
  * exynos4210 UART
  */
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 5a41af089f9..86a9a0dae12 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -249,6 +249,11 @@ combiner_grp_to_gic_id[64 - EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
     { }, { }, { }, { }, { }, { }, { }, { }, { }, { }
 };
 
+#define EXYNOS4210_COMBINER_GET_IRQ_NUM(grp, bit)  ((grp) * 8 + (bit))
+#define EXYNOS4210_COMBINER_GET_GRP_NUM(irq)       ((irq) / 8)
+#define EXYNOS4210_COMBINER_GET_BIT_NUM(irq) \
+    ((irq) - 8 * EXYNOS4210_COMBINER_GET_GRP_NUM(irq))
+
 /*
  * Initialize board IRQs.
  * These IRQs contain splitted Int/External Combiner and External Gic IRQs.
@@ -306,6 +311,83 @@ uint32_t exynos4210_get_irq(uint32_t grp, uint32_t bit)
     return EXYNOS4210_COMBINER_GET_IRQ_NUM(grp, bit);
 }
 
+/*
+ * Get Combiner input GPIO into irqs structure
+ */
+static void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs,
+                                           DeviceState *dev, int ext)
+{
+    int n;
+    int bit;
+    int max;
+    qemu_irq *irq;
+
+    max = ext ? EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ :
+        EXYNOS4210_MAX_INT_COMBINER_IN_IRQ;
+    irq = ext ? irqs->ext_combiner_irq : irqs->int_combiner_irq;
+
+    /*
+     * Some IRQs of Int/External Combiner are going to two Combiners groups,
+     * so let split them.
+     */
+    for (n = 0; n < max; n++) {
+
+        bit = EXYNOS4210_COMBINER_GET_BIT_NUM(n);
+
+        switch (n) {
+        /* MDNIE_LCD1 INTG1 */
+        case EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 0) ...
+             EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 3):
+            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(0, bit + 4)]);
+            continue;
+
+        /* TMU INTG3 */
+        case EXYNOS4210_COMBINER_GET_IRQ_NUM(3, 4):
+            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(2, bit)]);
+            continue;
+
+        /* LCD1 INTG12 */
+        case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 0) ...
+             EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 3):
+            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(11, bit + 4)]);
+            continue;
+
+        /* Multi-Core Timer INTG12 */
+        case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4) ...
+             EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 8):
+               irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+                       irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            continue;
+
+        /* Multi-Core Timer INTG35 */
+        case EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 4) ...
+             EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 8):
+            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            continue;
+
+        /* Multi-Core Timer INTG51 */
+        case EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 4) ...
+             EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 8):
+            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            continue;
+
+        /* Multi-Core Timer INTG53 */
+        case EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 4) ...
+             EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 8):
+            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            continue;
+        }
+
+        irq[n] = qdev_get_gpio_in(dev, n);
+    }
+}
+
 static uint8_t chipid_and_omr[] = { 0x11, 0x02, 0x21, 0x43,
                                     0x09, 0x00, 0x00, 0x00 };
 
diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index 4534ee248db..83b42b9bce1 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -105,83 +105,6 @@ static const VMStateDescription vmstate_exynos4210_combiner = {
     }
 };
 
-/*
- * Get Combiner input GPIO into irqs structure
- */
-void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *dev,
-        int ext)
-{
-    int n;
-    int bit;
-    int max;
-    qemu_irq *irq;
-
-    max = ext ? EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ :
-        EXYNOS4210_MAX_INT_COMBINER_IN_IRQ;
-    irq = ext ? irqs->ext_combiner_irq : irqs->int_combiner_irq;
-
-    /*
-     * Some IRQs of Int/External Combiner are going to two Combiners groups,
-     * so let split them.
-     */
-    for (n = 0; n < max; n++) {
-
-        bit = EXYNOS4210_COMBINER_GET_BIT_NUM(n);
-
-        switch (n) {
-        /* MDNIE_LCD1 INTG1 */
-        case EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 0) ...
-             EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 3):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(0, bit + 4)]);
-            continue;
-
-        /* TMU INTG3 */
-        case EXYNOS4210_COMBINER_GET_IRQ_NUM(3, 4):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(2, bit)]);
-            continue;
-
-        /* LCD1 INTG12 */
-        case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 0) ...
-             EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 3):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(11, bit + 4)]);
-            continue;
-
-        /* Multi-Core Timer INTG12 */
-        case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4) ...
-             EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 8):
-               irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                       irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
-            continue;
-
-        /* Multi-Core Timer INTG35 */
-        case EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 4) ...
-             EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
-            continue;
-
-        /* Multi-Core Timer INTG51 */
-        case EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 4) ...
-             EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
-            continue;
-
-        /* Multi-Core Timer INTG53 */
-        case EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 4) ...
-             EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
-            continue;
-        }
-
-        irq[n] = qdev_get_gpio_in(dev, n);
-    }
-}
-
 static uint64_t
 exynos4210_combiner_read(void *opaque, hwaddr offset, unsigned size)
 {
-- 
2.25.1

