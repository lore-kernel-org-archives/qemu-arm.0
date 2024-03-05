Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp114426ejc;
        Mon, 4 Mar 2024 23:12:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUuWaopMVoYrQJzpZQQ2C+3a+RtFJeTjoUng+fptugeiBpuHwlMR61+KzYE/AGKuJ+StIrJlBEiRyXFFXDlgEitJd/Nc8Ha
X-Google-Smtp-Source: AGHT+IGTErwTXcAvh0q/iSeRaRnpOXQAv6Io73NXdoCiu4Q4MbwjXu4xoln2crOTeJ99yxtXn3eE
X-Received: by 2002:a05:622a:289:b0:42e:e020:46ef with SMTP id z9-20020a05622a028900b0042ee02046efmr1414493qtw.48.1709622772582;
        Mon, 04 Mar 2024 23:12:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709622772; cv=none;
        d=google.com; s=arc-20160816;
        b=EjDlEFW9z5NPiexHM+s4de6tJOpSVLqnKOJ3aUA10Z+m6a00u9/oDSmNW96LgkVZtp
         ITDUy57JclnEBhJotBm6aeDrmHzDeCZ20bFEJCJRaAWpLjiftFRFXnC/WTsOxHVP7Fy1
         UDW5pTCotqeH1mVG4wmGnaNV7iOZ1U6AjrX5LTiqtRqQ9DbSxcI/VWv93T5hGyqjudnR
         OJ9kRZNLyKgidSGyki2HihZs4DSwzMbDYQ2H1jA51leau8C+pJbMmE+FhtKai8HgJE6e
         gqutUc3nIkY8N91AcfFUSuYA0lneB6TD2GMdlEF0D2TZTE+ymOp1S5/6QjcXwBQ1QTPT
         ueyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=XFuFx+wUYqNBoZ2+kaPN7l61g/wtRmYGmD8VpAi3ms4=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=egI1miuTkiZeQ+hpVSybr/1xI2ZRs4JNmqTsZkDt7YZRjr1NtWcAFccPoPkq75hJ/B
         vLTFwLfTqDCa7W6OAIF4FI2sJeCjpWeRoXBwMUHRVMkJ9iozae9gQZeTbS37YVD0+Y3+
         MYHsDDtl8PwkXTIelXzmMCQf5IdXXd+YcTlOW7UmZ0X6ye6DEQpkXsyfkRfMv08kgxBq
         iYuFswbtvkLwwRwXTRhMZasqoNpyHQl3WiV0whcKN7ZTquAo3U92pIcIYfxctZHyepyU
         RZ6/uX+/LiaiZb6yIfS95pItZoQ31JTulnvfk+OiaO6Mjz8FMVvuoXs4rsQPC2Vk7Gvz
         Adyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020ac858c5000000b0042edaec98aesi7383095qta.596.2024.03.04.23.12.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 23:12:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhOsm-0005pE-EM; Tue, 05 Mar 2024 02:06:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOrC-0004EE-VD; Tue, 05 Mar 2024 02:05:00 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOr9-0008TX-QI; Tue, 05 Mar 2024 02:04:58 -0500
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Tpmj62jtPzwPDw;
 Tue,  5 Mar 2024 15:02:34 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 9B62214037B;
 Tue,  5 Mar 2024 15:04:50 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 5 Mar
 2024 15:04:50 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v6 19/23] hw/intc/arm_gicv3: Implement NMI interrupt
 prioirty
Date: Tue, 5 Mar 2024 07:03:27 +0000
Message-ID: <20240305070331.2151131-20-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305070331.2151131-1-ruanjinjie@huawei.com>
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: qbLI4yDpi7qa

If GICD_CTLR_DS bit is zero and the NMI is non-secure, the NMI prioirty
is higher than 0x80, otherwise it is higher than 0x0. And save NMI
super prioirty information in hppi.superprio to deliver NMI exception.
Since both GICR and GICD can deliver NMI, it is both necessary to check
whether the pending irq is NMI in gicv3_redist_update_noirqset and
gicv3_update_noirqset. And In irqbetter(), only a non-NMI with the same
priority and a smaller interrupt number can be preempted but not NMI.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v6:
- Put the "extract superprio info" logic into gicv3_get_priority().
- Update the comment in irqbetter().
- Reset the cs->hppi.superprio to 0x0.
- Set hppi.superprio to false for LPI.
v4:
- Replace is_nmi with has_superprio to not a mix NMI and superpriority.
- Update the comment in irqbetter().
- Extract gicv3_get_priority() to avoid code repeat.
---
v3:
- Add missing brace
---
 hw/intc/arm_gicv3.c        | 70 +++++++++++++++++++++++++++++++++-----
 hw/intc/arm_gicv3_common.c |  1 +
 2 files changed, 63 insertions(+), 8 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 0b8f79a122..c3d266af23 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -21,7 +21,8 @@
 #include "hw/intc/arm_gicv3.h"
 #include "gicv3_internal.h"
 
-static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio)
+static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio,
+                      bool has_superprio)
 {
     /* Return true if this IRQ at this priority should take
      * precedence over the current recorded highest priority
@@ -33,11 +34,22 @@ static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio)
     if (prio < cs->hppi.prio) {
         return true;
     }
+
+    /*
+     * The same priority IRQ with superpriority should signal to the CPU
+     * as it have the priority higher than the labelled 0x80 or 0x00.
+     */
+    if (prio == cs->hppi.prio && !cs->hppi.superprio && has_superprio) {
+        return true;
+    }
+
     /* If multiple pending interrupts have the same priority then it is an
      * IMPDEF choice which of them to signal to the CPU. We choose to
-     * signal the one with the lowest interrupt number.
+     * signal the one with the lowest interrupt number if they don't have
+     * superpriority.
      */
-    if (prio == cs->hppi.prio && irq <= cs->hppi.irq) {
+    if (prio == cs->hppi.prio && !cs->hppi.superprio &&
+        !has_superprio && irq <= cs->hppi.irq) {
         return true;
     }
     return false;
@@ -129,6 +141,43 @@ static uint32_t gicr_int_pending(GICv3CPUState *cs)
     return pend;
 }
 
+static bool gicv3_get_priority(GICv3CPUState *cs, bool is_redist,
+                               uint8_t *prio, int irq)
+{
+    bool has_superprio = false;
+    uint32_t superprio = 0x0;
+
+    if (is_redist) {
+        superprio = extract32(cs->gicr_isuperprio, irq, 1);
+    } else {
+        superprio = *gic_bmp_ptr32(cs->gic->superprio, irq);
+        superprio = superprio & (1 << (irq & 0x1f));
+    }
+
+    if (superprio) {
+        has_superprio = true;
+
+        /* DS = 0 & Non-secure NMI */
+        if (!(cs->gic->gicd_ctlr & GICD_CTLR_DS) &&
+            ((is_redist && extract32(cs->gicr_igroupr0, irq, 1)) ||
+             (!is_redist && gicv3_gicd_group_test(cs->gic, irq)))) {
+            *prio = 0x80;
+        } else {
+            *prio = 0x0;
+        }
+    } else {
+        has_superprio = false;
+
+        if (is_redist) {
+            *prio = cs->gicr_ipriorityr[irq];
+        } else {
+            *prio = cs->gic->gicd_ipriority[irq];
+        }
+    }
+
+    return has_superprio;
+}
+
 /* Update the interrupt status after state in a redistributor
  * or CPU interface has changed, but don't tell the CPU i/f.
  */
@@ -141,6 +190,7 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
     uint8_t prio;
     int i;
     uint32_t pend;
+    bool has_superprio = false;
 
     /* Find out which redistributor interrupts are eligible to be
      * signaled to the CPU interface.
@@ -152,10 +202,11 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
             if (!(pend & (1 << i))) {
                 continue;
             }
-            prio = cs->gicr_ipriorityr[i];
-            if (irqbetter(cs, i, prio)) {
+            has_superprio = gicv3_get_priority(cs, true, &prio, i);
+            if (irqbetter(cs, i, prio, has_superprio)) {
                 cs->hppi.irq = i;
                 cs->hppi.prio = prio;
+                cs->hppi.superprio = has_superprio;
                 seenbetter = true;
             }
         }
@@ -168,9 +219,10 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
     if ((cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) && cs->gic->lpi_enable &&
         (cs->gic->gicd_ctlr & GICD_CTLR_EN_GRP1NS) &&
         (cs->hpplpi.prio != 0xff)) {
-        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
+        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio, false)) {
             cs->hppi.irq = cs->hpplpi.irq;
             cs->hppi.prio = cs->hpplpi.prio;
+            cs->hppi.superprio = false;
             cs->hppi.grp = cs->hpplpi.grp;
             seenbetter = true;
         }
@@ -213,6 +265,7 @@ static void gicv3_update_noirqset(GICv3State *s, int start, int len)
     int i;
     uint8_t prio;
     uint32_t pend = 0;
+    bool has_superprio = false;
 
     assert(start >= GIC_INTERNAL);
     assert(len > 0);
@@ -240,10 +293,11 @@ static void gicv3_update_noirqset(GICv3State *s, int start, int len)
              */
             continue;
         }
-        prio = s->gicd_ipriority[i];
-        if (irqbetter(cs, i, prio)) {
+        has_superprio = gicv3_get_priority(cs, false, &prio, i);
+        if (irqbetter(cs, i, prio, has_superprio)) {
             cs->hppi.irq = i;
             cs->hppi.prio = prio;
+            cs->hppi.superprio = has_superprio;
             cs->seenbetter = true;
         }
     }
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 2d2cea6858..b6e990b405 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -498,6 +498,7 @@ static void arm_gicv3_common_reset_hold(Object *obj)
         memset(cs->gicr_ipriorityr, 0, sizeof(cs->gicr_ipriorityr));
 
         cs->hppi.prio = 0xff;
+        cs->hppi.superprio = 0x0;
         cs->hpplpi.prio = 0xff;
         cs->hppvlpi.prio = 0xff;
 
-- 
2.34.1

