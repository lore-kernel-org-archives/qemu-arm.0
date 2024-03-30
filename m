Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp2320486ejv;
        Sat, 30 Mar 2024 03:35:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWS98unUMOBtZO8XDgHUM+6RVTh+K320Uube6o2o1PZQXLjy452NlFIjlRUZf23yYkO0UsdKRLXCqudXSxJBx7k6YBdJrMa
X-Google-Smtp-Source: AGHT+IHoMkuFIrTenuqLK1w2NskAiyLqu09XgYsi6jPTDqg9QnsmkWATuS0c1vlWcEPq1CynplVC
X-Received: by 2002:a0c:ec90:0:b0:698:faf3:8e11 with SMTP id u16-20020a0cec90000000b00698faf38e11mr862794qvo.43.1711794913581;
        Sat, 30 Mar 2024 03:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711794913; cv=none;
        d=google.com; s=arc-20160816;
        b=WuEuE3c21O0qMJNtYBeeawPvBlRGLRM80MJsrTgFAadEJchiG/U2DVo/VVLQt1xKrc
         fAzrIOwB6xFye/8YGxBfK9ywe6BfHsjLKezLmRaiMkmLC3pjAJqZTTNCZSkiH87XKwez
         fqm7yuNWfuPjZP2MB6J5xEB/E/WwDXR1vWD519LEH9l0Gc73cMnLKVOj1mPggRmOWoIi
         LVpnZ63h8r3775dcEFjXzTAivGBiXt49EhuCVaovYCZEcFTHF32PbgoMt9XirCAVN58D
         iIbTI/+soq1ucxps+daiJfsbNtd+pGPFSZwIMLqeTlYjdDpUoWaGlrGsr2CIrHiFNJj/
         Zy8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=nx7ohUIGzZb0GkRqorATgx40IzLKxN6hRpfPkfyvEH4=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=U1geMij8TLor9kjxB3TA1WTsDGXvIREqn8I0mecavTdf2guHu5V8HgG3n/TbbJZZV6
         r8Xja1E1uhvurGbMnb66/H9p6BgrsqHzlBYp8Ug+6BCf0yjxxGck45DMUzu6ZncqhXG1
         2JickN2cdFL3cBHlDLtZQw0Up+qpksw5USapYHK0gZa0c5U3euTeTs/1BP8UwSo4YnEH
         XsDjMGBk52S+Gwi+iXAgrLqv2Zj7QdnPeQPDCDp6Msu6Ofbf7rvfFbGWdXaXI2slBzDT
         JMse2bZZxF2INK5Xw4aVLpKr0+sM1mP8bP6EzC31RvXx9aq3DaGr+UBiiQ3b3atyi8T7
         Xb3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2-20020a0c8b02000000b0069697d41ae5si5322805qva.371.2024.03.30.03.35.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2024 03:35:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rqW1j-0000VB-4I; Sat, 30 Mar 2024 06:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1P-0000O4-7y; Sat, 30 Mar 2024 06:33:12 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1M-0000qu-Jj; Sat, 30 Mar 2024 06:33:10 -0400
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V6D7M59lFz29ldQ;
 Sat, 30 Mar 2024 18:30:23 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id DF7FA1A0172;
 Sat, 30 Mar 2024 18:33:05 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sat, 30 Mar
 2024 18:33:05 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 19/23] hw/intc/arm_gicv3: Implement NMI interrupt prioirty
Date: Sat, 30 Mar 2024 10:31:24 +0000
Message-ID: <20240330103128.3185962-20-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330103128.3185962-1-ruanjinjie@huawei.com>
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: QaFyAdj2dInl

If GICD_CTLR_DS bit is zero and the NMI is non-secure, the NMI prioirty
is higher than 0x80, otherwise it is higher than 0x0. And save NMI
super prioirty information in hppi.superprio to deliver NMI exception.
Since both GICR and GICD can deliver NMI, it is both necessary to check
whether the pending irq is NMI in gicv3_redist_update_noirqset and
gicv3_update_noirqset. And In irqbetter(), only a non-NMI with the same
priority and a smaller interrupt number can be preempted but not NMI.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v10:
- has_superprio -> nmi.
- superpriority -> non-maskable property.
- gicr_isuperprio -> gicr_inmir0.
- superprio -> nmi.
v8:
- Add Reviewed-by.
v7:
- Reorder the irqbetter() code for clarity.
- Eliminate the has_superprio local variable for gicv3_get_priority().
- false -> cs->hpplpi.superprio in gicv3_redist_update_noirqset().
- 0x0 -> false in arm_gicv3_common_reset_hold().
- Clear superprio in several places for hppi, hpplpi and hppvlpi.
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
 hw/intc/arm_gicv3.c        | 67 +++++++++++++++++++++++++++++++++-----
 hw/intc/arm_gicv3_common.c |  3 ++
 hw/intc/arm_gicv3_redist.c |  3 ++
 3 files changed, 64 insertions(+), 9 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 0b8f79a122..6704190d9d 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -21,7 +21,7 @@
 #include "hw/intc/arm_gicv3.h"
 #include "gicv3_internal.h"
 
-static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio)
+static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio, bool nmi)
 {
     /* Return true if this IRQ at this priority should take
      * precedence over the current recorded highest priority
@@ -30,14 +30,23 @@ static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio)
      * is the same as this one (a property which the calling code
      * relies on).
      */
-    if (prio < cs->hppi.prio) {
-        return true;
+    if (prio != cs->hppi.prio) {
+        return prio < cs->hppi.prio;
+    }
+
+    /*
+     * The same priority IRQ with non-maskable property should signal to
+     * the CPU as it have the priority higher than the labelled 0x80 or 0x00.
+     */
+    if (nmi != cs->hppi.nmi) {
+        return nmi;
     }
+
     /* If multiple pending interrupts have the same priority then it is an
      * IMPDEF choice which of them to signal to the CPU. We choose to
      * signal the one with the lowest interrupt number.
      */
-    if (prio == cs->hppi.prio && irq <= cs->hppi.irq) {
+    if (irq <= cs->hppi.irq) {
         return true;
     }
     return false;
@@ -129,6 +138,40 @@ static uint32_t gicr_int_pending(GICv3CPUState *cs)
     return pend;
 }
 
+static bool gicv3_get_priority(GICv3CPUState *cs, bool is_redist,
+                               uint8_t *prio, int irq)
+{
+    uint32_t nmi = 0x0;
+
+    if (is_redist) {
+        nmi = extract32(cs->gicr_inmir0, irq, 1);
+    } else {
+        nmi = *gic_bmp_ptr32(cs->gic->nmi, irq);
+        nmi = nmi & (1 << (irq & 0x1f));
+    }
+
+    if (nmi) {
+        /* DS = 0 & Non-secure NMI */
+        if (!(cs->gic->gicd_ctlr & GICD_CTLR_DS) &&
+            ((is_redist && extract32(cs->gicr_igroupr0, irq, 1)) ||
+             (!is_redist && gicv3_gicd_group_test(cs->gic, irq)))) {
+            *prio = 0x80;
+        } else {
+            *prio = 0x0;
+        }
+
+        return true;
+    }
+
+    if (is_redist) {
+        *prio = cs->gicr_ipriorityr[irq];
+    } else {
+        *prio = cs->gic->gicd_ipriority[irq];
+    }
+
+    return false;
+}
+
 /* Update the interrupt status after state in a redistributor
  * or CPU interface has changed, but don't tell the CPU i/f.
  */
@@ -141,6 +184,7 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
     uint8_t prio;
     int i;
     uint32_t pend;
+    bool nmi = false;
 
     /* Find out which redistributor interrupts are eligible to be
      * signaled to the CPU interface.
@@ -152,10 +196,11 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
             if (!(pend & (1 << i))) {
                 continue;
             }
-            prio = cs->gicr_ipriorityr[i];
-            if (irqbetter(cs, i, prio)) {
+            nmi = gicv3_get_priority(cs, true, &prio, i);
+            if (irqbetter(cs, i, prio, nmi)) {
                 cs->hppi.irq = i;
                 cs->hppi.prio = prio;
+                cs->hppi.nmi = nmi;
                 seenbetter = true;
             }
         }
@@ -168,9 +213,10 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
     if ((cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) && cs->gic->lpi_enable &&
         (cs->gic->gicd_ctlr & GICD_CTLR_EN_GRP1NS) &&
         (cs->hpplpi.prio != 0xff)) {
-        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
+        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio, cs->hpplpi.nmi)) {
             cs->hppi.irq = cs->hpplpi.irq;
             cs->hppi.prio = cs->hpplpi.prio;
+            cs->hppi.nmi = cs->hpplpi.nmi;
             cs->hppi.grp = cs->hpplpi.grp;
             seenbetter = true;
         }
@@ -213,6 +259,7 @@ static void gicv3_update_noirqset(GICv3State *s, int start, int len)
     int i;
     uint8_t prio;
     uint32_t pend = 0;
+    bool nmi = false;
 
     assert(start >= GIC_INTERNAL);
     assert(len > 0);
@@ -240,10 +287,11 @@ static void gicv3_update_noirqset(GICv3State *s, int start, int len)
              */
             continue;
         }
-        prio = s->gicd_ipriority[i];
-        if (irqbetter(cs, i, prio)) {
+        nmi = gicv3_get_priority(cs, false, &prio, i);
+        if (irqbetter(cs, i, prio, nmi)) {
             cs->hppi.irq = i;
             cs->hppi.prio = prio;
+            cs->hppi.nmi = nmi;
             cs->seenbetter = true;
         }
     }
@@ -293,6 +341,7 @@ void gicv3_full_update_noirqset(GICv3State *s)
 
     for (i = 0; i < s->num_cpu; i++) {
         s->cpu[i].hppi.prio = 0xff;
+        s->cpu[i].hppi.nmi = false;
     }
 
     /* Note that we can guarantee that these functions will not
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 189258e1ca..5871df71f0 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -536,8 +536,11 @@ static void arm_gicv3_common_reset_hold(Object *obj)
         memset(cs->gicr_ipriorityr, 0, sizeof(cs->gicr_ipriorityr));
 
         cs->hppi.prio = 0xff;
+        cs->hppi.nmi = false;
         cs->hpplpi.prio = 0xff;
+        cs->hpplpi.nmi = false;
         cs->hppvlpi.prio = 0xff;
+        cs->hppvlpi.nmi = false;
 
         /* State in the CPU interface must *not* be reset here, because it
          * is part of the CPU's reset domain, not the GIC device's.
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index ed1f9d1e44..90b238fac0 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -120,6 +120,7 @@ static void update_for_one_lpi(GICv3CPUState *cs, int irq,
         ((prio == hpp->prio) && (irq <= hpp->irq))) {
         hpp->irq = irq;
         hpp->prio = prio;
+        hpp->nmi = false;
         /* LPIs and vLPIs are always non-secure Grp1 interrupts */
         hpp->grp = GICV3_G1NS;
     }
@@ -156,6 +157,7 @@ static void update_for_all_lpis(GICv3CPUState *cs, uint64_t ptbase,
     int i, bit;
 
     hpp->prio = 0xff;
+    hpp->nmi = false;
 
     for (i = GICV3_LPI_INTID_START / 8; i < pendt_size / 8; i++) {
         address_space_read(as, ptbase + i, MEMTXATTRS_UNSPECIFIED, &pend, 1);
@@ -241,6 +243,7 @@ static void gicv3_redist_update_vlpi_only(GICv3CPUState *cs)
 
     if (!FIELD_EX64(cs->gicr_vpendbaser, GICR_VPENDBASER, VALID)) {
         cs->hppvlpi.prio = 0xff;
+        cs->hppvlpi.nmi = false;
         return;
     }
 
-- 
2.34.1

