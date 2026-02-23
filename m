Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87924EC1114
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:08:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZM0-0003n4-OW; Mon, 23 Feb 2026 12:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKz-0002eR-CR
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:17 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKv-0000N5-8C
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:12 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48375f10628so29380395e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866188; x=1772470988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=S8AwTy6f3L9trkb36+KIhDXHVhmdfQ2KBm07CMiwLbw=;
 b=MktcbywC2MTMRwaBntbfjyHF/IcItD0o0JC0XkyEyTqcRsgIeUn1SOeUJfvW7nFB2m
 dAuQdHnzs358TiL/6gYD5gerdqzXHI2vNMVdTbOqQ4xx3tqNviuVnwpjgRwKMiUZgRx2
 6iGWqLFToWMY97R5/yNmV+soxR1AIjalYxcIaIpAPliegku4CL4ZsC01ccRfO/nOW5AE
 TW71l5HBiYp906pcAdsI7stF3NN7ALg+p8tc2lBAU0I0LoAT0dYkl90g+MYlE6DRNwWy
 JAO/bq4+6SW0VAko25w3Df+3fxjqMN1gFEmiI5ePKIGV56PYRl+Xy6HGkFFqH0b2RJ5d
 BiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866188; x=1772470988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S8AwTy6f3L9trkb36+KIhDXHVhmdfQ2KBm07CMiwLbw=;
 b=g5C4sDhE7qJyE4z767pqT0vzOSnzjDj9qiVrJlnmtw2sso4Mn48unrlYye1bG+hwXv
 TpQhugILjdoXHKnvvto/15Uvrn8qebkugj8NsQiyTCODqvDPkEtkzohYUWbmH1RbliNu
 K3Wa5cfi2anQ73W7SGoGZIusOOrpQr9AwG2JLzfPWsIuirFTnlkMzNhv9vxGHw7LUHES
 4t32dwp6EmUlyqQIbfI50LYoK4KtI1NF4DW1M2vgdGmga/Yss4I+cYBuhkRaI3SrcEHP
 /XIR4j7wFG4iUiqCkIMJigTYXaJ3KPwHq9xIJd2IzIET/wmf4QNbfkbeqmjy7aUaE2g2
 kT0w==
X-Gm-Message-State: AOJu0Yyz4dZPGaeKygyCpzX9wU/FQ8UmiEyLwV2CDWFduENj8veRYRZa
 bovRxEOsU7njpp7t5oFUI9n1Qfk/jnMqpBdPqP5ehFZoEWjJHVL+LQTXnQzdXOgUQipmxr0jmsU
 sG998
X-Gm-Gg: AZuq6aLVSQ02l4Voqb36uVxwV9n448+CUR+/gB4Xgq3rEvizJ6tUekoTXy+VucrnVTC
 Gft4J79jdOcxaVkTfaHLKp29VOp47P0HlSZbk0HzqUCWnMEk4UJ73DqeTL4KDvj2YIDMmDaRIYq
 AUHWoTCXuTSlhcLagfEZgtkFYLf7fjeef/MSVTus4Kwl1MrpkhLNdXvC+agtKUnAK6ia/C47tHj
 DdDXsY1vP1bcn0XvoxnqRUSC3fRGa6zpOqxblR6gH68KtaXttblO0wpmWL7oLsdmRP5NcHlFV6S
 d1cmoiCR8z1g3xwUonLOHSUcFbfbJWAg6kGVxt/jf+zx3wbeq0YMP7JEf/z6I9lbEzDJ5+kQkd7
 Na3ykac/eCT+xQUJN3pAMtF1n/fN4a6AqpE4iwnb16D51qPkd9QeVoisASDfUPeED7hnne1pTRY
 PlebvfQjcCTqarQ8Scjw/+MbHhYPnl8JHElnRct8CptFZZ2q9IBJJy0HVhV3jz32mrRLNyAZq59
 avokwJfYIiUfSaAgtnYOcprrOrRk1I=
X-Received: by 2002:a05:600c:8287:b0:480:3a71:92b2 with SMTP id
 5b1f17b1804b1-483a95eab99mr130172325e9.26.1771866187726; 
 Mon, 23 Feb 2026 09:03:07 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 47/65] target/arm: GICv5 cpuif: Implement GICR CDIA command
Date: Mon, 23 Feb 2026 17:01:54 +0000
Message-ID: <20260223170212.441276-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
---
 target/arm/tcg/gicv5-cpuif.c | 102 +++++++++++++++++++++++++++++++++++
 target/arm/tcg/trace-events  |   2 +
 2 files changed, 104 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index adb4d2018f..d32263a5b7 100644
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
@@ -464,6 +468,94 @@ static uint64_t gic_icc_hppir_el1_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return hppi.intid;
 }
 
+static bool gic_hppi_is_nmi(CPUARMState *env, GICv5PendingIrq hppi,
+                            GICv5Domain domain)
+{
+    /*
+     * For GICv5 an interrupt is an NMI if it is signaled with
+     * Superpriority and SCTLR_ELx.NMI for the current EL is 1.
+     * GICR CDIA/CDNMIA always work on the current interrupt domain,
+     * so we do not need to consider preemptive interrupts. This
+     * means that the interrupt has Superpriority if and only if it
+     * has priority 0.
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
+     * gicv5_activate() cause a re-evaluation of HPPIs they
+     * use the right (new) running priority.
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
+         * Send an Activate command to the IRS, which, despite the name
+         * of the stream command, does both "set Active" and "maybe set
+         * not Pending" as a single atomic action.
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
@@ -521,6 +613,16 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
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


