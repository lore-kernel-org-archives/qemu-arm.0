Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp85977lfg;
        Wed, 31 Mar 2021 19:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvYfXfQ7nfus3kuUryZbP39N60FW+sWbh15JKa0MS+j96sAUyHfC0drfcQ//G42qEvcYgZ
X-Received: by 2002:a05:6e02:1087:: with SMTP id r7mr4764387ilj.162.1617245199820;
        Wed, 31 Mar 2021 19:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617245199; cv=none;
        d=google.com; s=arc-20160816;
        b=CxPVggl0ZTJKnlNUQcmD9W1audBKSr+sE5WnUdhX3dmP08WinsoBMWKqY0unks/XnW
         ak+90Bm5GLFv9gMWKONUioCL64oEbtn2CV9YsnewC3DwdO+iWbIgGAw9/lw5zhWaTVTQ
         hxkfIVhr8/DGG6qgDmtkMcXFgF7xUyEpaSWNITNnwbAcq6szv7P/GwJjYYh1sMxqRTby
         1HQxjkXlKDLQDNh8Fg3ksB3M6CgFuzFYLpGasCGzp15F4quJuc6z06IjlYCYMW0QQXev
         JpuXcaosKCKmMKOyc3lY/BWxGNXsgymfUVLbdCmnj8nzq9tDiOE0LKJ0fRPObU5fNRKn
         IN1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BH2Wx4yqn3rSWYD0hZ3gsX6NH7mvgc5o0D4iVxHx4R8=;
        b=G3WqXvxiWjUwtsccPwXSqRYyyVdBU9lwbXnX5MzAwgv19UW7Fj6tCpc9xYvpZt1DEe
         YzyvW7wGwkF1DVKl7Mfsft5H2q+VyjLQ3SDYtRiaadnup9AjnAxHtDnkJ2I+FMvU3YPk
         hZmydWAjzAJZDgn65Mf8pG26UEDQRD8dU8qmGwoyesxm/ZZPSovW3WZnFzx5KGZNgRPp
         HBLX6Dy5myERxzJW0r7lgWFAiTzqGKNEX5yN2gg4UC+PoDL5ELSwp4mHsL+v0xOEKhr6
         NNXBVhYgsD1d7TeFkNUg9yQ8mQLxn+MkIuVxsspkY6YdLfMB5SuUTxq8K/IPu49Nftqg
         p7dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IPv519x9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si3813369iov.55.2021.03.31.19.46.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 19:46:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IPv519x9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRnLz-0008Hl-49
	for alex.bennee@linaro.org; Wed, 31 Mar 2021 22:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHY-0002nT-Ex
 for qemu-arm@nongnu.org; Wed, 31 Mar 2021 22:42:04 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:33442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHT-0003Am-Mk
 for qemu-arm@nongnu.org; Wed, 31 Mar 2021 22:42:04 -0400
Received: by mail-qk1-x730.google.com with SMTP id o5so977868qkb.0
 for <qemu-arm@nongnu.org>; Wed, 31 Mar 2021 19:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BH2Wx4yqn3rSWYD0hZ3gsX6NH7mvgc5o0D4iVxHx4R8=;
 b=IPv519x9Lv+rVoUlXFTvQFv/RRM+4bzdRVyWpXWt2VDh7Dxi7HD4EAS6MonPUl2UwJ
 ZrrzyCUtfQwMij2oXj+PFFSdm4btkfVOr3uBFDYe5aKCOSncSU8w1jd05qtYTubY7hjv
 qpbAi4lcAoFUSOl53eCnSKMXh3/+H/1/hWOuFGHEhVWri3qiy4XUFPNx3OUqSqk7Z7xg
 3m8bvuPDKVZj80v6jep06RKW7Ns9HpZiPATU/NOcybeuBumWHoUwI4FksEdME4Q7EPpE
 Ww3Le1JOd2G8FPfmtpUJdjdc0qsXSXYNABlx0krhmgO1LPvxpUhyFvCnnrwULWY4pSjw
 YpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BH2Wx4yqn3rSWYD0hZ3gsX6NH7mvgc5o0D4iVxHx4R8=;
 b=tjhvFqxTk5abfNWN4OC4GbnAY5GFIMpXnfy+hX1Br8KDkDrY2MvVHFMVBXz7HMSp4W
 w60oKRnRHTxT2TURg6dtdQj3qQbrSDlXlhfavmvTffMRUG69WZlDIypm9ui3Mhevp/ZR
 eC3AO2Hj+UTY5CsDI3nJyDvnYu4Ic9yO0i61runtMgwmcCO6lbJMrKpX7ng8AwNrgd8m
 z4T1yOrVfNqpzPwIsIsnvUATlgY/xOZtQcPdAndTj0aVHrKHXQRE1OCJceJxqmmg1gUc
 MMvGKtMedCfves976aWoPUcru5G1IgZmyLovVOfanTnCKsdAiOY7muOjTFp7ffpGFARc
 DDRQ==
X-Gm-Message-State: AOAM531cGCYBuS0JElzihh1/FCpE4hf6ZSc40gsAkjsXVSgEdv/uQx3o
 enx7svU90juIv7vGzCRC4+jMxQ==
X-Received: by 2002:a37:615:: with SMTP id 21mr6270293qkg.421.1617244918643;
 Wed, 31 Mar 2021 19:41:58 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id a8sm2525707qtx.9.2021.03.31.19.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 19:41:58 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v2 6/8] hw/intc: GICv3 redistributor ITS processing
Date: Wed, 31 Mar 2021 22:41:50 -0400
Message-Id: <20210401024152.203896-7-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210401024152.203896-1-shashi.mallela@linaro.org>
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x730.google.com
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
X-TUID: EZdYNtJ2HZCQ

Implemented lpi processing at redistributor to get lpi config info
from lpi configuration table,determine priority,set pending state in
lpi pending table and forward the lpi to cpuif.Added logic to invoke
redistributor lpi processing with translated LPI which set/clear LPI
from ITS device as part of ITS INT,CLEAR,DISCARD command and
GITS_TRANSLATER processing.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3.c        |   6 ++
 hw/intc/arm_gicv3_cpuif.c  |  15 +++--
 hw/intc/arm_gicv3_its.c    |   9 ++-
 hw/intc/arm_gicv3_redist.c | 124 +++++++++++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h   |   9 +++
 5 files changed, 158 insertions(+), 5 deletions(-)

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
index 43ef1d7a84..c225b80f66 100644
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
 
@@ -1337,7 +1342,9 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
          * valid interrupt value read from the Interrupt Acknowledge
          * register" and so this is UNPREDICTABLE. We choose to ignore it.
          */
-        return;
+        if (!(cs->gic->lpi_enable && (irq >= GICV3_LPI_INTID_START))) {
+            return;
+        }
     }
 
     if (icc_highest_active_group(cs) != grp) {
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 0e3f176809..41e1e8b2a8 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -226,6 +226,7 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
     bool ite_valid = false;
     uint64_t cte = 0;
     bool cte_valid = false;
+    uint64_t rdbase;
     uint8_t buff[ITS_ITT_ENTRY_SIZE];
     uint64_t itt_addr;
 
@@ -278,12 +279,18 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
              * since with a physical address the target address must be
              * 64KB aligned
              */
-
+            rdbase = (cte >> 1U) & RDBASE_MASK;
             /*
              * Current implementation only supports rdbase == procnum
              * Hence rdbase physical address is ignored
              */
         } else {
+            rdbase = (cte >> 1U) & RDBASE_PROCNUM_MASK;
+            if ((cmd == CLEAR) || (cmd == DISCARD)) {
+                gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
+            } else {
+                gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
+            }
 
             if (cmd == DISCARD) {
                 /* remove mapping from interrupt translation table */
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 325b974e70..71c648a616 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -254,6 +254,8 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         if (cs->gicr_typer & GICR_TYPER_PLPIS) {
             if (value & GICR_CTLR_ENABLE_LPIS) {
                 cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
+                /* Check for any pending interr in pending table */
+                gicv3_redist_update(cs);
             } else {
                 cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
             }
@@ -548,6 +550,128 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
     return r;
 }
 
+bool gicv3_redist_update_lpi(GICv3CPUState *cs)
+{
+    AddressSpace *as = &cs->gic->sysmem_as;
+    uint64_t lpict_baddr, lpipt_baddr;
+    uint32_t pendt_size = 0;
+    uint8_t lpite;
+    uint8_t prio, pend;
+    int i;
+    bool seenbetter = false;
+
+    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+        !cs->gicr_pendbaser || cs->lpi_outofrange) {
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
+    AddressSpace *as = &cs->gic->sysmem_as;
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
+    AddressSpace *as = &cs->gic->sysmem_as;
+    uint64_t lpict_baddr;
+    uint8_t lpite;
+
+    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+         !cs->gicr_pendbaser || cs->lpi_outofrange) {
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
index a2718704d4..4c97c22850 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -306,6 +306,12 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 
 #define L1TABLE_ENTRY_SIZE         8
 
+#define LPI_CTE_ENABLE_OFFSET      0
+#define LPI_CTE_ENABLED          VALID_MASK
+#define LPI_CTE_PRIORITY_OFFSET    2
+#define LPI_CTE_PRIORITY_MASK     ((1U << 6) - 1)
+#define LPI_PRIORITY_MASK         0xfc
+
 #define GITS_CMDQ_ENTRY_SIZE               32
 #define NUM_BYTES_IN_DW                     8
 
@@ -444,6 +450,9 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
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

