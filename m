Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp475816ejf;
        Fri, 23 Feb 2024 02:36:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUlV8vR/arV3yXwVtrRFUI8TV1MhYY2aFWRXKnurU+fZ+qNtlo69VWlBFXQYAxSjBg0z4p7t74vRWgnmpDyBmh3f2osHAfS
X-Google-Smtp-Source: AGHT+IGx1nvMYolvS1guf2X7vVPgq1PYIMbhVvyY1x5JsNPYIYXPgNYnoKdYW1kEtkeMdYdjWyn6
X-Received: by 2002:a05:620a:a58:b0:784:b12:ba1c with SMTP id j24-20020a05620a0a5800b007840b12ba1cmr1548462qka.78.1708684586027;
        Fri, 23 Feb 2024 02:36:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684586; cv=none;
        d=google.com; s=arc-20160816;
        b=HAbOxf+CgpDNIfNTO6Po/Euw84MWaOyk2EaBD4AVw1E6wBD3SveVpbZLZO7TIkUMTW
         YuwOfSTS69Ss/WgxTyJ45ukmhGLQULa8RNdloVTieaCGHQ2ZZTq9zOJxLUgGfoWLPJ2+
         /TWu7VBY6EO0qA88F0HNNJe8g6NxzWQmNZueJJmACP9i4FV2WZgH4UfbPBQ55loWWCCn
         w5yZcwuIuzfnDTVL032PmBzx4vO2HNJJQHJ9jXKonvHrk0DWu1Lc5EuosF6yTTkuZ8D6
         u0kAhEUVvTTVqLY62EREIcPyuaOWzbBEOk3mtNamCN8SNG51BTDH0S7Aw8zfc5zzpMly
         n2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=7L9T5cxw6QDGd2MBFXZjWpUXH2mv1TQ6c88ZD2txQPg=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=Zn1h+uwwrQnIGT0czZTZGW1/rGPS7hvYzC0fWd1g6/+eLUYg7G8Bk7dus4NknLXojT
         MzK8T8TSDsEav7Ad8xggOaRvykcAOfJTw9wiVoBhKOXPF/SOnHztdGomeYKEhbqPWcFU
         X+TDPiaeUcxQVCwG5+zDOA0n2XuvGk9jf2zhblY0ttyXtDbWFnnld6Qois4/kvJOoIu/
         ZB+P7/xT9SMvEZNEe9hvqGfVMN0o4srhFroYnQBtyml5V0LMlMdlsGeHejDi2F+q7/qn
         LG/dQcizGfUhp+GHZoQwX7UodvUNGkOmFJwcxsShlVGN/0jhzQ1P7JFaKOjXwg1kZ/iq
         PF8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz5-20020a05620a36c500b007877cc42788si6798499qkb.3.2024.02.23.02.36.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:36:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdSsv-0003qY-L5; Fri, 23 Feb 2024 05:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsW-0003dm-Ua; Fri, 23 Feb 2024 05:34:06 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsP-0001xE-KR; Fri, 23 Feb 2024 05:34:04 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Th5vH2lpTz1vvBF;
 Fri, 23 Feb 2024 18:33:15 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 67B031400CC;
 Fri, 23 Feb 2024 18:33:50 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:49 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 18/21] hw/intc/arm_gicv3: Implement NMI interrupt
 prioirty
Date: Fri, 23 Feb 2024 10:32:18 +0000
Message-ID: <20240223103221.1142518-19-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ruanjinjie@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qMEEOElhyc+b

If GICD_CTLR_DS bit is zero and the NMI is non-secure, the NMI prioirty
is higher than 0x80, otherwise it is higher than 0x0. And save NMI
super prioirty information in hppi.superprio to deliver NMI exception.
Since both GICR and GICD can deliver NMI, it is both necessary to check
whether the pending irq is NMI in gicv3_redist_update_noirqset and
gicv3_update_noirqset. And In irqbetter(), only a non-NMI with the same
priority and a smaller interrupt number can be preempted but not NMI.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v3:
- Add missing brace
---
 hw/intc/arm_gicv3.c | 63 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 0b8f79a122..75999edd19 100644
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
@@ -152,10 +164,27 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
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
+                    extract32(cs->gicr_igroupr0, i, 1)) {
+                    prio = 0x80;
+                } else {
+                    prio = 0x0;
+                }
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
@@ -168,7 +197,7 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
     if ((cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) && cs->gic->lpi_enable &&
         (cs->gic->gicd_ctlr & GICD_CTLR_EN_GRP1NS) &&
         (cs->hpplpi.prio != 0xff)) {
-        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
+        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio, false)) {
             cs->hppi.irq = cs->hpplpi.irq;
             cs->hppi.prio = cs->hpplpi.prio;
             cs->hppi.grp = cs->hpplpi.grp;
@@ -212,7 +241,9 @@ static void gicv3_update_noirqset(GICv3State *s, int start, int len)
 {
     int i;
     uint8_t prio;
+    bool is_nmi = 0;
     uint32_t pend = 0;
+    uint32_t superprio = 0;
 
     assert(start >= GIC_INTERNAL);
     assert(len > 0);
@@ -240,10 +271,28 @@ static void gicv3_update_noirqset(GICv3State *s, int start, int len)
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
+                gicv3_gicd_group_test(s, i)) {
+                    prio = 0x80;
+            } else {
+                    prio = 0x0;
+            }
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

