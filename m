Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9429E10ED65E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:23:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Ck-0007zv-QR; Fri, 27 Mar 2026 07:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CJ-00076x-Mp
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:51 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CH-0008OP-8q
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:51 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-439cd6b09f8so1307656f8f.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610268; x=1775215068; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nYwEiR5/cYmqAxk5dlNZzaCEtoWpF8rqG2y/FpqcXSc=;
 b=JCH9gFCFPEy4VuWh1899XvNAZINxowNoATyhfl94gR2KUiMRdu/r/e6RTzBkzvv7WH
 qrn7tBrtCvddveAVFPbLrEoOci10QyU0H5/C/bl+H6plp2dj6iSfK9PG71dKCEwt+nBi
 axO+9vCFQidAI01ve+PHstIKK++0SlGB+x084n3pIeyAnelVXb5lEEHRkOhL32cxsIcN
 pYLXEDk8K0opmoaslGkLavfkm8VFy6OHQHvOHOk3yo1R43Mlk3eP/9gJM5IHmtIhYDna
 /hWDcfFXLDP0KKbYk96MouxH0B2FKkpy0uKWLKyvvq1uphQQsQ9ixk2pvPcCoc4atZjF
 nkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610268; x=1775215068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nYwEiR5/cYmqAxk5dlNZzaCEtoWpF8rqG2y/FpqcXSc=;
 b=G5+3VOnL2jWpNioNdMFu5TXCLUB0zodJvlvrjLSrN2ST5roPwRkDMU+kPwzPbY4BkM
 WHdLmxVo3sqFjYBNeep2VymymXJ+Goc7T0Krdm+6s5Wjei6y0g6DnS7659j/rWeiEgFf
 dq2avIfY9+L3C+kNot94FHMKtClTFm3eHY2BpBLtGex1DsPI9DkVVTUdzWGFkTmBnHqP
 gSjo1E2iui+m5W5fdH9SyPzqMkoCJYfK23cmGS6Gx6Cgq4HNDpLMGsIJ7SpbOnr6bR9U
 ttLOMsQZziuCVbtYQQC2HNcBQ8LmQK70YXJ33j4hb7Bv013YNL/UJXGwOMa9M+PPi4ZC
 D/bQ==
X-Gm-Message-State: AOJu0YyHiuAGJmpzDbwFsdwCZDow154pHnhdS7pfP39gJiiAUSZQCyaw
 TWmUbqP/zsMvKLCzGOASgA9Ca/YBiEjY7J9bjkXUeOpcMxbrpdOtVDjIuLVJ5cc/VjSP09Rj1r7
 hQ/Mwdrk=
X-Gm-Gg: ATEYQzxF4Yj9XNnKDVXZzAbzUFynPtZycmYzMpz3XNRXQ5orFVyJ7lsy3arhgNMuYlX
 Qt6W7y+KFOqZ75W+2ubAI6eZEbjZrc/oEj2dXAVByiimp4BFUMWBtDRZZxHajih+F+DSC49zKOi
 Yh5pk3/4AVEcv1uRwAiq6GdFbRLhHF/6hfx/hlZ8BYqb8dEByXkjnfRSFq+FuTk0iuqDOkzUdSD
 sMpiFo02drm1GCI/U9rqk7WMhLuyjTwd7S5zh0OOE5dDDm/Q2CPTA0+ENefFr36lNsYrmyL6lwP
 siMJWTzNgu23R4dtB3hCqckY+6AcHWAoakodZRCF5st/Ih+wIYME4r8aQotgoLREmrPtEfatOrP
 UwJUqfGQ8M9NMrYJ+HOW4xYgV2b617cwPlC5+MToUFDNztXVa0OzuAsK98xoB/koMGp3XhLLilZ
 kgOg9mB6gvQrba8N0+FNG30Z3E+EodB/hKl6+yrYBxGJvFgzWZxVUPYMWtPpy7QFjvBVdtuu4DA
 HYmkTXX3I9w5uDUt4FpX64XlAmB9Yw=
X-Received: by 2002:a05:6000:2382:b0:43b:4757:cc5 with SMTP id
 ffacd0b85a97d-43b9e9e8e21mr2881679f8f.19.1774610267561; 
 Fri, 27 Mar 2026 04:17:47 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 48/65] target/arm: GICv5 cpuif: Implement GICR CDIA command
Date: Fri, 27 Mar 2026 11:16:43 +0000
Message-ID: <20260327111700.795099-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The GICR CDIA system instruction is what the guest uses to
acknowledge the highest priority pending interrupt.  It returns a
value corresponding to the HPPI for the current physical interrupt
domain, if any, and moves that interrupt to being Active.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 target/arm/tcg/gicv5-cpuif.c | 101 +++++++++++++++++++++++++++++++++++
 target/arm/tcg/trace-events  |   2 +
 2 files changed, 103 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 36bbb70c4a..09870e0b09 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -39,6 +39,10 @@ FIELD(GIC_CDHM, HM, 32, 1)
 FIELD(GIC_CDRCFG, ID, 0, 24)
 FIELD(GIC_CDRCFG, TYPE, 29, 3)
 
+FIELD(GICR_CDIA, ID, 0, 24)
+FIELD(GICR_CDIA, TYPE, 29, 3)
+FIELD(GICR_CDIA, VALID, 32, 1)
+
 FIELD(ICC_IDR0_EL1, ID_BITS, 0, 4)
 FIELD(ICC_IDR0_EL1, PRI_BITS, 4, 4)
 FIELD(ICC_IDR0_EL1, GCIE_LEGACY, 8, 4)
@@ -463,6 +467,93 @@ static uint64_t gic_icc_hppir_el1_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return hppi.intid;
 }
 
+static bool gic_hppi_is_nmi(CPUARMState *env, GICv5PendingIrq hppi,
+                            GICv5Domain domain)
+{
+    /*
+     * For GICv5 an interrupt is an NMI if it is signaled with
+     * Superpriority and SCTLR_ELx.NMI for the current EL is 1.  GICR
+     * CDIA/CDNMIA always work on the current interrupt domain, so we
+     * do not need to consider preemptive interrupts. This means that
+     * the interrupt has Superpriority if and only if it has priority 0.
+     */
+    return hppi.prio == 0 && arm_sctlr(env, arm_current_el(env)) & SCTLR_NMI;
+}
+
+static uint64_t gicr_cdia_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* Acknowledge HPPI in the current interrupt domain */
+    GICv5Common *gic = gicv5_get_gic(env);
+    GICv5Domain domain = gicv5_current_phys_domain(env);
+    GICv5PendingIrq hppi = gic_hppi(env, domain);
+    GICv5IntType type = FIELD_EX64(hppi.intid, INTID, TYPE);
+    uint32_t id = FIELD_EX64(hppi.intid, INTID, ID);
+
+    bool cdnmia = ri->opc2 == 1;
+
+    if (!hppi.intid) {
+        /* No interrupt available to acknowledge */
+        trace_gicv5_gicr_cdia_fail(domain,
+                                   "no available interrupt to acknowledge");
+        return 0;
+    }
+    assert(hppi.prio != PRIO_IDLE);
+
+    if (gic_hppi_is_nmi(env, hppi, domain) != cdnmia) {
+        /* GICR CDIA only acknowledges non-NMI; GICR CDNMIA only NMI */
+        trace_gicv5_gicr_cdia_fail(domain,
+                                   cdnmia ? "CDNMIA but HPPI is not NMI" :
+                                   "CDIA but HPPI is NMI");
+        return 0;
+    }
+
+    trace_gicv5_gicr_cdia(domain, hppi.intid);
+
+    /*
+     * The interrupt becomes Active. If the handling mode of the
+     * interrupt is Edge then we also clear the pending state.
+     */
+
+    /*
+     * Set the appropriate bit in the APR to track active priorities.
+     * We do this now so that when gic_recalc_ppi_hppi() or
+     * gicv5_activate() cause a re-evaluation of HPPIs they use the
+     * right (new) running priority.
+     */
+    env->gicv5_cpuif.icc_apr[domain] |= (1 << hppi.prio);
+    switch (type) {
+    case GICV5_PPI:
+    {
+        uint32_t ppireg, ppibit;
+
+        assert(id < GICV5_NUM_PPIS);
+        ppireg = id / 64;
+        ppibit = 1 << (id % 64);
+
+        env->gicv5_cpuif.ppi_active[ppireg] |= ppibit;
+        if (!(env->gicv5_cpuif.ppi_hm[ppireg] & ppibit)) {
+            /* handling mode is Edge: clear pending */
+            env->gicv5_cpuif.ppi_pend[ppireg] &= ~ppibit;
+        }
+        gic_recalc_ppi_hppi(env);
+        break;
+    }
+    case GICV5_LPI:
+    case GICV5_SPI:
+        /*
+         * Send an Activate command to the IRS, which, despite the
+         * name of the stream command, does both "set Active" and
+         * "maybe set not Pending" as a single atomic action.
+         */
+        gicv5_activate(gic, id, domain, type, false);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return hppi.intid | R_GICR_CDIA_VALID_MASK;
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -520,6 +611,16 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
         .writefn = gic_cdhm_write,
     },
+    {   .name = "GICR_CDIA", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 3, .opc2 = 0,
+        .access = PL1_R, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .readfn = gicr_cdia_read,
+    },
+    {   .name = "GICR_CDNMIA", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 3, .opc2 = 1,
+        .access = PL1_R, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .readfn = gicr_cdia_read,
+    },
     {   .name = "ICC_IDR0_EL1", .state = ARM_CP_STATE_AA64,
         .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 10, .opc2 = 2,
         .access = PL1_R, .type = ARM_CP_CONST | ARM_CP_NO_RAW,
diff --git a/target/arm/tcg/trace-events b/target/arm/tcg/trace-events
index 7dc5f781c5..13e15cfcfc 100644
--- a/target/arm/tcg/trace-events
+++ b/target/arm/tcg/trace-events
@@ -3,3 +3,5 @@
 
 # gicv5-cpuif.c
 gicv5_recalc_ppi_hppi(int domain, uint32_t id, uint8_t prio) "domain %d new PPI HPPI id 0x%x prio %u"
+gicv5_gicr_cdia_fail(int domain, const char *reason) "domain %d CDIA attempt failed: %s"
+gicv5_gicr_cdia(int domain, uint32_t id) "domain %d CDIA acknowledge of interrupt 0x%x"
-- 
2.43.0


