Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp294801lfu;
        Mon, 4 Apr 2022 08:56:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/3EMa/z9XAiLuWaf2KpLen2jX/znPvm6bx8Qa5NBkJmzkGVknD/IpHpTB3ztRuOegiHeO
X-Received: by 2002:a25:e30c:0:b0:633:6081:d44b with SMTP id z12-20020a25e30c000000b006336081d44bmr390084ybd.523.1649087783022;
        Mon, 04 Apr 2022 08:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649087783; cv=none;
        d=google.com; s=arc-20160816;
        b=ZJyTEHOjVJPRCb7sS1i1A/wusGfwP7qjZhzSrgG0WXW6MR4fnFQd3myAq6BrZ/3kxA
         14HnZy5uzuoA4Yt2Urf2rGZuxTAn0fuhuSADtZ2ZeVdAGvlDHdqaiCVtSSdd3kHcFaEC
         drVW+18BMY5MV7rvED5lwXHrqmUpwwToqTjY7mCEvgiVP69xi3qt+BCXUf1e3z6whCaM
         ToTnbhimtPyZB2w3j+fxMPClHSW4GK04mjYrxZzx2eWdDtRz2bguzs2TcAmFzK+ZROiJ
         fIhOiMOU2TtHunnp7hbuhJ+Ib09lF653mqP5Bmu67stySEFuxZrCzRsKYXjNtXHVhyvf
         gpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hl9SRvEcx0c1matA6SMuB+Ty+5GSNQsaAxg6ODZ42CQ=;
        b=oE7iw0DB9CiQoGjZnGTFnread/izSqJqtwKCZh9BxhfFWQ+/yizzd4+cR96q2Qlnrh
         K2AmKXWbrvZ/a/mntj7KYBXwxmGVVdGe8tm8n73cz5Nq7JiQc3wUfyY82bLZZUxbR3g8
         RYsYHgUDGWG72MjCY1j8UF493nU54SQ919fXt7Q6K1Fc36SPGErz2ELyHA4q2ENQgouu
         LhGKx8IbWkWHopqHk5l86vl36w3VVLpkqTCXRRCMRgdZy4ZS01OFWjBkHbGWZAnxgFJE
         dkQpAy0bq6VISSw/3WEWrwkZ1yr3N5jkhzumrn8vBHM0A5ZX0IxCb9iWSh1PIfRDhABz
         Fmdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QIiHDd9D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15-20020a25250f000000b0063399404648si8556632ybl.690.2022.04.04.08.56.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 08:56:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QIiHDd9D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbP42-0003Ua-D5
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 11:56:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvF-0004yL-SU
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 11:47:18 -0400
Received: from [2a00:1450:4864:20::433] (port=42515
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvB-0000Vi-FW
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 11:47:15 -0400
Received: by mail-wr1-x433.google.com with SMTP id r13so15111613wrr.9
 for <qemu-arm@nongnu.org>; Mon, 04 Apr 2022 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hl9SRvEcx0c1matA6SMuB+Ty+5GSNQsaAxg6ODZ42CQ=;
 b=QIiHDd9DYV2mxNKTQo0XYJoR/aMvbQ6z8wEaxZB3fKFQJWNxnNL2nWXcpBayUKTGym
 kYgjwD2h5m010BW/b6FDu6ZdB1Ee7f2C+BsSGJyp5CtMton+b/ac/O7DjNL40MkSSkZa
 ln7xkoCHvRSWDFCNmcKupQk+b1PqNWy3jA1fYJ+aUSxgpb1T0GnZbPXKD8DUmiCZKZwg
 poU0XVbFj5gloQqaYjmNX35aDyO4lCCHEWiH8vVZtwHv3hJZephyrydW9sv/b84NQP9f
 ScV9kmnaSLB2rWkppGZ/KqwiXOPnHrAJNYZiTIZpEbDqBRzHOobPVSa1SVe7FJfnbYG9
 iKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hl9SRvEcx0c1matA6SMuB+Ty+5GSNQsaAxg6ODZ42CQ=;
 b=vURsQB14wLGpNU9mBWhl7ree4UykxGPb5pup5/YKgxNQFZVg/1jFQoCpT6Xjk6qb9N
 zs79UyN7x8FJXWeOXkcbdG7AFVT6imN8WY5pegwIQ+ESolsQZYuBB55do3TPi/tdu+2s
 bfcJCMY0fSqyb/362kGZIIiCQRx01JWglvo3josrr3/zYTyN3yLHjaQVsj74lCbxnQ46
 QkvWdY9UoooKqOD7Wc0in6mxaj1YNF7tUjCIy9SR4+Zen6qR+XkNbeO98YTdjGuJ0+vT
 3mPruwPMdTQviSLxGHXFjlZMTTOHEd+1k45y6BStdXs5AaeWVLhdU8VWbSr5Eu6PWYes
 k3WA==
X-Gm-Message-State: AOAM533Sh4IZSJCn0EpniysqZedZCN0ZUBzn1yylWE5lxe0pzZclvaMt
 Jxjn6M7YESfX0w5j46Z4S+sbbZca8lSz4Q==
X-Received: by 2002:adf:d1eb:0:b0:205:a502:d2ff with SMTP id
 g11-20020adfd1eb000000b00205a502d2ffmr283713wrd.125.1649087232047; 
 Mon, 04 Apr 2022 08:47:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 12/18] hw/arm/exynos4210: Use TYPE_SPLIT_IRQ in
 exynos4210_init_board_irqs()
Date: Mon,  4 Apr 2022 16:46:52 +0100
Message-Id: <20220404154658.565020-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: TrncX7n226a3

In exynos4210_init_board_irqs(), use the TYPE_SPLIT_IRQ device
instead of qemu_irq_split().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h |  9 ++++++++
 hw/arm/exynos4210.c         | 41 +++++++++++++++++++++++++++++--------
 2 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index f0769a4045b..f58ee0f2686 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -28,6 +28,7 @@
 #include "hw/sysbus.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/intc/exynos4210_gic.h"
+#include "hw/core/split-irq.h"
 #include "target/arm/cpu-qom.h"
 #include "qom/object.h"
 
@@ -71,6 +72,13 @@
 
 #define EXYNOS4210_NUM_DMA      3
 
+/*
+ * We need one splitter for every external combiner input, plus
+ * one for every non-zero entry in combiner_grp_to_gic_id[].
+ * We'll assert in exynos4210_init_board_irqs() if this is wrong.
+ */
+#define EXYNOS4210_NUM_SPLITTERS (EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ + 60)
+
 typedef struct Exynos4210Irq {
     qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
     qemu_irq ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
@@ -95,6 +103,7 @@ struct Exynos4210State {
     qemu_or_irq cpu_irq_orgate[EXYNOS4210_NCPUS];
     A9MPPrivState a9mpcore;
     Exynos4210GicState ext_gic;
+    SplitIRQ splitter[EXYNOS4210_NUM_SPLITTERS];
 };
 
 #define TYPE_EXYNOS4210_SOC "exynos4210"
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 86a9a0dae12..919821833b5 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -263,6 +263,8 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
     uint32_t grp, bit, irq_id, n;
     Exynos4210Irq *is = &s->irqs;
     DeviceState *extgicdev = DEVICE(&s->ext_gic);
+    int splitcount = 0;
+    DeviceState *splitter;
 
     for (n = 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
         irq_id = 0;
@@ -276,13 +278,19 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
             /* MCT_G1 is passed to External and GIC */
             irq_id = EXT_GIC_ID_MCT_G1;
         }
+
+        assert(splitcount < EXYNOS4210_NUM_SPLITTERS);
+        splitter = DEVICE(&s->splitter[splitcount]);
+        qdev_prop_set_uint16(splitter, "num-lines", 2);
+        qdev_realize(splitter, NULL, &error_abort);
+        splitcount++;
+        s->irq_table[n] = qdev_get_gpio_in(splitter, 0);
+        qdev_connect_gpio_out(splitter, 0, is->int_combiner_irq[n]);
         if (irq_id) {
-            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
-                                             qdev_get_gpio_in(extgicdev,
-                                                              irq_id - 32));
+            qdev_connect_gpio_out(splitter, 1,
+                                  qdev_get_gpio_in(extgicdev, irq_id - 32));
         } else {
-            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
-                    is->ext_combiner_irq[n]);
+            qdev_connect_gpio_out(splitter, 1, is->ext_combiner_irq[n]);
         }
     }
     for (; n < EXYNOS4210_MAX_INT_COMBINER_IN_IRQ; n++) {
@@ -293,11 +301,23 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
                      EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][bit];
 
         if (irq_id) {
-            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
-                                             qdev_get_gpio_in(extgicdev,
-                                                              irq_id - 32));
+            assert(splitcount < EXYNOS4210_NUM_SPLITTERS);
+            splitter = DEVICE(&s->splitter[splitcount]);
+            qdev_prop_set_uint16(splitter, "num-lines", 2);
+            qdev_realize(splitter, NULL, &error_abort);
+            splitcount++;
+            s->irq_table[n] = qdev_get_gpio_in(splitter, 0);
+            qdev_connect_gpio_out(splitter, 0, is->int_combiner_irq[n]);
+            qdev_connect_gpio_out(splitter, 1,
+                                  qdev_get_gpio_in(extgicdev, irq_id - 32));
         }
     }
+    /*
+     * We check this here to avoid a more obscure assert later when
+     * qdev_assert_realized_properly() checks that we realized every
+     * child object we initialized.
+     */
+    assert(splitcount == EXYNOS4210_NUM_SPLITTERS);
 }
 
 /*
@@ -766,6 +786,11 @@ static void exynos4210_init(Object *obj)
         object_initialize_child(obj, name, &s->cpu_irq_orgate[i], TYPE_OR_IRQ);
     }
 
+    for (i = 0; i < ARRAY_SIZE(s->splitter); i++) {
+        g_autofree char *name = g_strdup_printf("irq-splitter%d", i);
+        object_initialize_child(obj, name, &s->splitter[i], TYPE_SPLIT_IRQ);
+    }
+
     object_initialize_child(obj, "a9mpcore", &s->a9mpcore, TYPE_A9MPCORE_PRIV);
     object_initialize_child(obj, "ext-gic", &s->ext_gic, TYPE_EXYNOS4210_GIC);
 }
-- 
2.25.1

