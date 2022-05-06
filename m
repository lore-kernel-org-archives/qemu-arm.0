Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1916658lfj;
        Fri, 6 May 2022 09:24:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy1FXKEFMvaCp77f2z3FQ21SM1dcEXg/c3nx8wElsaF1K5SL7PU6uYQsS71eECZ6YKgeLp
X-Received: by 2002:a05:620a:448c:b0:6a0:3697:da2a with SMTP id x12-20020a05620a448c00b006a03697da2amr2941528qkp.433.1651854263299;
        Fri, 06 May 2022 09:24:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651854263; cv=none;
        d=google.com; s=arc-20160816;
        b=htyIyxq8WngyLEK7Ajy7AfZYvI0jRYi68Uhr6Fqqa4F37Nt9tMuES1wq7MYlAG7gg2
         eWjyFKSoAxk70SsY3PS0CRQMINxEddoagXWz5A6hDboEbwQGK2bBpN0w8FWi0HnkFICh
         JLu6VAHIYt/sMalrHBWSrJ3dKq1a0Dta/ATqBevYv4PeMSDXt65NF45O3jktKbiswtAb
         KePsBn1NBUich7ZB8bIjqeftDevX1s3oeH4JaBwo9EfNiy5m+e7GJa+b4wIiNpmXqbS6
         r64I0j6XeIXe4iXcZGYNrpzGhs/OMbQBG7GbXNtDRQyiB8AZZTVKcBBi9r0lWdIXXUXa
         0aGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rQ1TfyFqxyqCGdaZlMTRB102yDqEKoO1FsuQsTi1Fto=;
        b=iNI3OMDhDfKdopx4W6UdHqjWIGD4v507mFhHMV2EBY1+UUAbxTC9cpZUnwUkBKlCvY
         xHpVIBlMsCCSGQL+ZAd549cij02oCFag9uzfe2ut0diL+XsopTpPgz9luhTml3J2iad7
         IWoftlQ2Spk1eWWS1wIzCchKdM+Plm9UW2KjDmm0nUbPbiJD4hsSc3zsi/VOfeoJ3JRv
         5Vbix2ZNL7C9eJXGq9BPt/w+dalJbpe3zjEF8SLX7FpmWSdbsiXsOiCNfse4bPklp6MF
         otNFh9mH1BeGj5yAlLgpmwFr7Sf6vgGC8o+pJrsMdpfBf9S2GF7assyLv+iYbBb50t2Y
         qHnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKv7oQu4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gu9-20020a056214260900b0045a85be8406si3243489qvb.231.2022.05.06.09.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 09:24:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKv7oQu4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn0kg-0001XI-Pc
	for alex.bennee@linaro.org; Fri, 06 May 2022 12:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0i3-0005OE-3w
 for qemu-arm@nongnu.org; Fri, 06 May 2022 12:21:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0hz-00053x-Te
 for qemu-arm@nongnu.org; Fri, 06 May 2022 12:21:38 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u3so10710841wrg.3
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 09:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rQ1TfyFqxyqCGdaZlMTRB102yDqEKoO1FsuQsTi1Fto=;
 b=aKv7oQu4Y3pBVFBGmGzxlSIKcB9Rfjp1Qtyej7mWKd5F/68jQ7A4cFWeSrpPzxhgRC
 Kh/sFBW8pD8xRV2O1/JiYSuvyb+rjMPDrIBkkLBhykc2Fn3s/8a9gyOdzgqenSIumcpp
 HpGizsdT92zK4NKZ2KTcKVVS0jqs6hsTd7f8hTfu2nU278Tahvz6syXRRms65YqI6hvZ
 UqhDCYvE8MwNoyBJYTwUVQx6dZbiGOcqxUxEWmjhfwkEDWToLXqSMGbMoa354mgi1kk4
 ydhlcxmkhhWsTSPAt1MAaEg2VRljIilSuzOJomhvHblgjblHb6QjZFkxKHCo5vFqlR4D
 Cj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rQ1TfyFqxyqCGdaZlMTRB102yDqEKoO1FsuQsTi1Fto=;
 b=l+zkjGlrIbQyaUYBDl7nnqMMqiVG3kn4n/EYesfaKaHHiOWMkASp9PKiAewIOnGFVL
 hfuzJx5rr4TDAuxPyCV9kKDAm/FpdR04y4x3Dl7+cY9pSQ5bX7Lp0HKsVAA9tp4ReumH
 stmwUbUQFoce3b/AybK5knC/Re8e6UTHt6NvsdPDTN/hgNGGkDTFaNUZ6dDiZX/tRFXi
 hjSEVI1odncKFKcQ1hLu9GXzUjWJCIN+8Rgo4C9sydFVZ+BGeBXcmPPbzBHmrzOsvGu2
 iGFYMyNIXOTcP9dhA32/XWVXV4M6iOUYgsVLNV00EfYS+V8LoRjur0bmXZ1RhItI4aBG
 EyXg==
X-Gm-Message-State: AOAM533oWH5ofxY7XVxb0GwO29egut1dpCJVxLcazArrRd1flGcdVa9z
 fD9uSAxc1Hpf+qWmyUCHLCBH3x86KBacXA==
X-Received: by 2002:a5d:60d1:0:b0:20a:e22f:b31a with SMTP id
 x17-20020a5d60d1000000b0020ae22fb31amr3272606wrt.680.1651854094422; 
 Fri, 06 May 2022 09:21:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4482000000b0020c5253d926sm3782082wrq.114.2022.05.06.09.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 09:21:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/5] hw/intc/arm_gicv3: Support configurable number of
 physical priority bits
Date: Fri,  6 May 2022 17:21:27 +0100
Message-Id: <20220506162129.2896966-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506162129.2896966-1-peter.maydell@linaro.org>
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MBmhRcT7Hdng

The GICv3 code has always supported a configurable number of virtual
priority and preemption bits, but our implementation currently
hardcodes the number of physical priority bits at 8.  This is not
what most hardware implementations provide; for instance the
Cortex-A53 provides only 5 bits of physical priority.

Make the number of physical priority/preemption bits driven by fields
in the GICv3CPUState, the way that we already do for virtual
priority/preemption bits.  We set cs->pribits to 8, so there is no
behavioural change in this commit.  A following commit will add the
machinery for CPUs to set this to the correct value for their
implementation.

Note that changing the number of priority bits would be a migration
compatibility break, because the semantics of the icc_apr[][] array
changes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/arm_gicv3_common.h |   7 +-
 hw/intc/arm_gicv3_cpuif.c          | 182 ++++++++++++++++++++---------
 2 files changed, 130 insertions(+), 59 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 4e416100559..46677ec345c 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -51,11 +51,6 @@
 /* Maximum number of list registers (architectural limit) */
 #define GICV3_LR_MAX 16
 
-/* Minimum BPR for Secure, or when security not enabled */
-#define GIC_MIN_BPR 0
-/* Minimum BPR for Nonsecure when security is enabled */
-#define GIC_MIN_BPR_NS (GIC_MIN_BPR + 1)
-
 /* For some distributor fields we want to model the array of 32-bit
  * register values which hold various bitmaps corresponding to enabled,
  * pending, etc bits. These macros and functions facilitate that; the
@@ -206,6 +201,8 @@ struct GICv3CPUState {
     int num_list_regs;
     int vpribits; /* number of virtual priority bits */
     int vprebits; /* number of virtual preemption bits */
+    int pribits; /* number of physical priority bits */
+    int prebits; /* number of physical preemption bits */
 
     /* Current highest priority pending interrupt for this CPU.
      * This is cached information that can be recalculated from the
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index d3b92a36636..8499a49be39 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -787,6 +787,36 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return intid;
 }
 
+static uint32_t icc_fullprio_mask(GICv3CPUState *cs)
+{
+    /*
+     * Return a mask word which clears the unimplemented priority bits
+     * from a priority value for a physical interrupt. (Not to be confused
+     * with the group priority, whose mask depends on the value of BPR
+     * for the interrupt group.)
+     */
+    return ~0U << (8 - cs->pribits);
+}
+
+static inline int icc_min_bpr(GICv3CPUState *cs)
+{
+    /* The minimum BPR for the physical interface. */
+    return 7 - cs->prebits;
+}
+
+static inline int icc_min_bpr_ns(GICv3CPUState *cs)
+{
+    return icc_min_bpr(cs) + 1;
+}
+
+static inline int icc_num_aprs(GICv3CPUState *cs)
+{
+    /* Return the number of APR registers (1, 2, or 4) */
+    int aprmax = 1 << MAX(cs->prebits - 5, 0);
+    assert(aprmax <= ARRAY_SIZE(cs->icc_apr[0]));
+    return aprmax;
+}
+
 static int icc_highest_active_prio(GICv3CPUState *cs)
 {
     /* Calculate the current running priority based on the set bits
@@ -794,14 +824,14 @@ static int icc_highest_active_prio(GICv3CPUState *cs)
      */
     int i;
 
-    for (i = 0; i < ARRAY_SIZE(cs->icc_apr[0]); i++) {
+    for (i = 0; i < icc_num_aprs(cs); i++) {
         uint32_t apr = cs->icc_apr[GICV3_G0][i] |
             cs->icc_apr[GICV3_G1][i] | cs->icc_apr[GICV3_G1NS][i];
 
         if (!apr) {
             continue;
         }
-        return (i * 32 + ctz32(apr)) << (GIC_MIN_BPR + 1);
+        return (i * 32 + ctz32(apr)) << (icc_min_bpr(cs) + 1);
     }
     /* No current active interrupts: return idle priority */
     return 0xff;
@@ -980,7 +1010,7 @@ static void icc_pmr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     trace_gicv3_icc_pmr_write(gicv3_redist_affid(cs), value);
 
-    value &= 0xff;
+    value &= icc_fullprio_mask(cs);
 
     if (arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env) &&
         (env->cp15.scr_el3 & SCR_FIQ)) {
@@ -1004,7 +1034,7 @@ static void icc_activate_irq(GICv3CPUState *cs, int irq)
      */
     uint32_t mask = icc_gprio_mask(cs, cs->hppi.grp);
     int prio = cs->hppi.prio & mask;
-    int aprbit = prio >> 1;
+    int aprbit = prio >> (8 - cs->prebits);
     int regno = aprbit / 32;
     int regbit = aprbit % 32;
 
@@ -1162,7 +1192,7 @@ static void icc_drop_prio(GICv3CPUState *cs, int grp)
      */
     int i;
 
-    for (i = 0; i < ARRAY_SIZE(cs->icc_apr[grp]); i++) {
+    for (i = 0; i < icc_num_aprs(cs); i++) {
         uint64_t *papr = &cs->icc_apr[grp][i];
 
         if (!*papr) {
@@ -1590,7 +1620,7 @@ static void icc_bpr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         return;
     }
 
-    minval = (grp == GICV3_G1NS) ? GIC_MIN_BPR_NS : GIC_MIN_BPR;
+    minval = (grp == GICV3_G1NS) ? icc_min_bpr_ns(cs) : icc_min_bpr(cs);
     if (value < minval) {
         value = minval;
     }
@@ -2171,19 +2201,19 @@ static void icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 
     cs->icc_ctlr_el1[GICV3_S] = ICC_CTLR_EL1_A3V |
         (1 << ICC_CTLR_EL1_IDBITS_SHIFT) |
-        (7 << ICC_CTLR_EL1_PRIBITS_SHIFT);
+        ((cs->pribits - 1) << ICC_CTLR_EL1_PRIBITS_SHIFT);
     cs->icc_ctlr_el1[GICV3_NS] = ICC_CTLR_EL1_A3V |
         (1 << ICC_CTLR_EL1_IDBITS_SHIFT) |
-        (7 << ICC_CTLR_EL1_PRIBITS_SHIFT);
+        ((cs->pribits - 1) << ICC_CTLR_EL1_PRIBITS_SHIFT);
     cs->icc_pmr_el1 = 0;
-    cs->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
-    cs->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
-    cs->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR_NS;
+    cs->icc_bpr[GICV3_G0] = icc_min_bpr(cs);
+    cs->icc_bpr[GICV3_G1] = icc_min_bpr(cs);
+    cs->icc_bpr[GICV3_G1NS] = icc_min_bpr_ns(cs);
     memset(cs->icc_apr, 0, sizeof(cs->icc_apr));
     memset(cs->icc_igrpen, 0, sizeof(cs->icc_igrpen));
     cs->icc_ctlr_el3 = ICC_CTLR_EL3_NDS | ICC_CTLR_EL3_A3V |
         (1 << ICC_CTLR_EL3_IDBITS_SHIFT) |
-        (7 << ICC_CTLR_EL3_PRIBITS_SHIFT);
+        ((cs->pribits - 1) << ICC_CTLR_EL3_PRIBITS_SHIFT);
 
     memset(cs->ich_apr, 0, sizeof(cs->ich_apr));
     cs->ich_hcr_el2 = 0;
@@ -2238,27 +2268,6 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .readfn = icc_ap_read,
       .writefn = icc_ap_write,
     },
-    { .name = "ICC_AP0R1_EL1", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 5,
-      .type = ARM_CP_IO | ARM_CP_NO_RAW,
-      .access = PL1_RW, .accessfn = gicv3_fiq_access,
-      .readfn = icc_ap_read,
-      .writefn = icc_ap_write,
-    },
-    { .name = "ICC_AP0R2_EL1", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 6,
-      .type = ARM_CP_IO | ARM_CP_NO_RAW,
-      .access = PL1_RW, .accessfn = gicv3_fiq_access,
-      .readfn = icc_ap_read,
-      .writefn = icc_ap_write,
-    },
-    { .name = "ICC_AP0R3_EL1", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 7,
-      .type = ARM_CP_IO | ARM_CP_NO_RAW,
-      .access = PL1_RW, .accessfn = gicv3_fiq_access,
-      .readfn = icc_ap_read,
-      .writefn = icc_ap_write,
-    },
     /* All the ICC_AP1R*_EL1 registers are banked */
     { .name = "ICC_AP1R0_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 0,
@@ -2267,27 +2276,6 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .readfn = icc_ap_read,
       .writefn = icc_ap_write,
     },
-    { .name = "ICC_AP1R1_EL1", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 1,
-      .type = ARM_CP_IO | ARM_CP_NO_RAW,
-      .access = PL1_RW, .accessfn = gicv3_irq_access,
-      .readfn = icc_ap_read,
-      .writefn = icc_ap_write,
-    },
-    { .name = "ICC_AP1R2_EL1", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 2,
-      .type = ARM_CP_IO | ARM_CP_NO_RAW,
-      .access = PL1_RW, .accessfn = gicv3_irq_access,
-      .readfn = icc_ap_read,
-      .writefn = icc_ap_write,
-    },
-    { .name = "ICC_AP1R3_EL1", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 3,
-      .type = ARM_CP_IO | ARM_CP_NO_RAW,
-      .access = PL1_RW, .accessfn = gicv3_irq_access,
-      .readfn = icc_ap_read,
-      .writefn = icc_ap_write,
-    },
     { .name = "ICC_DIR_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 11, .opc2 = 1,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
@@ -2430,6 +2418,54 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
     },
 };
 
+static const ARMCPRegInfo gicv3_cpuif_icc_apxr1_reginfo[] = {
+    { .name = "ICC_AP0R1_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 5,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+    { .name = "ICC_AP1R1_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 1,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_irq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+};
+
+static const ARMCPRegInfo gicv3_cpuif_icc_apxr23_reginfo[] = {
+    { .name = "ICC_AP0R2_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 6,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+    { .name = "ICC_AP0R3_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 7,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+    { .name = "ICC_AP1R2_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 2,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_irq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+    { .name = "ICC_AP1R3_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 3,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_irq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+};
+
 static uint64_t ich_ap_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     GICv3CPUState *cs = icc_cs_from_env(env);
@@ -2763,6 +2799,44 @@ void gicv3_init_cpuif(GICv3State *s)
          * get back to the GICv3CPUState from the CPUARMState.
          */
         define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
+
+        /*
+         * For the moment, retain the existing behaviour of 8 priority bits;
+         * in a following commit we will take this from the CPU state,
+         * as we do for the virtual priority bits.
+         */
+        cs->pribits = 8;
+        /*
+         * The GICv3 has separate ID register fields for virtual priority
+         * and preemption bit values, but only a single ID register field
+         * for the physical priority bits. The preemption bit count is
+         * always the same as the priority bit count, except that 8 bits
+         * of priority means 7 preemption bits. We precalculate the
+         * preemption bits because it simplifies the code and makes the
+         * parallels between the virtual and physical bits of the GIC
+         * a bit clearer.
+         */
+        cs->prebits = cs->pribits;
+        if (cs->prebits == 8) {
+            cs->prebits--;
+        }
+        /*
+         * Check that CPU code defining pribits didn't violate
+         * architectural constraints our implementation relies on.
+         */
+        g_assert(cs->pribits >= 4 && cs->pribits <= 8);
+
+        /*
+         * gicv3_cpuif_reginfo[] defines ICC_AP*R0_EL1; add definitions
+         * for ICC_AP*R{1,2,3}_EL1 if the prebits value requires them.
+         */
+        if (cs->prebits >= 6) {
+            define_arm_cp_regs(cpu, gicv3_cpuif_icc_apxr1_reginfo);
+        }
+        if (cs->prebits == 7) {
+            define_arm_cp_regs(cpu, gicv3_cpuif_icc_apxr23_reginfo);
+        }
+
         if (arm_feature(&cpu->env, ARM_FEATURE_EL2)
             && cpu->gic_num_lrs) {
             int j;
-- 
2.25.1

