Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1991426ejb;
        Wed, 21 Feb 2024 07:31:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWthjmfPUFE5U0ObiHVE1RGzQTsTtdtwztjAMt1LcXN32DsiQJ6DknDZdOgPoBKivkI+fjUgwFZc8Ez53wUqqBxplhAUinK
X-Google-Smtp-Source: AGHT+IEUJ77df4ivcun5zAGHg1awhtGk6DuZiJ35Np9+t1Bg1sGrH9PFgFb2ayVa7H1fL7/YIyHH
X-Received: by 2002:a05:6808:2788:b0:3c0:38da:a338 with SMTP id es8-20020a056808278800b003c038daa338mr17884974oib.54.1708529498327;
        Wed, 21 Feb 2024 07:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708529498; cv=none;
        d=google.com; s=arc-20160816;
        b=U5crO0NKyx4ydebGkyEcfJqdTQ4ocQhXHpYRkhJjFikpqQbU5KwPoz33cugZExc5Ij
         lPPsxmfyjJ/G92uSERDrT1jZ2crkJj+NWdzef91msBpIQdTG/fxsY6GhVBff51G5PEzv
         gMY4m1edshDjgDhlHazPIWfbuyBZZoCuE6sHBOHf0e6xQ00AD0O7PriI1y7LFrDjcv9n
         xAgGhD4bLl1WuYIKf1vrDPpsJF5/omMZmPoIfneVgVnHcv4YcQ6arVc/Dy1dCsKXwpWv
         MNAl6R0qJ9vtsYZBNqrfURrTDIg/Hf09mu6K0fv/7j0w+jC+Xqn2P2fyBm5LWQRfcbrD
         h1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=2Ns3jJVa3WHE3aSvWEK4dFoMMDmgIuee48wRg+FOqxo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=Z69N/gK4+azLcEKhubdWDsugvXLxkotTWLOZiyl6qNjaARvmqQipJOsmXiUUhGu7PS
         4TEQDBgFUiN0WXJbmHuejHxii+MyxZFqZGuMwh4VWPzVvBk19SBHxAe6gF9mI9eZbAoU
         Vhr31ul0LZMA40E37Aj5WrzsHVZRNvVWxNKYR4w8N24cgMEAkN07HtQWlVwj10V+sRYT
         jou6JbiqaZVqEGiP9L9cpSziKR35DGa/GI7xzFY4LSvRVSQ1G+5aw2EPpQBJaK6ctyzr
         9BV07muiEIIu5W+o5ipo45DHc7EpxhwTwP+VcQbhUe2mW+Q3IbxjDKZoGyr/JKI0bYi0
         xvqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020a0562140dac00b0068f85ca0a1asi5398500qvh.231.2024.02.21.07.31.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:31:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcoVw-00053b-Lr; Wed, 21 Feb 2024 10:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoNL-0003Wj-5E; Wed, 21 Feb 2024 10:19:11 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmM2-0004uC-DP; Wed, 21 Feb 2024 08:09:44 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TfxQB5bv9z2BdDw;
 Wed, 21 Feb 2024 21:07:30 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id B66BA140154;
 Wed, 21 Feb 2024 21:09:39 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:39 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 21/22] hw/intc/arm_gicv3: Implement NMI interrupt
 prioirty
Date: Wed, 21 Feb 2024 13:08:22 +0000
Message-ID: <20240221130823.677762-22-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 50WURQVPlF/N

If GICD_CTLR_DS bit is zero and the NMI is non-secure, the NMI prioirty
is higher than 0x80, otherwise it is higher than 0x0. And save NMI
super prioirty information in hppi.superprio to deliver NMI exception.
Since both GICR and GICD can deliver NMI, it is both necessary to check
whether the pending irq is NMI in gicv3_redist_update_noirqset and
gicv3_update_noirqset. And In irqbetter(), only a non-NMI with the same
priority and a smaller interrupt number can be preempted but not NMI.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 hw/intc/arm_gicv3.c | 61 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 7 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 0b8f79a122..e3281cffdc 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -21,7 +21,7 @@
 #include "hw/intc/arm_gicv3.h"
 #include "gicv3_internal.h"
 
-static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio)
+static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio, bool is_nmi)
 {
     /* Return true if this IRQ at this priority should take
      * precedence over the current recorded highest priority
@@ -33,11 +33,21 @@ static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio)
     if (prio < cs->hppi.prio) {
         return true;
     }
+
+    /*
+     * Current highest prioirity pending interrupt is not a NMI
+     * and the new IRQ is a NMI with same priority.
+     */
+    if (prio == cs->hppi.prio && !cs->hppi.superprio && is_nmi) {
+        return true;
+    }
+
     /* If multiple pending interrupts have the same priority then it is an
      * IMPDEF choice which of them to signal to the CPU. We choose to
      * signal the one with the lowest interrupt number.
      */
-    if (prio == cs->hppi.prio && irq <= cs->hppi.irq) {
+    if (prio == cs->hppi.prio && !cs->hppi.superprio &&
+        !is_nmi && irq <= cs->hppi.irq) {
         return true;
     }
     return false;
@@ -141,6 +151,8 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
     uint8_t prio;
     int i;
     uint32_t pend;
+    bool is_nmi = 0;
+    uint32_t superprio = 0;
 
     /* Find out which redistributor interrupts are eligible to be
      * signaled to the CPU interface.
@@ -152,10 +164,26 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
             if (!(pend & (1 << i))) {
                 continue;
             }
-            prio = cs->gicr_ipriorityr[i];
-            if (irqbetter(cs, i, prio)) {
+            superprio = extract32(cs->gicr_isuperprio, i, 1);
+
+            /* NMI */
+            if (superprio) {
+                is_nmi = 1;
+
+                /* DS = 0 & Non-secure NMI */
+                if ((!(cs->gic->gicd_ctlr & GICD_CTLR_DS)) &&
+                    extract32(cs->gicr_igroupr0, i, 1))
+                    prio = 0x80;
+                else
+                    prio = 0x0;
+            } else {
+               is_nmi = 0;
+               prio = cs->gicr_ipriorityr[i];
+            }
+            if (irqbetter(cs, i, prio, is_nmi)) {
                 cs->hppi.irq = i;
                 cs->hppi.prio = prio;
+                cs->hppi.superprio = is_nmi;
                 seenbetter = true;
             }
         }
@@ -168,7 +196,7 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
     if ((cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) && cs->gic->lpi_enable &&
         (cs->gic->gicd_ctlr & GICD_CTLR_EN_GRP1NS) &&
         (cs->hpplpi.prio != 0xff)) {
-        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
+        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio, false)) {
             cs->hppi.irq = cs->hpplpi.irq;
             cs->hppi.prio = cs->hpplpi.prio;
             cs->hppi.grp = cs->hpplpi.grp;
@@ -212,7 +240,9 @@ static void gicv3_update_noirqset(GICv3State *s, int start, int len)
 {
     int i;
     uint8_t prio;
+    bool is_nmi = 0;
     uint32_t pend = 0;
+    uint32_t superprio = 0;
 
     assert(start >= GIC_INTERNAL);
     assert(len > 0);
@@ -240,10 +270,27 @@ static void gicv3_update_noirqset(GICv3State *s, int start, int len)
              */
             continue;
         }
-        prio = s->gicd_ipriority[i];
-        if (irqbetter(cs, i, prio)) {
+
+        superprio = *gic_bmp_ptr32(s->superprio, i);
+        /* NMI */
+        if (superprio & (1 << (i & 0x1f))) {
+            is_nmi = 1;
+
+            /* DS = 0 & Non-secure NMI */
+            if ((!(s->gicd_ctlr & GICD_CTLR_DS)) &&
+                gicv3_gicd_group_test(s, i))
+                    prio = 0x80;
+            else
+                    prio = 0x0;
+        } else {
+            is_nmi = 0;
+            prio = s->gicd_ipriority[i];
+        }
+
+        if (irqbetter(cs, i, prio, is_nmi)) {
             cs->hppi.irq = i;
             cs->hppi.prio = prio;
+            cs->hppi.superprio = is_nmi;
             cs->seenbetter = true;
         }
     }
-- 
2.34.1

