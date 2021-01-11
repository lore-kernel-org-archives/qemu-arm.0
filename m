Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2917556lfq;
        Mon, 11 Jan 2021 11:02:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9foYvM+tLtknbw9n/oBGjii+44MDvNrjYCiRnmOYr/L98q3sAOVdMrglMq6QidNZy65li
X-Received: by 2002:a25:b3c7:: with SMTP id x7mr1617777ybf.235.1610391723051;
        Mon, 11 Jan 2021 11:02:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610391723; cv=none;
        d=google.com; s=arc-20160816;
        b=XJyCkXVfi9xBe1v5VAFmQxwFqP4Hr519kZurJtw3/Kpk2U4fmgG7kgn13V1GaBkwFF
         r3L9o6UXrRUvE6y9PsBFb8+uJz3f8C108fh9Mh0AhoWocOwQClH1qJzhJW2iw6Vfvtvw
         f/EdHGmymhK3WU++fA1OGa45Q+yUXlXfJ30fhD0IeN+vhLPZi3SNHFCkLRivIK+kNxRW
         LkSwGQUNOD5GMZ82xHgStG7pbCAfb8lMEBlwyUR8wtcIKQzBwdAY283d7IX30LG9R50l
         zK4+/lnu4+Zi4H7k9QmbdVZtZye3w6+c+nSsgZYg8RPgwi6n8EArJ1LdKMCXGRHHaJCA
         w6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=De5nYIi0fzT6bB7B3n3IhJbRiZ6qrmEQ5nHTXg1fEtg=;
        b=0Y/R0JZ+cLmFvdOsucBJv729mvFlOilXz0vNFnEKYeDdPIoXUrarfFFR5A8+OSmtNX
         dOXF1O628UkEJ2vVj2lCD6Smgmt8+V7YpzsOQXBuZ5+qUCzUaUhuVDowTxUHNjpoY9IO
         CoAqGGt1eyvrbllIawEz6mn/44ugQEaWYqUkvCYg45MK5UsWmvyu5RXV+fYl2i9W309B
         SqQEBqV6vLz6tP57oZATecq1AZ6z3nTV3hBhM3g8TC69reMS0Q/AoGrDujUBeKujFTCn
         Nsv9NndN7H7om0b2zlEXXV3r6ku3dREKrt+pn9vyF1spCBcIsVGk5LjXkqhcjsR2kRcv
         Q/6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tqdtLgPz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r188si667611ybf.378.2021.01.11.11.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:02:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tqdtLgPz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2S2-0005ql-A5
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RT-0005mL-IS
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:27 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RQ-0006Nn-Kt
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:27 -0500
Received: by mail-pj1-x102c.google.com with SMTP id u4so98584pjn.4
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 11:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=De5nYIi0fzT6bB7B3n3IhJbRiZ6qrmEQ5nHTXg1fEtg=;
 b=tqdtLgPzQQC+G30aO8MPUXdn6qwav7ojNzSCmDVsKi0yO5lERyEyjcIQ3wn237Rs7+
 PF2bBQJfdaqtgwkBPKqn1XnSKR4L4zF4cnj+Xvr20f14oxfAsjJcwntEmX/DaiIRlkmE
 EXJR7Wp0dt6RPGA2B3AtrRhPBdkJpX192xDoz+W0uC4eK1/1HWRKi3thFrVxQzqTtcdF
 5vgzk8hPAncebAmgjW+EfwbHjcpFikm53zrhnwpKvV0oDqKmopIMyFQPPXsUbAZaIftV
 2A6M3IztNgtzuHi1yQ2OetAGW2KMuSwbv9tGBXlsM50d3XFT7jy18du41dBIW9Jmm0v3
 uFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=De5nYIi0fzT6bB7B3n3IhJbRiZ6qrmEQ5nHTXg1fEtg=;
 b=nP0qZAM0c72QVhaVvOwuuZtJW0zNT5Ad5bqdE8aXrf1HpdDMc3rK+fLYD1xNYYP2mo
 PHnahnNZfyWlSvImAYlMmhbr0G8xccOV8F7UyLpJdeX7F5erMDaL05ymrtEKepqLLPt3
 m6I2EHOQIulWI3Xl8y53htIfpH+WsTW425vfA5wt1SkUmLUA9lHdWZZF+WHECMtqkwLU
 M7dY25qx3mP3OanXu1/ToHzBNvEhgBODzI+woxWb7Af0fn6u3ZMnrYWrbDpcyIO5Ig61
 ArHnUg8mRW+MqOZMWmjGhdLCF3uI5liwuGxgGTvCRG2/lW0o6OQUO9mUUBGgrDpc3fTr
 G/Eg==
X-Gm-Message-State: AOAM5303MyvncMZ2ts/f1+WjrIFsNCNiafkMQI1GH2O4ywZFhNiqGFsa
 JRIn4+uFh+IL+PEtNg6lUWijrA==
X-Received: by 2002:a17:90a:c82:: with SMTP id v2mr263353pja.171.1610391683111; 
 Mon, 11 Jan 2021 11:01:23 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/30] target/arm: Add wrapper macros for accessing tbflags
Date: Mon, 11 Jan 2021 09:00:47 -1000
Message-Id: <20210111190113.303726-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oscngW+7AeF7

We're about to split tbflags into two parts.  These macros
will ensure that the correct part is used with the correct
set of bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 22 +++++++++-
 target/arm/helper-a64.c    |  2 +-
 target/arm/helper.c        | 85 +++++++++++++++++---------------------
 target/arm/translate-a64.c | 36 ++++++++--------
 target/arm/translate.c     | 48 ++++++++++-----------
 5 files changed, 101 insertions(+), 92 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 89d69cbcd1..894266ef02 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3332,6 +3332,26 @@ FIELD(TBFLAG_A64, TCMA, 16, 2)
 FIELD(TBFLAG_A64, MTE_ACTIVE, 18, 1)
 FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
 
+/*
+ * Helpers for using the above.
+ */
+#define DP_TBFLAG_ANY(DST, WHICH, VAL) \
+    (DST = FIELD_DP32(DST, TBFLAG_ANY, WHICH, VAL))
+#define DP_TBFLAG_A64(DST, WHICH, VAL) \
+    (DST = FIELD_DP32(DST, TBFLAG_A64, WHICH, VAL))
+#define DP_TBFLAG_A32(DST, WHICH, VAL) \
+    (DST = FIELD_DP32(DST, TBFLAG_A32, WHICH, VAL))
+#define DP_TBFLAG_M32(DST, WHICH, VAL) \
+    (DST = FIELD_DP32(DST, TBFLAG_M32, WHICH, VAL))
+#define DP_TBFLAG_AM32(DST, WHICH, VAL) \
+    (DST = FIELD_DP32(DST, TBFLAG_AM32, WHICH, VAL))
+
+#define EX_TBFLAG_ANY(IN, WHICH)   FIELD_EX32(IN, TBFLAG_ANY, WHICH)
+#define EX_TBFLAG_A64(IN, WHICH)   FIELD_EX32(IN, TBFLAG_A64, WHICH)
+#define EX_TBFLAG_A32(IN, WHICH)   FIELD_EX32(IN, TBFLAG_A32, WHICH)
+#define EX_TBFLAG_M32(IN, WHICH)   FIELD_EX32(IN, TBFLAG_M32, WHICH)
+#define EX_TBFLAG_AM32(IN, WHICH)  FIELD_EX32(IN, TBFLAG_AM32, WHICH)
+
 /**
  * cpu_mmu_index:
  * @env: The cpu environment
@@ -3342,7 +3362,7 @@ FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
  */
 static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
 {
-    return FIELD_EX32(env->hflags, TBFLAG_ANY, MMUIDX);
+    return EX_TBFLAG_ANY(env->hflags, MMUIDX);
 }
 
 static inline bool bswap_code(bool sctlr_b)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 30b2ad119f..7a7a06b3b7 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1039,7 +1039,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
          * the hflags rebuild, since we can pull the composite TBII field
          * from there.
          */
-        tbii = FIELD_EX32(env->hflags, TBFLAG_A64, TBII);
+        tbii = EX_TBFLAG_A64(env->hflags, TBII);
         if ((tbii >> extract64(new_pc, 55, 1)) & 1) {
             /* TBI is enabled. */
             int core_mmu_idx = cpu_mmu_index(env, false);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7a7e4c3ad4..76bb306f26 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12746,12 +12746,11 @@ ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
                                       ARMMMUIdx mmu_idx, uint32_t flags)
 {
-    flags = FIELD_DP32(flags, TBFLAG_ANY, FPEXC_EL, fp_el);
-    flags = FIELD_DP32(flags, TBFLAG_ANY, MMUIDX,
-                       arm_to_core_mmu_idx(mmu_idx));
+    DP_TBFLAG_ANY(flags, FPEXC_EL, fp_el);
+    DP_TBFLAG_ANY(flags, MMUIDX, arm_to_core_mmu_idx(mmu_idx));
 
     if (arm_singlestep_active(env)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, SS_ACTIVE, 1);
+        DP_TBFLAG_ANY(flags, SS_ACTIVE, 1);
     }
     return flags;
 }
@@ -12762,12 +12761,12 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
     bool sctlr_b = arm_sctlr_b(env);
 
     if (sctlr_b) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR__B, 1);
+        DP_TBFLAG_A32(flags, SCTLR__B, 1);
     }
     if (arm_cpu_data_is_big_endian_a32(env, sctlr_b)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
+        DP_TBFLAG_ANY(flags, BE_DATA, 1);
     }
-    flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
+    DP_TBFLAG_A32(flags, NS, !access_secure_reg(env));
 
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
@@ -12778,7 +12777,7 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
     uint32_t flags = 0;
 
     if (arm_v7m_is_handler_mode(env)) {
-        flags = FIELD_DP32(flags, TBFLAG_M32, HANDLER, 1);
+        DP_TBFLAG_M32(flags, HANDLER, 1);
     }
 
     /*
@@ -12789,7 +12788,7 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
     if (arm_feature(env, ARM_FEATURE_V8) &&
         !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
           (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
-        flags = FIELD_DP32(flags, TBFLAG_M32, STACKCHECK, 1);
+        DP_TBFLAG_M32(flags, STACKCHECK, 1);
     }
 
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
@@ -12799,8 +12798,7 @@ static uint32_t rebuild_hflags_aprofile(CPUARMState *env)
 {
     int flags = 0;
 
-    flags = FIELD_DP32(flags, TBFLAG_ANY, DEBUG_TARGET_EL,
-                       arm_debug_target_el(env));
+    DP_TBFLAG_ANY(flags, DEBUG_TARGET_EL, arm_debug_target_el(env));
     return flags;
 }
 
@@ -12810,12 +12808,12 @@ static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
     uint32_t flags = rebuild_hflags_aprofile(env);
 
     if (arm_el_is_aa64(env, 1)) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
+        DP_TBFLAG_A32(flags, VFPEN, 1);
     }
 
     if (arm_current_el(env) < 2 && env->cp15.hstr_el2 &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, HSTR_ACTIVE, 1);
+        DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
     }
 
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
@@ -12830,14 +12828,14 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     uint64_t sctlr;
     int tbii, tbid;
 
-    flags = FIELD_DP32(flags, TBFLAG_ANY, AARCH64_STATE, 1);
+    DP_TBFLAG_ANY(flags, AARCH64_STATE, 1);
 
     /* Get control bits for tagged addresses.  */
     tbid = aa64_va_parameter_tbi(tcr, mmu_idx);
     tbii = tbid & ~aa64_va_parameter_tbid(tcr, mmu_idx);
 
-    flags = FIELD_DP32(flags, TBFLAG_A64, TBII, tbii);
-    flags = FIELD_DP32(flags, TBFLAG_A64, TBID, tbid);
+    DP_TBFLAG_A64(flags, TBII, tbii);
+    DP_TBFLAG_A64(flags, TBID, tbid);
 
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
         int sve_el = sve_exception_el(env, el);
@@ -12852,14 +12850,14 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         } else {
             zcr_len = sve_zcr_len_for_el(env, el);
         }
-        flags = FIELD_DP32(flags, TBFLAG_A64, SVEEXC_EL, sve_el);
-        flags = FIELD_DP32(flags, TBFLAG_A64, ZCR_LEN, zcr_len);
+        DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
+        DP_TBFLAG_A64(flags, ZCR_LEN, zcr_len);
     }
 
     sctlr = regime_sctlr(env, stage1);
 
     if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
+        DP_TBFLAG_ANY(flags, BE_DATA, 1);
     }
 
     if (cpu_isar_feature(aa64_pauth, env_archcpu(env))) {
@@ -12870,14 +12868,14 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
          * The decision of which action to take is left to a helper.
          */
         if (sctlr & (SCTLR_EnIA | SCTLR_EnIB | SCTLR_EnDA | SCTLR_EnDB)) {
-            flags = FIELD_DP32(flags, TBFLAG_A64, PAUTH_ACTIVE, 1);
+            DP_TBFLAG_A64(flags, PAUTH_ACTIVE, 1);
         }
     }
 
     if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
         /* Note that SCTLR_EL[23].BT == SCTLR_BT1.  */
         if (sctlr & (el == 0 ? SCTLR_BT0 : SCTLR_BT1)) {
-            flags = FIELD_DP32(flags, TBFLAG_A64, BT, 1);
+            DP_TBFLAG_A64(flags, BT, 1);
         }
     }
 
@@ -12889,7 +12887,7 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         case ARMMMUIdx_SE10_1:
         case ARMMMUIdx_SE10_1_PAN:
             /* TODO: ARMv8.3-NV */
-            flags = FIELD_DP32(flags, TBFLAG_A64, UNPRIV, 1);
+            DP_TBFLAG_A64(flags, UNPRIV, 1);
             break;
         case ARMMMUIdx_E20_2:
         case ARMMMUIdx_E20_2_PAN:
@@ -12899,7 +12897,7 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
              * gated by HCR_EL2.<E2H,TGE> == '11', and so is LDTR.
              */
             if (env->cp15.hcr_el2 & HCR_TGE) {
-                flags = FIELD_DP32(flags, TBFLAG_A64, UNPRIV, 1);
+                DP_TBFLAG_A64(flags, UNPRIV, 1);
             }
             break;
         default:
@@ -12917,24 +12915,23 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
          * 4) If no Allocation Tag Access, then all accesses are Unchecked.
          */
         if (allocation_tag_access_enabled(env, el, sctlr)) {
-            flags = FIELD_DP32(flags, TBFLAG_A64, ATA, 1);
+            DP_TBFLAG_A64(flags, ATA, 1);
             if (tbid
                 && !(env->pstate & PSTATE_TCO)
                 && (sctlr & (el == 0 ? SCTLR_TCF0 : SCTLR_TCF))) {
-                flags = FIELD_DP32(flags, TBFLAG_A64, MTE_ACTIVE, 1);
+                DP_TBFLAG_A64(flags, MTE_ACTIVE, 1);
             }
         }
         /* And again for unprivileged accesses, if required.  */
-        if (FIELD_EX32(flags, TBFLAG_A64, UNPRIV)
+        if (EX_TBFLAG_A64(flags, UNPRIV)
             && tbid
             && !(env->pstate & PSTATE_TCO)
             && (sctlr & SCTLR_TCF)
             && allocation_tag_access_enabled(env, 0, sctlr)) {
-            flags = FIELD_DP32(flags, TBFLAG_A64, MTE0_ACTIVE, 1);
+            DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
         }
         /* Cache TCMA as well as TBI. */
-        flags = FIELD_DP32(flags, TBFLAG_A64, TCMA,
-                           aa64_va_parameter_tcma(tcr, mmu_idx));
+        DP_TBFLAG_A64(flags, TCMA, aa64_va_parameter_tcma(tcr, mmu_idx));
     }
 
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
@@ -13031,10 +13028,10 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     *cs_base = 0;
     assert_hflags_rebuild_correctly(env);
 
-    if (FIELD_EX32(flags, TBFLAG_ANY, AARCH64_STATE)) {
+    if (EX_TBFLAG_ANY(flags, AARCH64_STATE)) {
         *pc = env->pc;
         if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
-            flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
+            DP_TBFLAG_A64(flags, BTYPE, env->btype);
         }
         pstate_for_ss = env->pstate;
     } else {
@@ -13044,7 +13041,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
                 FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S)
                 != env->v7m.secure) {
-                flags = FIELD_DP32(flags, TBFLAG_M32, FPCCR_S_WRONG, 1);
+                DP_TBFLAG_M32(flags, FPCCR_S_WRONG, 1);
             }
 
             if ((env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MASK) &&
@@ -13056,12 +13053,12 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                  * active FP context; we must create a new FP context before
                  * executing any FP insn.
                  */
-                flags = FIELD_DP32(flags, TBFLAG_M32, NEW_FP_CTXT_NEEDED, 1);
+                DP_TBFLAG_M32(flags, NEW_FP_CTXT_NEEDED, 1);
             }
 
             bool is_secure = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
             if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
-                flags = FIELD_DP32(flags, TBFLAG_M32, LSPACT, 1);
+                DP_TBFLAG_M32(flags, LSPACT, 1);
             }
         } else {
             /*
@@ -13069,21 +13066,18 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
              * Note that VECLEN+VECSTRIDE are RES0 for M-profile.
              */
             if (arm_feature(env, ARM_FEATURE_XSCALE)) {
-                flags = FIELD_DP32(flags, TBFLAG_A32,
-                                   XSCALE_CPAR, env->cp15.c15_cpar);
+                DP_TBFLAG_A32(flags, XSCALE_CPAR, env->cp15.c15_cpar);
             } else {
-                flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN,
-                                   env->vfp.vec_len);
-                flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE,
-                                   env->vfp.vec_stride);
+                DP_TBFLAG_A32(flags, VECLEN, env->vfp.vec_len);
+                DP_TBFLAG_A32(flags, VECSTRIDE, env->vfp.vec_stride);
             }
             if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)) {
-                flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
+                DP_TBFLAG_A32(flags, VFPEN, 1);
             }
         }
 
-        flags = FIELD_DP32(flags, TBFLAG_AM32, THUMB, env->thumb);
-        flags = FIELD_DP32(flags, TBFLAG_AM32, CONDEXEC, env->condexec_bits);
+        DP_TBFLAG_AM32(flags, THUMB, env->thumb);
+        DP_TBFLAG_AM32(flags, CONDEXEC, env->condexec_bits);
         pstate_for_ss = env->uncached_cpsr;
     }
 
@@ -13096,9 +13090,8 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
      *     1            1       Active-not-pending
      * SS_ACTIVE is set in hflags; PSTATE__SS is computed every TB.
      */
-    if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE) &&
-        (pstate_for_ss & PSTATE_SS)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE__SS, 1);
+    if (EX_TBFLAG_ANY(flags, SS_ACTIVE) && (pstate_for_ss & PSTATE_SS)) {
+        DP_TBFLAG_ANY(flags, PSTATE__SS, 1);
     }
 
     *pflags = flags;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 80a3a5f5fb..c260fc573d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14699,28 +14699,28 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
                                !arm_el_is_aa64(env, 3);
     dc->thumb = 0;
     dc->sctlr_b = 0;
-    dc->be_data = FIELD_EX32(tb_flags, TBFLAG_ANY, BE_DATA) ? MO_BE : MO_LE;
+    dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
     dc->condexec_mask = 0;
     dc->condexec_cond = 0;
-    core_mmu_idx = FIELD_EX32(tb_flags, TBFLAG_ANY, MMUIDX);
+    core_mmu_idx = EX_TBFLAG_ANY(tb_flags, MMUIDX);
     dc->mmu_idx = core_to_aa64_mmu_idx(core_mmu_idx);
-    dc->tbii = FIELD_EX32(tb_flags, TBFLAG_A64, TBII);
-    dc->tbid = FIELD_EX32(tb_flags, TBFLAG_A64, TBID);
-    dc->tcma = FIELD_EX32(tb_flags, TBFLAG_A64, TCMA);
+    dc->tbii = EX_TBFLAG_A64(tb_flags, TBII);
+    dc->tbid = EX_TBFLAG_A64(tb_flags, TBID);
+    dc->tcma = EX_TBFLAG_A64(tb_flags, TCMA);
     dc->current_el = arm_mmu_idx_to_el(dc->mmu_idx);
 #if !defined(CONFIG_USER_ONLY)
     dc->user = (dc->current_el == 0);
 #endif
-    dc->fp_excp_el = FIELD_EX32(tb_flags, TBFLAG_ANY, FPEXC_EL);
-    dc->sve_excp_el = FIELD_EX32(tb_flags, TBFLAG_A64, SVEEXC_EL);
-    dc->sve_len = (FIELD_EX32(tb_flags, TBFLAG_A64, ZCR_LEN) + 1) * 16;
-    dc->pauth_active = FIELD_EX32(tb_flags, TBFLAG_A64, PAUTH_ACTIVE);
-    dc->bt = FIELD_EX32(tb_flags, TBFLAG_A64, BT);
-    dc->btype = FIELD_EX32(tb_flags, TBFLAG_A64, BTYPE);
-    dc->unpriv = FIELD_EX32(tb_flags, TBFLAG_A64, UNPRIV);
-    dc->ata = FIELD_EX32(tb_flags, TBFLAG_A64, ATA);
-    dc->mte_active[0] = FIELD_EX32(tb_flags, TBFLAG_A64, MTE_ACTIVE);
-    dc->mte_active[1] = FIELD_EX32(tb_flags, TBFLAG_A64, MTE0_ACTIVE);
+    dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
+    dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
+    dc->sve_len = (EX_TBFLAG_A64(tb_flags, ZCR_LEN) + 1) * 16;
+    dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
+    dc->bt = EX_TBFLAG_A64(tb_flags, BT);
+    dc->btype = EX_TBFLAG_A64(tb_flags, BTYPE);
+    dc->unpriv = EX_TBFLAG_A64(tb_flags, UNPRIV);
+    dc->ata = EX_TBFLAG_A64(tb_flags, ATA);
+    dc->mte_active[0] = EX_TBFLAG_A64(tb_flags, MTE_ACTIVE);
+    dc->mte_active[1] = EX_TBFLAG_A64(tb_flags, MTE0_ACTIVE);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
@@ -14747,10 +14747,10 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
      *   emit code to generate a software step exception
      *   end the TB
      */
-    dc->ss_active = FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
-    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE__SS);
+    dc->ss_active = EX_TBFLAG_ANY(tb_flags, SS_ACTIVE);
+    dc->pstate_ss = EX_TBFLAG_ANY(tb_flags, PSTATE__SS);
     dc->is_ldex = false;
-    dc->debug_target_el = FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
+    dc->debug_target_el = EX_TBFLAG_ANY(tb_flags, DEBUG_TARGET_EL);
 
     /* Bound the number of insns to execute to those left on the page.  */
     bound = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 67d509d29c..87ba22d1b6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8811,46 +8811,42 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
      */
     dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
                                !arm_el_is_aa64(env, 3);
-    dc->thumb = FIELD_EX32(tb_flags, TBFLAG_AM32, THUMB);
-    dc->be_data = FIELD_EX32(tb_flags, TBFLAG_ANY, BE_DATA) ? MO_BE : MO_LE;
-    condexec = FIELD_EX32(tb_flags, TBFLAG_AM32, CONDEXEC);
+    dc->thumb = EX_TBFLAG_AM32(tb_flags, THUMB);
+    dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
+    condexec = EX_TBFLAG_AM32(tb_flags, CONDEXEC);
     dc->condexec_mask = (condexec & 0xf) << 1;
     dc->condexec_cond = condexec >> 4;
 
-    core_mmu_idx = FIELD_EX32(tb_flags, TBFLAG_ANY, MMUIDX);
+    core_mmu_idx = EX_TBFLAG_ANY(tb_flags, MMUIDX);
     dc->mmu_idx = core_to_arm_mmu_idx(env, core_mmu_idx);
     dc->current_el = arm_mmu_idx_to_el(dc->mmu_idx);
 #if !defined(CONFIG_USER_ONLY)
     dc->user = (dc->current_el == 0);
 #endif
-    dc->fp_excp_el = FIELD_EX32(tb_flags, TBFLAG_ANY, FPEXC_EL);
+    dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
         dc->be_data = MO_TE;
-        dc->v7m_handler_mode = FIELD_EX32(tb_flags, TBFLAG_M32, HANDLER);
+        dc->v7m_handler_mode = EX_TBFLAG_M32(tb_flags, HANDLER);
         dc->v8m_secure = arm_feature(env, ARM_FEATURE_M_SECURITY) &&
             regime_is_secure(env, dc->mmu_idx);
-        dc->v8m_stackcheck = FIELD_EX32(tb_flags, TBFLAG_M32, STACKCHECK);
-        dc->v8m_fpccr_s_wrong =
-            FIELD_EX32(tb_flags, TBFLAG_M32, FPCCR_S_WRONG);
+        dc->v8m_stackcheck = EX_TBFLAG_M32(tb_flags, STACKCHECK);
+        dc->v8m_fpccr_s_wrong = EX_TBFLAG_M32(tb_flags, FPCCR_S_WRONG);
         dc->v7m_new_fp_ctxt_needed =
-            FIELD_EX32(tb_flags, TBFLAG_M32, NEW_FP_CTXT_NEEDED);
-        dc->v7m_lspact = FIELD_EX32(tb_flags, TBFLAG_M32, LSPACT);
+            EX_TBFLAG_M32(tb_flags, NEW_FP_CTXT_NEEDED);
+        dc->v7m_lspact = EX_TBFLAG_M32(tb_flags, LSPACT);
     } else {
-        dc->be_data =
-            FIELD_EX32(tb_flags, TBFLAG_ANY, BE_DATA) ? MO_BE : MO_LE;
-        dc->debug_target_el =
-            FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
-        dc->sctlr_b = FIELD_EX32(tb_flags, TBFLAG_A32, SCTLR__B);
-        dc->hstr_active = FIELD_EX32(tb_flags, TBFLAG_A32, HSTR_ACTIVE);
-        dc->ns = FIELD_EX32(tb_flags, TBFLAG_A32, NS);
-        dc->vfp_enabled = FIELD_EX32(tb_flags, TBFLAG_A32, VFPEN);
+        dc->debug_target_el = EX_TBFLAG_ANY(tb_flags, DEBUG_TARGET_EL);
+        dc->sctlr_b = EX_TBFLAG_A32(tb_flags, SCTLR__B);
+        dc->hstr_active = EX_TBFLAG_A32(tb_flags, HSTR_ACTIVE);
+        dc->ns = EX_TBFLAG_A32(tb_flags, NS);
+        dc->vfp_enabled = EX_TBFLAG_A32(tb_flags, VFPEN);
         if (arm_feature(env, ARM_FEATURE_XSCALE)) {
-            dc->c15_cpar = FIELD_EX32(tb_flags, TBFLAG_A32, XSCALE_CPAR);
+            dc->c15_cpar = EX_TBFLAG_A32(tb_flags, XSCALE_CPAR);
         } else {
-            dc->vec_len = FIELD_EX32(tb_flags, TBFLAG_A32, VECLEN);
-            dc->vec_stride = FIELD_EX32(tb_flags, TBFLAG_A32, VECSTRIDE);
+            dc->vec_len = EX_TBFLAG_A32(tb_flags, VECLEN);
+            dc->vec_stride = EX_TBFLAG_A32(tb_flags, VECSTRIDE);
         }
     }
     dc->cp_regs = cpu->cp_regs;
@@ -8871,8 +8867,8 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
      *   emit code to generate a software step exception
      *   end the TB
      */
-    dc->ss_active = FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
-    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE__SS);
+    dc->ss_active = EX_TBFLAG_ANY(tb_flags, SS_ACTIVE);
+    dc->pstate_ss = EX_TBFLAG_ANY(tb_flags, PSTATE__SS);
     dc->is_ldex = false;
 
     dc->page_start = dc->base.pc_first & TARGET_PAGE_MASK;
@@ -9316,11 +9312,11 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns)
     DisasContext dc = { };
     const TranslatorOps *ops = &arm_translator_ops;
 
-    if (FIELD_EX32(tb->flags, TBFLAG_AM32, THUMB)) {
+    if (EX_TBFLAG_AM32(tb->flags, THUMB)) {
         ops = &thumb_translator_ops;
     }
 #ifdef TARGET_AARCH64
-    if (FIELD_EX32(tb->flags, TBFLAG_ANY, AARCH64_STATE)) {
+    if (EX_TBFLAG_ANY(tb->flags, AARCH64_STATE)) {
         ops = &aarch64_translator_ops;
     }
 #endif
-- 
2.25.1

