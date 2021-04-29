Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2146795lfb;
        Thu, 29 Apr 2021 16:42:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwroAGtIwqbYtxpHqw7tDD4R4vSA9KNzKGj1tFXz9Xr7gqxcWp8/rRn4HN5Hni4l8QCfxRu
X-Received: by 2002:a02:c9c8:: with SMTP id c8mr2200211jap.71.1619739767696;
        Thu, 29 Apr 2021 16:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619739767; cv=none;
        d=google.com; s=arc-20160816;
        b=Ws3IeV20ggkL1NG/l3FVc1vsfFHLprJfpfb89n/MWoJRwTDeJ+DEsgUZGh28S11PJp
         R593uz9UPDdru5MdJRxz1+QUv7iEpxHTdkxD4vb3y5LfXdf1WvBxlg0V2mW0bTX2Y9+v
         puxSzBzz/0XgRm2LWP9+0FijCnzYqumd2hqwFsmMGibHi7wr23foZj4fJAu0kJMZCHbt
         RJg80fKQS0Ij/mSEN8d5zkb00PpEdwHxWBGaj1gaD571nPIkCR332pc0JeXJDzDqQpGs
         nWxfa6ikr+gDvVeZL5hRVL1UKssRFP6EwR9y8Yq03N9Oyncx0h5LDgrstc3SsJskkJdI
         vL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YaOdwiS8QcUQAMhViY5sMkq8KyX2xhqLxk47bdZoEsA=;
        b=XtgPwjC8tKLEmLkTQp99n7/9ZdsYzfgNOFmxjRVsQndfrLg3v+2OGUplwGyLi7uiH1
         hPqabe3OARxUiJPKnpydEl6Z2lVY+3r67KIdnp+4vHtpQknDE8NK3/WZ+9zyzWZhaqWA
         i2CNK6Pv/yDeKDTmG8SWAbRVZNh/HlK4sGJGE6lTik7HTtEySxt3pM74Ds6Fz7JfHWFI
         VNykiifbS2jV9kwNUd5O5oDJHUI4HMBljrdnPO5dPsWbM8HApyMae6NbsMJmooqM3qRL
         RqobVXmckUa3JJKymf3iOwYpp0xUnNYeVth9ApNLUv01NuAfly+Ljw7i2US10sY2RJD3
         M2NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MbH2FJNJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si221698jam.8.2021.04.29.16.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Apr 2021 16:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MbH2FJNJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcGIw-000630-LZ
	for alex.bennee@linaro.org; Thu, 29 Apr 2021 19:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIW-0005mu-LJ
 for qemu-arm@nongnu.org; Thu, 29 Apr 2021 19:42:20 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:41788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIJ-0004Ld-Vj
 for qemu-arm@nongnu.org; Thu, 29 Apr 2021 19:42:19 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id gv2so24254090qvb.8
 for <qemu-arm@nongnu.org>; Thu, 29 Apr 2021 16:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YaOdwiS8QcUQAMhViY5sMkq8KyX2xhqLxk47bdZoEsA=;
 b=MbH2FJNJNdhrpE4OBBnFLkkQq4vMICKDLfLLhYnhbP05g+oFbPqvSEk/hADpW6fS0D
 0dXCjKtqz2n97C03g/k2thAtkG0aj/j03eu1jXMuvYNLm2x3PaVuGwdm7Fk5+LZoQ9/F
 aG/7199/DyQntznaRzuEWKctgAMd0DVjb6DLKh7KkJir1uQDBcTlCFWRvWctCwSb3TVl
 YqnWdqRQacGBFA/vBOneMp6PuQiffZKlvRTFcf64fAuXuf5zStT6SZNnyz7o3oovD7cX
 6k1Bnrc8L7sXYr2CN6amxWrwBwmzUnqa2PqXW+Ow+yedUzba7U4m+z10Rj7X0xaCnuv8
 Z2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YaOdwiS8QcUQAMhViY5sMkq8KyX2xhqLxk47bdZoEsA=;
 b=ak7uuUmdHW4/Eh20qJp+TTovgxWGN8GyP6YUW6LDak3Wj1KZ0HTKi+CnKor/uUYBTk
 UQNPnPkyBEvl4qmTFmvoy5nY+QoHUpCRQNYTiBXNu91Ka2+knM+kShwAOg2qvFj2ygMh
 qsJJf+IR/J8hwny/5qVUYmUtH24FffiTcvFO26o2kxNBdZ+HsvxfAqljgg2MKttCiotB
 nmA3coCjh8ynNmPJUv2Je2OptaloWiThyt7atMFZT75loTjEHItudT29DaHIS55z6nD0
 OGx3wWX5FpRILXYCrctITXrHvJVuiUPQp5gO1LurdoVroCS1YnK9E/Q7gvAxjyNaDLY1
 ALKw==
X-Gm-Message-State: AOAM530uxk/u3Vk2QdmAm1SkdHjicI/PBAmt42NB9cYYlFZ+JIuwwYpS
 abC1IOx7g+on4zvL8jxekxIWiw==
X-Received: by 2002:a0c:c18c:: with SMTP id n12mr2415572qvh.43.1619739726475; 
 Thu, 29 Apr 2021 16:42:06 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id i2sm1093229qtg.0.2021.04.29.16.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:42:06 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v3 6/8] hw/intc: GICv3 redistributor ITS processing
Date: Thu, 29 Apr 2021 19:41:59 -0400
Message-Id: <20210429234201.125565-7-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210429234201.125565-1-shashi.mallela@linaro.org>
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FOlUP3XQO3vj

Implemented lpi processing at redistributor to get lpi config info
from lpi configuration table,determine priority,set pending state in
lpi pending table and forward the lpi to cpuif.Added logic to invoke
redistributor lpi processing with translated LPI which set/clear LPI
from ITS device as part of ITS INT,CLEAR,DISCARD command and
GITS_TRANSLATER processing.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3.c        |   6 ++
 hw/intc/arm_gicv3_cpuif.c  |  20 ++++--
 hw/intc/arm_gicv3_its.c    |  12 ++--
 hw/intc/arm_gicv3_redist.c | 133 +++++++++++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h   |   9 +++
 5 files changed, 171 insertions(+), 9 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 66eaa97198..618fa1af95 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -166,6 +166,12 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
         cs->hppi.grp = gicv3_irq_group(cs->gic, cs, cs->hppi.irq);
     }
 
+    if (cs->gic->lpi_enable) {
+        if (gicv3_redist_update_lpi(cs)) {
+            seenbetter = true;
+        }
+    }
+
     /* If the best interrupt we just found would preempt whatever
      * was the previous best interrupt before this update, then
      * we know it's definitely the best one now.
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 43ef1d7a84..11b1df5b6b 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -899,9 +899,14 @@ static void icc_activate_irq(GICv3CPUState *cs, int irq)
         cs->gicr_ipendr0 = deposit32(cs->gicr_ipendr0, irq, 1, 0);
         gicv3_redist_update(cs);
     } else {
-        gicv3_gicd_active_set(cs->gic, irq);
-        gicv3_gicd_pending_clear(cs->gic, irq);
-        gicv3_update(cs->gic, irq, 1);
+        if (irq >= GICV3_LPI_INTID_START) {
+            gicv3_redist_lpi_pending(cs, irq, 0);
+            gicv3_redist_update(cs);
+        } else {
+            gicv3_gicd_active_set(cs->gic, irq);
+            gicv3_gicd_pending_clear(cs->gic, irq);
+            gicv3_update(cs->gic, irq, 1);
+        }
     }
 }
 
@@ -1328,7 +1333,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
     }
 
-    if (irq >= cs->gic->num_irq) {
+    if ((irq >= cs->gic->num_irq) && (!(cs->gic->lpi_enable &&
+        (irq >= GICV3_LPI_INTID_START)))) {
         /* This handles two cases:
          * 1. If software writes the ID of a spurious interrupt [ie 1020-1023]
          * to the GICC_EOIR, the GIC ignores that write.
@@ -1348,7 +1354,11 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     if (!icc_eoi_split(env, cs)) {
         /* Priority drop and deactivate not split: deactivate irq now */
-        icc_deactivate_irq(cs, irq);
+        if (irq >= GICV3_LPI_INTID_START) {
+            gicv3_update(cs->gic, irq, 1);
+        } else {
+            icc_deactivate_irq(cs, irq);
+        }
     }
 }
 
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 98c984dd22..28da2d1d77 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -219,6 +219,7 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
     bool ite_valid = false;
     uint64_t cte = 0;
     bool cte_valid = false;
+    uint64_t rdbase;
     uint64_t itel = 0;
     uint32_t iteh = 0;
 
@@ -275,10 +276,13 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
          * command in the queue
          */
     } else {
-        /*
-         * Current implementation only supports rdbase == procnum
-         * Hence rdbase physical address is ignored
-         */
+        rdbase = (cte >> 1U) & RDBASE_PROCNUM_MASK;
+        if ((cmd == CLEAR) || (cmd == DISCARD)) {
+            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
+        } else {
+            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
+        }
+
         if (cmd == DISCARD) {
             /* remove mapping from interrupt translation table */
             res = update_ite(s, eventid, dte, itel, iteh);
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 7604ccdc83..82ca9d71e5 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -256,6 +256,8 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         if (cs->gicr_typer & GICR_TYPER_PLPIS) {
             if (value & GICR_CTLR_ENABLE_LPIS) {
                 cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
+                /* Check for any pending interr in pending table */
+                gicv3_redist_update(cs);
             } else {
                 cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
             }
@@ -546,6 +548,137 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
     return r;
 }
 
+bool gicv3_redist_update_lpi(GICv3CPUState *cs)
+{
+    /*
+     * This function scans the LPI pending table and for each pending
+     * LPI, reads the corresponding entry from LPI configuration table
+     * to extract the priority info and determine if the LPI priority
+     * is lower than the current high priority interrupt.If yes, update
+     * high priority pending interrupt to that of LPI.
+     */
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t lpict_baddr, lpipt_baddr;
+    uint32_t pendt_size = 0;
+    uint8_t lpite;
+    uint8_t prio, pend;
+    int i;
+    bool seenbetter = false;
+
+    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+        !cs->gicr_pendbaser || (FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
+        IDBITS) < GICR_PROPBASER_IDBITS_THRESHOLD)) {
+        return seenbetter;
+    }
+
+    lpict_baddr = FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, PHYADDR);
+    lpict_baddr <<= R_GICR_PROPBASER_PHYADDR_SHIFT;
+
+    lpipt_baddr =  FIELD_EX64(cs->gicr_pendbaser, GICR_PENDBASER, PHYADDR);
+    lpipt_baddr <<= R_GICR_PENDBASER_PHYADDR_SHIFT;
+
+    /* Determine the highest priority pending interrupt among LPIs */
+    pendt_size = (1UL << (FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
+                          IDBITS) - 1));
+
+    for (i = 0; i < pendt_size; i++) {
+        address_space_read(as, lpipt_baddr +
+                (((GICV3_LPI_INTID_START + i) / 8) * sizeof(pend)),
+                MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+
+        if ((1 << ((GICV3_LPI_INTID_START + i) % 8)) & pend) {
+            address_space_read(as, lpict_baddr + (i * sizeof(lpite)),
+                      MEMTXATTRS_UNSPECIFIED, &lpite, sizeof(lpite));
+
+            prio = ((lpite >> LPI_CTE_PRIORITY_OFFSET) &
+                     LPI_CTE_PRIORITY_MASK);
+            prio &= LPI_PRIORITY_MASK;
+
+            if (prio < cs->hppi.prio) {
+                cs->hppi.irq = GICV3_LPI_INTID_START + i;
+                cs->hppi.prio = prio;
+                /* LPIs are always non-secure Grp1 interrupts */
+                cs->hppi.grp = GICV3_G1NS;
+                seenbetter = true;
+            }
+        }
+    }
+    return seenbetter;
+}
+
+void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
+{
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t lpipt_baddr;
+    bool ispend = false;
+    uint8_t pend;
+
+    /*
+     * get the bit value corresponding to this irq in the
+     * lpi pending table
+     */
+    lpipt_baddr = FIELD_EX64(cs->gicr_pendbaser, GICR_PENDBASER, PHYADDR);
+    lpipt_baddr <<= R_GICR_PENDBASER_PHYADDR_SHIFT;
+
+    address_space_read(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
+                         MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+    ispend = ((pend >> (irq % 8)) & 0x1);
+
+    if (ispend) {
+        if (!level) {
+            /*
+             * clear the pending bit and update the lpi pending table
+             */
+            pend &= ~(1 << (irq % 8));
+
+            address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
+                                 MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+        }
+    } else {
+        if (level) {
+            /*
+             * if pending bit is not already set for this irq,turn-on the
+             * pending bit and update the lpi pending table
+             */
+            pend |= (1 << (irq % 8));
+
+            address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
+                                 MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+        }
+    }
+}
+
+void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
+{
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t lpict_baddr;
+    uint8_t lpite;
+
+    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+         !cs->gicr_pendbaser || (FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
+         IDBITS) < GICR_PROPBASER_IDBITS_THRESHOLD)) {
+        return;
+    }
+
+    lpict_baddr = FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, PHYADDR);
+    lpict_baddr <<= R_GICR_PROPBASER_PHYADDR_SHIFT;
+
+    /* get the lpi config table entry corresponding to this irq */
+    address_space_read(as, lpict_baddr + ((irq - GICV3_LPI_INTID_START) *
+                        sizeof(lpite)), MEMTXATTRS_UNSPECIFIED,
+                        &lpite, sizeof(lpite));
+
+    /* check if this irq is enabled before proceeding further */
+    if (!(lpite & LPI_CTE_ENABLED)) {
+        return;
+    }
+
+    /* set/clear the pending bit for this irq */
+    gicv3_redist_lpi_pending(cs, irq, level);
+
+    gicv3_redist_update(cs);
+}
+
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
 {
     /* Update redistributor state for a change in an external PPI input line */
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index c99a05461e..dcdad8d0af 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -308,6 +308,12 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 
 #define L1TABLE_ENTRY_SIZE         8
 
+#define LPI_CTE_ENABLE_OFFSET      0
+#define LPI_CTE_ENABLED          VALID_MASK
+#define LPI_CTE_PRIORITY_OFFSET    2
+#define LPI_CTE_PRIORITY_MASK     ((1U << 6) - 1)
+#define LPI_PRIORITY_MASK         0xfc
+
 #define GITS_CMDQ_ENTRY_SIZE               32
 #define NUM_BYTES_IN_DW                     8
 
@@ -453,6 +459,9 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
                                unsigned size, MemTxAttrs attrs);
 void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
+bool gicv3_redist_update_lpi(GICv3CPUState *cs);
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
 
-- 
2.27.0

