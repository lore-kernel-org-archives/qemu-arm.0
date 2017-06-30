Received: by 10.25.227.6 with SMTP id a6csp5638384lfh;
        Fri, 30 Jun 2017 06:45:06 -0700 (PDT)
X-Received: by 10.25.234.6 with SMTP id i6mr8401977lfh.42.1498830306355;
        Fri, 30 Jun 2017 06:45:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498830306; cv=none;
        d=google.com; s=arc-20160816;
        b=daJaR9ZZ5rZmLYF4VQ9MI0An9AhY6ZtXdn14iHGGgGDkxBQK14cHQ6EmC+NjA4Dq34
         pB9gCvz0XsowPBPfqoMnGYCIpIfrEzzhFtlmpmKwYIMAa78UcDQk+cC3N9exwH+6aFJl
         cXA3WQXHpsH1QXq9EwlHnd/sP/PnzqI4p64JuDLot1OA1wKJQOxJCgSxRooMSbR4w3pQ
         1D0hVmxvv/K86Biw7Wnx3WiU3ZrK427oXROprTH6LdRCoSZ8wQwzgbZ6zER7XcbL9Dr1
         BPPfrbfnv4bQ+evaOfzvjFUfwXxbtYrPi87X9KAzTZM9LxpHTrcYnDHDc38Gg/+eiwjK
         VPvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:arc-authentication-results;
        bh=ZIrNi69GSmgTCE1BDm591BaIaZ7IfIndaBwRH1LnK20=;
        b=jcBQdZQxsqxTBksQ233528mNXAzqsmBzGYoCmqeqAtosCQG6r3b3/qgXjZ7RfGBZ7j
         4G9hzfTqgd3ZopMgF42gD7r+IdTGRfXWPJ76zxQiGrmkrSrFMYlawENE3zZmSxVF5vUs
         EqXPBNKYXVOhbtm7rxKfBY/vgqEOWmWHmCk7GHW/Gbd2DnfUbM+oUPrgAjSMri1rrjvS
         5qg3vzth14PZvYRPG/kUC8qnbMHl0/e41fd/Zx/wSzguWjR0++AOPtQ1Zkax/F9NgDu9
         tIV7BI+4LwIZb4GvS6V6UX3Eg4X66LYjX6sNVfpie0V67YbojUcwiiPHi+CRBMlNRzMa
         PS3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=tqleLHTn;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:4010:c07::243 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com. [2a00:1450:4010:c07::243])
        by mx.google.com with ESMTPS id 23si3826202lja.180.2017.06.30.06.45.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Jun 2017 06:45:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:4010:c07::243 as permitted sender) client-ip=2a00:1450:4010:c07::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=tqleLHTn;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:4010:c07::243 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x243.google.com with SMTP id g21so10121681lfk.1;
        Fri, 30 Jun 2017 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZIrNi69GSmgTCE1BDm591BaIaZ7IfIndaBwRH1LnK20=;
        b=tqleLHTn2xW2m7tFt10nmpInBmrc7LwfraBHt3s+x17N4PN3GPZJoePq9Ef5xmUzn1
         8AWHB0fmf21AAa2shf8N3By9gzyiX/oe/imkFoUVo0dIG5NR3RMzM7AmFNcSM/sx/Xtc
         G5EpXKo1gNaVjM02tDMiX7gwBH54txNf7v5WhtYxMAXdLJxz0X/2JnZPOlkC4FWOH1sV
         MUnJG+tW3xdc2/FrAVxX26H5BgQuVMEpuW0ubwf+002jKkbjKutautFnevjS7F/U9gsy
         Og0CcCeIXm5OEvd6BzrVfuCRIcZ1x6fLfXL15ILIBXNa3PHd6eCBBH3r9uE0+0O4dh2t
         C+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZIrNi69GSmgTCE1BDm591BaIaZ7IfIndaBwRH1LnK20=;
        b=PYpJNkUM5jxRKtgUQFJDFecbprrvbc2Qj99LJnu88jG0xwxUlNPjp+kfY1Fj5ULwv+
         Qs1zjwMjIivNWOFqfi0bJosYWWim4YgqrBtLhn7dUC+nwQ8nJFEvmKgQ81iwRVee87t+
         /AFcgBq0a+Rl6ipFikQQdlXux3r0Omtl0KPstOYVJt6qHrNL1XawuKOLh1IS4kUIc1gT
         bQM6OFyOePEnzGZN/5OWWegzKT67zU/iEQc3K9LhmFlynYMFwsBYTbmSoK5K3uGcsiJp
         N4e6UU9BSrsXWlLjUxs+RPfeEdAmxLHnNR4OXzzeBujuNq8xfp3h3qmX5JzLLAHIZYMH
         7OzA==
X-Gm-Message-State: AKS2vOxZem1U0B+H2PlRbX4JaSX1FY/ukcSWZScs0Mc5oUMDWB3HJIFr
	U440nOJ6R9qwTQ==
X-Received: by 10.25.15.221 with SMTP id 90mr6668001lfp.10.1498830305901;
        Fri, 30 Jun 2017 06:45:05 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id x11sm1424602ljd.5.2017.06.30.06.45.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Jun 2017 06:45:04 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 1/2] target-arm: Move the regime_xxx helpers
Date: Fri, 30 Jun 2017 15:45:01 +0200
Message-Id: <1498830302-19274-2-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com>
References: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: y6ucMCd7Oij0

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Move the regime_xxx helpers in preparation for future code
that will reuse them.

No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/helper.c | 404 ++++++++++++++++++++++++++--------------------------
 1 file changed, 202 insertions(+), 202 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2594faa..fd1027e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -35,6 +35,208 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
 #define PMCRD   0x8
 #define PMCRC   0x4
 #define PMCRE   0x1
+
+/* Return the exception level which controls this address translation regime */
+static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_S2NS:
+    case ARMMMUIdx_S1E2:
+        return 2;
+    case ARMMMUIdx_S1E3:
+        return 3;
+    case ARMMMUIdx_S1SE0:
+        return arm_el_is_aa64(env, 3) ? 1 : 3;
+    case ARMMMUIdx_S1SE1:
+    case ARMMMUIdx_S1NSE0:
+    case ARMMMUIdx_S1NSE1:
+    case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MNegPri:
+    case ARMMMUIdx_MUser:
+        return 1;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/* Return true if this address translation regime is secure */
+static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_S12NSE0:
+    case ARMMMUIdx_S12NSE1:
+    case ARMMMUIdx_S1NSE0:
+    case ARMMMUIdx_S1NSE1:
+    case ARMMMUIdx_S1E2:
+    case ARMMMUIdx_S2NS:
+    case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MNegPri:
+    case ARMMMUIdx_MUser:
+        return false;
+    case ARMMMUIdx_S1E3:
+    case ARMMMUIdx_S1SE0:
+    case ARMMMUIdx_S1SE1:
+        return true;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/* Return the SCTLR value which controls this address translation regime */
+static inline uint32_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    return env->cp15.sctlr_el[regime_el(env, mmu_idx)];
+}
+
+/* Return true if the specified stage of address translation is disabled */
+static inline bool regime_translation_disabled(CPUARMState *env,
+                                               ARMMMUIdx mmu_idx)
+{
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        switch (env->v7m.mpu_ctrl &
+                (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
+        case R_V7M_MPU_CTRL_ENABLE_MASK:
+            /* Enabled, but not for HardFault and NMI */
+            return mmu_idx == ARMMMUIdx_MNegPri;
+        case R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK:
+            /* Enabled for all cases */
+            return false;
+        case 0:
+        default:
+            /* HFNMIENA set and ENABLE clear is UNPREDICTABLE, but
+             * we warned about that in armv7m_nvic.c when the guest set it.
+             */
+            return true;
+        }
+    }
+
+    if (mmu_idx == ARMMMUIdx_S2NS) {
+        return (env->cp15.hcr_el2 & HCR_VM) == 0;
+    }
+    return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
+}
+
+static inline bool regime_translation_big_endian(CPUARMState *env,
+                                                 ARMMMUIdx mmu_idx)
+{
+    return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
+}
+
+/* Return the TCR controlling this translation regime */
+static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    if (mmu_idx == ARMMMUIdx_S2NS) {
+        return &env->cp15.vtcr_el2;
+    }
+    return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
+}
+
+/* Convert a possible stage1+2 MMU index into the appropriate
+ * stage 1 MMU index
+ */
+static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
+{
+    if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
+        mmu_idx += (ARMMMUIdx_S1NSE0 - ARMMMUIdx_S12NSE0);
+    }
+    return mmu_idx;
+}
+
+/* Returns TBI0 value for current regime el */
+uint32_t arm_regime_tbi0(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    TCR *tcr;
+    uint32_t el;
+
+    /* For EL0 and EL1, TBI is controlled by stage 1's TCR, so convert
+     * a stage 1+2 mmu index into the appropriate stage 1 mmu index.
+     */
+    mmu_idx = stage_1_mmu_idx(mmu_idx);
+
+    tcr = regime_tcr(env, mmu_idx);
+    el = regime_el(env, mmu_idx);
+
+    if (el > 1) {
+        return extract64(tcr->raw_tcr, 20, 1);
+    } else {
+        return extract64(tcr->raw_tcr, 37, 1);
+    }
+}
+
+/* Returns TBI1 value for current regime el */
+uint32_t arm_regime_tbi1(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    TCR *tcr;
+    uint32_t el;
+
+    /* For EL0 and EL1, TBI is controlled by stage 1's TCR, so convert
+     * a stage 1+2 mmu index into the appropriate stage 1 mmu index.
+     */
+    mmu_idx = stage_1_mmu_idx(mmu_idx);
+
+    tcr = regime_tcr(env, mmu_idx);
+    el = regime_el(env, mmu_idx);
+
+    if (el > 1) {
+        return 0;
+    } else {
+        return extract64(tcr->raw_tcr, 38, 1);
+    }
+}
+
+/* Return the TTBR associated with this translation regime */
+static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
+                                   int ttbrn)
+{
+    if (mmu_idx == ARMMMUIdx_S2NS) {
+        return env->cp15.vttbr_el2;
+    }
+    if (ttbrn == 0) {
+        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
+    } else {
+        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
+    }
+}
+
+/* Return true if the translation regime is using LPAE format page tables */
+static bool regime_using_lpae_format(CPUARMState *env,
+                                     ARMMMUIdx mmu_idx)
+{
+    int el = regime_el(env, mmu_idx);
+    if (el == 2 || arm_el_is_aa64(env, el)) {
+        return true;
+    }
+    if (arm_feature(env, ARM_FEATURE_LPAE)
+        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
+        return true;
+    }
+    return false;
+}
+
+/* Returns true if the stage 1 translation regime is using LPAE format page
+ * tables. Used when raising alignment exceptions, whose FSR changes depending
+ * on whether the long or short descriptor format is in use. */
+bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    mmu_idx = stage_1_mmu_idx(mmu_idx);
+
+    return regime_using_lpae_format(env, mmu_idx);
+}
+
+static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_S1SE0:
+    case ARMMMUIdx_S1NSE0:
+    case ARMMMUIdx_MUser:
+        return true;
+    default:
+        return false;
+    case ARMMMUIdx_S12NSE0:
+    case ARMMMUIdx_S12NSE1:
+        g_assert_not_reached();
+    }
+}
 #endif
 
 static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
@@ -7022,208 +7224,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
     }
 }
 
-/* Return the exception level which controls this address translation regime */
-static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_S2NS:
-    case ARMMMUIdx_S1E2:
-        return 2;
-    case ARMMMUIdx_S1E3:
-        return 3;
-    case ARMMMUIdx_S1SE0:
-        return arm_el_is_aa64(env, 3) ? 1 : 3;
-    case ARMMMUIdx_S1SE1:
-    case ARMMMUIdx_S1NSE0:
-    case ARMMMUIdx_S1NSE1:
-    case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MNegPri:
-    case ARMMMUIdx_MUser:
-        return 1;
-    default:
-        g_assert_not_reached();
-    }
-}
-
-/* Return true if this address translation regime is secure */
-static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_S12NSE0:
-    case ARMMMUIdx_S12NSE1:
-    case ARMMMUIdx_S1NSE0:
-    case ARMMMUIdx_S1NSE1:
-    case ARMMMUIdx_S1E2:
-    case ARMMMUIdx_S2NS:
-    case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MNegPri:
-    case ARMMMUIdx_MUser:
-        return false;
-    case ARMMMUIdx_S1E3:
-    case ARMMMUIdx_S1SE0:
-    case ARMMMUIdx_S1SE1:
-        return true;
-    default:
-        g_assert_not_reached();
-    }
-}
-
-/* Return the SCTLR value which controls this address translation regime */
-static inline uint32_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    return env->cp15.sctlr_el[regime_el(env, mmu_idx)];
-}
-
-/* Return true if the specified stage of address translation is disabled */
-static inline bool regime_translation_disabled(CPUARMState *env,
-                                               ARMMMUIdx mmu_idx)
-{
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        switch (env->v7m.mpu_ctrl &
-                (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
-        case R_V7M_MPU_CTRL_ENABLE_MASK:
-            /* Enabled, but not for HardFault and NMI */
-            return mmu_idx == ARMMMUIdx_MNegPri;
-        case R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK:
-            /* Enabled for all cases */
-            return false;
-        case 0:
-        default:
-            /* HFNMIENA set and ENABLE clear is UNPREDICTABLE, but
-             * we warned about that in armv7m_nvic.c when the guest set it.
-             */
-            return true;
-        }
-    }
-
-    if (mmu_idx == ARMMMUIdx_S2NS) {
-        return (env->cp15.hcr_el2 & HCR_VM) == 0;
-    }
-    return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
-}
-
-static inline bool regime_translation_big_endian(CPUARMState *env,
-                                                 ARMMMUIdx mmu_idx)
-{
-    return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
-}
-
-/* Return the TCR controlling this translation regime */
-static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    if (mmu_idx == ARMMMUIdx_S2NS) {
-        return &env->cp15.vtcr_el2;
-    }
-    return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
-}
-
-/* Convert a possible stage1+2 MMU index into the appropriate
- * stage 1 MMU index
- */
-static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
-{
-    if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
-        mmu_idx += (ARMMMUIdx_S1NSE0 - ARMMMUIdx_S12NSE0);
-    }
-    return mmu_idx;
-}
-
-/* Returns TBI0 value for current regime el */
-uint32_t arm_regime_tbi0(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    TCR *tcr;
-    uint32_t el;
-
-    /* For EL0 and EL1, TBI is controlled by stage 1's TCR, so convert
-     * a stage 1+2 mmu index into the appropriate stage 1 mmu index.
-     */
-    mmu_idx = stage_1_mmu_idx(mmu_idx);
-
-    tcr = regime_tcr(env, mmu_idx);
-    el = regime_el(env, mmu_idx);
-
-    if (el > 1) {
-        return extract64(tcr->raw_tcr, 20, 1);
-    } else {
-        return extract64(tcr->raw_tcr, 37, 1);
-    }
-}
-
-/* Returns TBI1 value for current regime el */
-uint32_t arm_regime_tbi1(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    TCR *tcr;
-    uint32_t el;
-
-    /* For EL0 and EL1, TBI is controlled by stage 1's TCR, so convert
-     * a stage 1+2 mmu index into the appropriate stage 1 mmu index.
-     */
-    mmu_idx = stage_1_mmu_idx(mmu_idx);
-
-    tcr = regime_tcr(env, mmu_idx);
-    el = regime_el(env, mmu_idx);
-
-    if (el > 1) {
-        return 0;
-    } else {
-        return extract64(tcr->raw_tcr, 38, 1);
-    }
-}
-
-/* Return the TTBR associated with this translation regime */
-static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
-                                   int ttbrn)
-{
-    if (mmu_idx == ARMMMUIdx_S2NS) {
-        return env->cp15.vttbr_el2;
-    }
-    if (ttbrn == 0) {
-        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
-    } else {
-        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
-    }
-}
-
-/* Return true if the translation regime is using LPAE format page tables */
-static inline bool regime_using_lpae_format(CPUARMState *env,
-                                            ARMMMUIdx mmu_idx)
-{
-    int el = regime_el(env, mmu_idx);
-    if (el == 2 || arm_el_is_aa64(env, el)) {
-        return true;
-    }
-    if (arm_feature(env, ARM_FEATURE_LPAE)
-        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
-        return true;
-    }
-    return false;
-}
-
-/* Returns true if the stage 1 translation regime is using LPAE format page
- * tables. Used when raising alignment exceptions, whose FSR changes depending
- * on whether the long or short descriptor format is in use. */
-bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    mmu_idx = stage_1_mmu_idx(mmu_idx);
-
-    return regime_using_lpae_format(env, mmu_idx);
-}
-
-static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_S1SE0:
-    case ARMMMUIdx_S1NSE0:
-    case ARMMMUIdx_MUser:
-        return true;
-    default:
-        return false;
-    case ARMMMUIdx_S12NSE0:
-    case ARMMMUIdx_S12NSE1:
-        g_assert_not_reached();
-    }
-}
-
 /* Translate section/page access permissions to page
  * R/W protection flags
  *
-- 
2.7.4
