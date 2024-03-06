Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp273133ejb;
        Tue, 5 Mar 2024 20:01:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWXxHrEkg77aU50UNIQWoujIeb9XxOd1acErsyLE+DZh/9ScAX6+mhEXxnreQbUeWzB7EoJ+PE+55bSp3rvUaA3BBDskL5p
X-Google-Smtp-Source: AGHT+IHgSJguFDBZ63ZCyCgSwF3ayWlcH1YG3crPC2zncH2baPRay6hJr1TU4iEsINLgWazws1zW
X-Received: by 2002:ac8:5795:0:b0:42e:bd48:c77b with SMTP id v21-20020ac85795000000b0042ebd48c77bmr3729119qta.46.1709697670698;
        Tue, 05 Mar 2024 20:01:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709697670; cv=none;
        d=google.com; s=arc-20160816;
        b=KmhObuV2JZZJwR00N+fFoGLxcf/Y45XwqaKVPT+blIKaOyOD6bYZsg2s3b8xJNNlcZ
         jnW+Q7GJisZZcey/oFWl8nKuLMIFcjDVAta41DSmOk7JeWq8AFmiABYaSO1f4JAyqQ0B
         4S1NB/neWnWGN/P10Rk71Mn6W+gvoHVEIovQlEI5JYf81sf7ZOC7ua8NtwgvhiPDFJLL
         a/i/VB1zWT9aqvwmISL3HYjM8Pz4O8J2DqglB+6nikuZ2PuLAHoTTRVj2eQTO+ilWRLO
         h58vopIXcTN3irb4WWSN846c1IE4YduLXMIO66+GBEXdkdrgi76hFUs2bek+sG0kbktt
         5new==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=4SDXPcrYM669YoSu3+jVA/R9cEBTu5J2qdH+W9JQ1O4=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=idDdYLqqAxvKV9Av41hz4ALq31WyZZHXLyx90aqfEMpNUZwGbomsJpPMRYKs9/dEL4
         FcE3zLTIRJ+3pQScX9GQiRB3QkuB13atvqSGxE5E94wKuBzRfU2MQNt0VCvW5l/h771K
         jJbPLBAw0EzqaS3+hDCDmKCdk3u0yJL97T7/xerJmbaqf2BQWtHxD1UXcCsDORDwKA0S
         Ghz817aSujqU/2Rb9Bzq8HVaXBU0zu7qVsjhUJ19PvytLVca2E6gDE+Vzefz4PBGFGic
         isniAPmu0fOUjRoRkgulOpskvT5VKL+UhPXNEQmad9W1xx8dH3WGb4+DVqjJIIX3B/lE
         NBmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v35-20020a05622a18a300b0042ed681cef6si9854092qtc.380.2024.03.05.20.01.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 20:01:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhiQd-00013E-3d; Tue, 05 Mar 2024 22:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQb-000124-K6; Tue, 05 Mar 2024 22:58:49 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQZ-0006oX-6P; Tue, 05 Mar 2024 22:58:49 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TqJWt2898zwPF1;
 Wed,  6 Mar 2024 11:56:26 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 79D7E140257;
 Wed,  6 Mar 2024 11:58:43 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 11:58:42 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v7 19/23] hw/intc/arm_gicv3: Implement NMI interrupt
 prioirty
Date: Wed, 6 Mar 2024 03:57:17 +0000
Message-ID: <20240306035721.2333531-20-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306035721.2333531-1-ruanjinjie@huawei.com>
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
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
X-TUID: vAVIwNfjBBC+

If GICD_CTLR_DS bit is zero and the NMI is non-secure, the NMI prioirty
is higher than 0x80, otherwise it is higher than 0x0. And save NMI
super prioirty information in hppi.superprio to deliver NMI exception.
Since both GICR and GICD can deliver NMI, it is both necessary to check
whether the pending irq is NMI in gicv3_redist_update_noirqset and
gicv3_update_noirqset. And In irqbetter(), only a non-NMI with the same
priority and a smaller interrupt number can be preempted but not NMI.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
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
 hw/intc/arm_gicv3.c        | 69 +++++++++++++++++++++++++++++++++-----
 hw/intc/arm_gicv3_common.c |  3 ++
 hw/intc/arm_gicv3_redist.c |  3 ++
 3 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 0b8f79a122..9496a28005 100644
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
@@ -30,14 +31,23 @@ static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio)
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
+     * The same priority IRQ with superpriority should signal to the CPU
+     * as it have the priority higher than the labelled 0x80 or 0x00.
+     */
+    if (has_superprio != cs->hppi.superprio) {
+        return has_superprio;
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
@@ -129,6 +139,40 @@ static uint32_t gicr_int_pending(GICv3CPUState *cs)
     return pend;
 }
 
+static bool gicv3_get_priority(GICv3CPUState *cs, bool is_redist,
+                               uint8_t *prio, int irq)
+{
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
@@ -141,6 +185,7 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
     uint8_t prio;
     int i;
     uint32_t pend;
+    bool has_superprio = false;
 
     /* Find out which redistributor interrupts are eligible to be
      * signaled to the CPU interface.
@@ -152,10 +197,11 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
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
@@ -168,9 +214,11 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
     if ((cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) && cs->gic->lpi_enable &&
         (cs->gic->gicd_ctlr & GICD_CTLR_EN_GRP1NS) &&
         (cs->hpplpi.prio != 0xff)) {
-        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
+        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio,
+                      cs->hpplpi.superprio)) {
             cs->hppi.irq = cs->hpplpi.irq;
             cs->hppi.prio = cs->hpplpi.prio;
+            cs->hppi.superprio = cs->hpplpi.superprio;
             cs->hppi.grp = cs->hpplpi.grp;
             seenbetter = true;
         }
@@ -213,6 +261,7 @@ static void gicv3_update_noirqset(GICv3State *s, int start, int len)
     int i;
     uint8_t prio;
     uint32_t pend = 0;
+    bool has_superprio = false;
 
     assert(start >= GIC_INTERNAL);
     assert(len > 0);
@@ -240,10 +289,11 @@ static void gicv3_update_noirqset(GICv3State *s, int start, int len)
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
@@ -293,6 +343,7 @@ void gicv3_full_update_noirqset(GICv3State *s)
 
     for (i = 0; i < s->num_cpu; i++) {
         s->cpu[i].hppi.prio = 0xff;
+        s->cpu[i].hppi.superprio = false;
     }
 
     /* Note that we can guarantee that these functions will not
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 2d2cea6858..822d99d8b4 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -498,8 +498,11 @@ static void arm_gicv3_common_reset_hold(Object *obj)
         memset(cs->gicr_ipriorityr, 0, sizeof(cs->gicr_ipriorityr));
 
         cs->hppi.prio = 0xff;
+        cs->hppi.superprio = false;
         cs->hpplpi.prio = 0xff;
+        cs->hpplpi.superprio = false;
         cs->hppvlpi.prio = 0xff;
+        cs->hppvlpi.superprio = false;
 
         /* State in the CPU interface must *not* be reset here, because it
          * is part of the CPU's reset domain, not the GIC device's.
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 7a16a058b1..4118c2f297 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -120,6 +120,7 @@ static void update_for_one_lpi(GICv3CPUState *cs, int irq,
         ((prio == hpp->prio) && (irq <= hpp->irq))) {
         hpp->irq = irq;
         hpp->prio = prio;
+        hpp->superprio = false;
         /* LPIs and vLPIs are always non-secure Grp1 interrupts */
         hpp->grp = GICV3_G1NS;
     }
@@ -156,6 +157,7 @@ static void update_for_all_lpis(GICv3CPUState *cs, uint64_t ptbase,
     int i, bit;
 
     hpp->prio = 0xff;
+    hpp->superprio = false;
 
     for (i = GICV3_LPI_INTID_START / 8; i < pendt_size / 8; i++) {
         address_space_read(as, ptbase + i, MEMTXATTRS_UNSPECIFIED, &pend, 1);
@@ -241,6 +243,7 @@ static void gicv3_redist_update_vlpi_only(GICv3CPUState *cs)
 
     if (!FIELD_EX64(cs->gicr_vpendbaser, GICR_VPENDBASER, VALID)) {
         cs->hppvlpi.prio = 0xff;
+        cs->hppvlpi.superprio = false;
         return;
     }
 
-- 
2.34.1

