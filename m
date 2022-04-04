Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp297913lfu;
        Mon, 4 Apr 2022 09:01:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ6GKQJNm278DRd50cetA+GUEAg4Dtcr4uZyoZAlPYJQvze7y15KDBTk5TR9ufKxHD4K33
X-Received: by 2002:a37:5c5:0:b0:67e:b666:f4d4 with SMTP id 188-20020a3705c5000000b0067eb666f4d4mr336693qkf.259.1649088084494;
        Mon, 04 Apr 2022 09:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649088084; cv=none;
        d=google.com; s=arc-20160816;
        b=DwDIlBsrEI5cYlN7SkFxIgxzb2o/1DzgM6tnuJkpeMBzLp24bcj4gOVg26Zfe/pPm1
         MIKaTJWYx+SQdc8krGdZxWaKdI79EkFJkOp6N+V0lfBHp3RQHoFUq1x8fi9sCPgeMtrj
         RQpBPV383Vvfj+kZftGxC+qUxVdnnEdWJf8/shDom7QDLlG0wphqizMGxYYsBItPoQ36
         PHXMh3cZZVQ/GLnTwd0kOk2jshVzCDJKeLd1riTqxhwBgl7UK6LQbdoadIXqSwFkvb0G
         SVqjnDZ8Xy1hSGR5cYzK7fzp2DpGVZX4txQnTzNNNeYvLpKiKXpr/OOAA3TXhhEIY4h1
         cpUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=O2HGHkIJYLoqaf2dXfOJCIZ757UlParSEKSsAnc5xCA=;
        b=HeE9vvLJO/8FgvE5m8bGcRndFNcQEB4Rl3bwzOlySwb+k7BcOrTCinSVTApBSqwYbR
         D5o/JXKnqmppPaby4HE4kbScj1XrVGJ+64sTLXny/p+xKrfmu9ml/UXOD+TjvqWQWwdW
         UHm6Ee3gIE47pCeA0c7scTynuG8T39HetxIzooCB1CADb2KHaG8Oif+l5R8Nq6ltO82c
         q2laCkuiSgJyQ/fo6YwPYJxSwmirVgbgiErOVHnQ/NCAxmDUTAXh4TnqwPm0xvPwa+qd
         r1q/y7tw2o+BVNzvHKRqIfissXxMRANVQ7TPuY/aNo3BYAkPlYuamsqhSPyvckim+WB7
         TTug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hONgZ1e1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19-20020ac84993000000b002e1fbf3bea3si3311167qtq.148.2022.04.04.09.01.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 09:01:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hONgZ1e1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbP8t-0005LE-Q2
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 12:01:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvK-00053F-1J
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:23 -0400
Received: from [2a00:1450:4864:20::431] (port=41611
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvG-0000XX-8Y
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:21 -0400
Received: by mail-wr1-x431.google.com with SMTP id k23so2586774wrd.8
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O2HGHkIJYLoqaf2dXfOJCIZ757UlParSEKSsAnc5xCA=;
 b=hONgZ1e1SfYMYzuvOewj/KiNHZyM35d275MJUnlqVLDwSGdrfLtmfyzA/u6Gt7SuPd
 cRqx3me9fnvh31kc46yrYZSHJl3M25sg2PgZunajhw5qSPcG3lAiiIjw0xQWk5x68beb
 YVzoh5ZDwRP+xLyPKDoOXHtkm88yunLrSwnayCa+YIQEysWbGx7/84ELXiuXzVZbmlDe
 lAKgijzDh7Pzv1pI0UNGnNRtpB4LUHKmCjhxovDOOaV0hTe+XZY91rRmOQtpAONUKnxF
 etzIU3w5af5vSir9zFUZIpt9OHt9FAnoCpu063GZ7cHVIz4yvLT2hUQ+/wjf14NLS16m
 T01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O2HGHkIJYLoqaf2dXfOJCIZ757UlParSEKSsAnc5xCA=;
 b=awKzv026NIedho2U7qh7smdgRuL9RFZOcuFe6xxRv2WSTdP7aCCDTtJzjqYXtbNzMq
 8xjwer/POGJd45BykW5vmaAdJp5usl9XuhRB6NVb2RxETgEUVRQ0DUbyVoUd6pCX9dWj
 s2kK7ydnsJo4kZvjUB2dkRd5iPjvTXsdbEsniisP4nr0JOKrCKciJU6DPWotPwt+xZJq
 z6jMsM1qUk0nCvS8AKoJwV4Dy1dSPEvT6/YPfNxGl5UbhVDevXy4ba350RIww+9ExtCO
 Bh1Vv/aFJhHdZUeOwGiLawRlrU9k7+5OHXx652v35hA2UfazDJR0XqBYiWEzdKMIuilK
 F6AQ==
X-Gm-Message-State: AOAM532RASGzHZiI8wQW4OJ5LZuCbsQuPCfT4nSZOXj3HXfeML8t7BP9
 5A1HkTTFCV+8geAjxiFx1vFJzQ==
X-Received: by 2002:a5d:588b:0:b0:204:1c1a:965d with SMTP id
 n11-20020a5d588b000000b002041c1a965dmr249622wrf.669.1649087236363; 
 Mon, 04 Apr 2022 08:47:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 16/18] hw/arm/exynos4210: Fold combiner splits into
 exynos4210_init_board_irqs()
Date: Mon,  4 Apr 2022 16:46:56 +0100
Message-Id: <20220404154658.565020-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hx+rtZlQp/M0

At this point, the function exynos4210_init_board_irqs() splits input
IRQ lines to connect them to the input combiner, output combiner and
external GIC.  The function exynos4210_combiner_get_gpioin() splits
some of the combiner input lines further to connect them to multiple
different inputs on the combiner.

Because (unlike qemu_irq_split()) the TYPE_SPLIT_IRQ device has a
configurable number of outputs, we can do all this in one place, by
making exynos4210_init_board_irqs() add extra outputs to the splitter
device when it must be connected to more than one input on each
combiner.

We do this with a new data structure, the combinermap, which is an
array each of whose elements is a list of the interrupt IDs on the
combiner which must be tied together.  As we loop through each
interrupt ID, if we find that it is the first one in one of these
lists, we configure the splitter device with eonugh extra outputs and
wire them up to the other interrupt IDs in the list.

Conveniently, for all the cases where this is necessary, the
lowest-numbered interrupt ID in each group is in the range of the
external combiner, so we only need to code for this in the first of
the two loops in exynos4210_init_board_irqs().

The old code in exynos4210_combiner_get_gpioin() which is being
deleted here had several problems which don't exist in the new code
in its handling of the multi-core timer interrupts:
 (1) the case labels specified bits 4 ... 8, but bit '8' doesn't
     exist; these should have been 4 ... 7
 (2) it used the input irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]
     multiple times as the input of several different splitters,
     which isn't allowed
 (3) in an apparent cut-and-paste error, the cases for all the
     multi-core timer inputs used "bit + 4" even though the
     bit range for the case was (intended to be) 4 ... 7, which
     meant it was looking at non-existent bits 8 ... 11.
None of these exist in the new code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h |   6 +-
 hw/arm/exynos4210.c         | 178 +++++++++++++++++++++++-------------
 2 files changed, 119 insertions(+), 65 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 7da3eddea5f..f24617f681d 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -74,10 +74,12 @@
 
 /*
  * We need one splitter for every external combiner input, plus
- * one for every non-zero entry in combiner_grp_to_gic_id[].
+ * one for every non-zero entry in combiner_grp_to_gic_id[],
+ * minus one for every external combiner ID in second or later
+ * places in a combinermap[] line.
  * We'll assert in exynos4210_init_board_irqs() if this is wrong.
  */
-#define EXYNOS4210_NUM_SPLITTERS (EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ + 54)
+#define EXYNOS4210_NUM_SPLITTERS (EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ + 38)
 
 typedef struct Exynos4210Irq {
     qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 39e334e0773..05b28cf5905 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -254,6 +254,76 @@ combiner_grp_to_gic_id[64 - EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
 #define EXYNOS4210_COMBINER_GET_BIT_NUM(irq) \
     ((irq) - 8 * EXYNOS4210_COMBINER_GET_GRP_NUM(irq))
 
+/*
+ * Some interrupt lines go to multiple combiner inputs.
+ * This data structure defines those: each array element is
+ * a list of combiner inputs which are connected together;
+ * the one with the smallest interrupt ID value must be first.
+ * As with combiner_grp_to_gic_id[], we rely on (0, 0) not being
+ * wired to anything so we can use 0 as a terminator.
+ */
+#define IRQNO(G, B) EXYNOS4210_COMBINER_GET_IRQ_NUM(G, B)
+#define IRQNONE 0
+
+#define COMBINERMAP_SIZE 16
+
+static const int combinermap[COMBINERMAP_SIZE][6] = {
+    /* MDNIE_LCD1 */
+    { IRQNO(0, 4), IRQNO(1, 0), IRQNONE },
+    { IRQNO(0, 5), IRQNO(1, 1), IRQNONE },
+    { IRQNO(0, 6), IRQNO(1, 2), IRQNONE },
+    { IRQNO(0, 7), IRQNO(1, 3), IRQNONE },
+    /* TMU */
+    { IRQNO(2, 4), IRQNO(3, 4), IRQNONE },
+    { IRQNO(2, 5), IRQNO(3, 5), IRQNONE },
+    { IRQNO(2, 6), IRQNO(3, 6), IRQNONE },
+    { IRQNO(2, 7), IRQNO(3, 7), IRQNONE },
+    /* LCD1 */
+    { IRQNO(11, 4), IRQNO(12, 0), IRQNONE },
+    { IRQNO(11, 5), IRQNO(12, 1), IRQNONE },
+    { IRQNO(11, 6), IRQNO(12, 2), IRQNONE },
+    { IRQNO(11, 7), IRQNO(12, 3), IRQNONE },
+    /* Multi-core timer */
+    { IRQNO(1, 4), IRQNO(12, 4), IRQNO(35, 4), IRQNO(51, 4), IRQNO(53, 4), IRQNONE },
+    { IRQNO(1, 5), IRQNO(12, 5), IRQNO(35, 5), IRQNO(51, 5), IRQNO(53, 5), IRQNONE },
+    { IRQNO(1, 6), IRQNO(12, 6), IRQNO(35, 6), IRQNO(51, 6), IRQNO(53, 6), IRQNONE },
+    { IRQNO(1, 7), IRQNO(12, 7), IRQNO(35, 7), IRQNO(51, 7), IRQNO(53, 7), IRQNONE },
+};
+
+#undef IRQNO
+
+static const int *combinermap_entry(int irq)
+{
+    /*
+     * If the interrupt number passed in is the first entry in some
+     * line of the combinermap, return a pointer to that line;
+     * otherwise return NULL.
+     */
+    int i;
+    for (i = 0; i < COMBINERMAP_SIZE; i++) {
+        if (combinermap[i][0] == irq) {
+            return combinermap[i];
+        }
+    }
+    return NULL;
+}
+
+static int mapline_size(const int *mapline)
+{
+    /* Return number of entries in this mapline in total */
+    int i = 0;
+
+    if (!mapline) {
+        /* Not in the map? IRQ goes to exactly one combiner input */
+        return 1;
+    }
+    while (*mapline != IRQNONE) {
+        mapline++;
+        i++;
+    }
+    return i;
+}
+
 /*
  * Initialize board IRQs.
  * These IRQs contain splitted Int/External Combiner and External Gic IRQs.
@@ -265,6 +335,8 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
     DeviceState *extgicdev = DEVICE(&s->ext_gic);
     int splitcount = 0;
     DeviceState *splitter;
+    const int *mapline;
+    int numlines, splitin, in;
 
     for (n = 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
         irq_id = 0;
@@ -277,16 +349,46 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
             irq_id = EXT_GIC_ID_MCT_G1;
         }
 
+        if (s->irq_table[n]) {
+            /*
+             * This must be some non-first entry in a combinermap line,
+             * and we've already filled it in.
+             */
+            continue;
+        }
+        mapline = combinermap_entry(n);
+        /*
+         * We need to connect the IRQ to multiple inputs on both combiners
+         * and possibly also to the external GIC.
+         */
+        numlines = 2 * mapline_size(mapline);
+        if (irq_id) {
+            numlines++;
+        }
         assert(splitcount < EXYNOS4210_NUM_SPLITTERS);
         splitter = DEVICE(&s->splitter[splitcount]);
-        qdev_prop_set_uint16(splitter, "num-lines", irq_id ? 3 : 2);
+        qdev_prop_set_uint16(splitter, "num-lines", numlines);
         qdev_realize(splitter, NULL, &error_abort);
         splitcount++;
-        s->irq_table[n] = qdev_get_gpio_in(splitter, 0);
-        qdev_connect_gpio_out(splitter, 0, is->int_combiner_irq[n]);
-        qdev_connect_gpio_out(splitter, 1, is->ext_combiner_irq[n]);
+
+        in = n;
+        splitin = 0;
+        for (;;) {
+            s->irq_table[in] = qdev_get_gpio_in(splitter, 0);
+            qdev_connect_gpio_out(splitter, splitin, is->int_combiner_irq[in]);
+            qdev_connect_gpio_out(splitter, splitin + 1, is->ext_combiner_irq[in]);
+            splitin += 2;
+            if (!mapline) {
+                break;
+            }
+            mapline++;
+            in = *mapline;
+            if (in == IRQNONE) {
+                break;
+            }
+        }
         if (irq_id) {
-            qdev_connect_gpio_out(splitter, 2,
+            qdev_connect_gpio_out(splitter, splitin,
                                   qdev_get_gpio_in(extgicdev, irq_id - 32));
         }
     }
@@ -297,6 +399,14 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
         irq_id = combiner_grp_to_gic_id[grp -
                      EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][bit];
 
+        if (s->irq_table[n]) {
+            /*
+             * This must be some non-first entry in a combinermap line,
+             * and we've already filled it in.
+             */
+            continue;
+        }
+
         if (irq_id) {
             assert(splitcount < EXYNOS4210_NUM_SPLITTERS);
             splitter = DEVICE(&s->splitter[splitcount]);
@@ -337,7 +447,6 @@ static void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs,
                                            DeviceState *dev, int ext)
 {
     int n;
-    int bit;
     int max;
     qemu_irq *irq;
 
@@ -345,64 +454,7 @@ static void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs,
         EXYNOS4210_MAX_INT_COMBINER_IN_IRQ;
     irq = ext ? irqs->ext_combiner_irq : irqs->int_combiner_irq;
 
-    /*
-     * Some IRQs of Int/External Combiner are going to two Combiners groups,
-     * so let split them.
-     */
     for (n = 0; n < max; n++) {
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
         irq[n] = qdev_get_gpio_in(dev, n);
     }
 }
-- 
2.25.1

