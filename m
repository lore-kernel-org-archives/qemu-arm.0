Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071340wrv;
        Wed, 31 Jul 2019 13:38:35 -0700 (PDT)
X-Received: by 2002:a63:6f41:: with SMTP id k62mr69636698pgc.32.1564605514602;
        Wed, 31 Jul 2019 13:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605514; cv=none;
        d=google.com; s=arc-20160816;
        b=MTL4s6BjNdLMnvzm34kUMbldJ0CfZF/3q3NoK4eQawp0TaC4XvjqSO1BenQnxpGkft
         yiY7KxJ5/uPeNa3ntC8LhEtGV7H6YUJzS6+n1VCIw1QHyK32hs0lZUAscHF3pTusMqG3
         HVdArPwnvjnVpqISmPewpJ2NwXPX7xU6fTXhq/eaB6DWUuwN8raykUguxJRi0ycsneRG
         jIrE3z8si2FCe5G1GvmpozobxdxLQIp4EAZVXRz4FUEUTn4P+Q1KFEtCl+ipjgwhFVkF
         KXSksHojT5uTX8DVx7mpiWJEM8et6dq918orZjIKngz7RbdGIiRJ/6kbu4y8iChjZaoH
         uC5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=L2jEAM4PPhyK6Ibom5dDULaexJ8i3bjGCqHj/DqEM+k=;
        b=jIPoDhM8+g97M8Pbah2vKm3q6jS1EwGQH7yR1LhGnsMIktYbFAbG2kCuuiKom2aFkf
         eZ0vB5dZpDF9qAAkBpyrd5cd3+q1QWeOBGbOxR/g6D2KqzpIxvRKM2e8k9SLbjhvXK6w
         xTHJpLpDZobJ5K2fr0nSG6gs6iXmHdrkatcmSNFYRouG1mtmI5R5LKvkjuDxwm3TBpTP
         xohyfrJqJE9OHvBqjLLsTAXfwImHwwxWCgbGFgVOEyBDmcCksebmIk47fF5+fNjAevS2
         gSmyqFpiTrQ/Jb76MLsiLVBxNBubgQh1A7ncZ4BGRClnMVP7eeaZgO/j5cLo9IpQPUHM
         MrsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pFPGzUv+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q8sor40189951pgn.1.2019.07.31.13.38.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pFPGzUv+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=L2jEAM4PPhyK6Ibom5dDULaexJ8i3bjGCqHj/DqEM+k=;
        b=pFPGzUv+XpANzatykHte2BoXPFvKqdZkkCtKFkJHInAgFxspNEeoqlnC1WTfaISoaI
         r15bsxeyPvZhxRaK8XXvgCljrPe/hXx9cnkKMjEF5Xah5pjbXudPNfnTxNR/u2AumuhG
         3Ws81xMxJdKSlwnVh6JS3X8f3pwWe6+seUFuJlVGon8tO7w0gix8LDAYcBexbgUs39sU
         ctGILn0k3uXH6RqqHAHPDeg45LSEUREe9zRcPnAMVvzujxulRQ5DuEzWGuQrvICyB8RO
         sC5ZhvSHZxGwkSPoZlYpgUTMxTFHJNmLJBNI9l40DLbwO48uijlwPU0XO1v6yy0xoA/P
         dz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=L2jEAM4PPhyK6Ibom5dDULaexJ8i3bjGCqHj/DqEM+k=;
        b=F49l7CpzaNDoy0dL+ELU9hQrasbYqNQgy6WZRYDnuJBtoj/2HfmYsTsW2cqJHgLovu
         j+yjLrStG+mBUOdudErGUQbEbKzantlTn1vp8I894zmfcL8Tj5Rcaqz0Fayb4tzxd7hy
         4Isnzm/vhXymk/d/7zcfcGVmp0QogvDRnYAbPfPnYSzjgo6AhFJ2nGv+MQk30kkdyNOx
         tq6IUsG4RgcYBKDRIEH0UXeUKd8+e3SPiE2Ybunybir/aQGuVc6SvNeD2K4WrIvAVEsc
         x4II1pJxrdHcl4mpnTNu/POO/w/KbdAd9zy7frSUAAfa23RavMXLg8tXbYo9l+B8wy37
         YWWA==
X-Gm-Message-State: APjAAAUdy6aurm5I80EONvzNH9fhI5iGpS573JCptIFYFbb2i3WMRPBz
	O7DoaujBZdbjY6OxwnMgCLP7PMN6
X-Google-Smtp-Source: APXvYqwy3qjG7qVc+THMwNXFSkYPloTym7x+ameh4Re0ehIKFdw1/EZ4X43ITo+LMoHPseSBnScxgA==
X-Received: by 2002:a63:fd57:: with SMTP id m23mr50313122pgj.204.1564605514021;
        Wed, 31 Jul 2019 13:38:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 15/32] target/arm: Rename ARMMMUIdx*_S12NSE* to ARMMMUIdx*_E10_*
Date: Wed, 31 Jul 2019 13:37:56 -0700
Message-Id: <20190731203813.30765-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
X-TUID: QvP5jl9kDmxB

This is part of a reorganization to the set of mmu_idx.
This emphasizes that they apply to the EL1&0 regime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  8 +++----
 target/arm/internals.h     |  4 ++--
 target/arm/helper.c        | 44 +++++++++++++++++++-------------------
 target/arm/translate-a64.c |  4 ++--
 target/arm/translate.c     |  6 +++---
 5 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a0f10b60eb..8a3f61bc2c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2850,8 +2850,8 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
 #define ARM_MMU_IDX_COREIDX_MASK 0x7
 
 typedef enum ARMMMUIdx {
-    ARMMMUIdx_S12NSE0 = 0 | ARM_MMU_IDX_A,
-    ARMMMUIdx_S12NSE1 = 1 | ARM_MMU_IDX_A,
+    ARMMMUIdx_EL10_0 = 0 | ARM_MMU_IDX_A,
+    ARMMMUIdx_EL10_1 = 1 | ARM_MMU_IDX_A,
     ARMMMUIdx_S1E2 = 2 | ARM_MMU_IDX_A,
     ARMMMUIdx_S1E3 = 3 | ARM_MMU_IDX_A,
     ARMMMUIdx_S1SE0 = 4 | ARM_MMU_IDX_A,
@@ -2876,8 +2876,8 @@ typedef enum ARMMMUIdx {
  * for use when calling tlb_flush_by_mmuidx() and friends.
  */
 typedef enum ARMMMUIdxBit {
-    ARMMMUIdxBit_S12NSE0 = 1 << 0,
-    ARMMMUIdxBit_S12NSE1 = 1 << 1,
+    ARMMMUIdxBit_EL10_0 = 1 << 0,
+    ARMMMUIdxBit_EL10_1 = 1 << 1,
     ARMMMUIdxBit_S1E2 = 1 << 2,
     ARMMMUIdxBit_S1E3 = 1 << 3,
     ARMMMUIdxBit_S1SE0 = 1 << 4,
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 232d963875..fafefdc59e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -808,8 +808,8 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
 static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
-    case ARMMMUIdx_S12NSE0:
-    case ARMMMUIdx_S12NSE1:
+    case ARMMMUIdx_EL10_0:
+    case ARMMMUIdx_EL10_1:
     case ARMMMUIdx_S1NSE0:
     case ARMMMUIdx_S1NSE1:
     case ARMMMUIdx_S1E2:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 185f5e4aea..e391654638 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -569,7 +569,7 @@ static void contextidr_write(CPUARMState *env, const ARMCPRegInfo *ri,
             idxmask = ARMMMUIdxBit_S1SE1 | ARMMMUIdxBit_S1SE0;
             break;
         case ARM_CP_SECSTATE_NS:
-            idxmask = ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0;
+            idxmask = ARMMMUIdxBit_EL10_1 | ARMMMUIdxBit_EL10_0;
             break;
         default:
             g_assert_not_reached();
@@ -682,8 +682,8 @@ static void tlbiall_nsnh_write(CPUARMState *env, const ARMCPRegInfo *ri,
     CPUState *cs = env_cpu(env);
 
     tlb_flush_by_mmuidx(cs,
-                        ARMMMUIdxBit_S12NSE1 |
-                        ARMMMUIdxBit_S12NSE0 |
+                        ARMMMUIdxBit_EL10_1 |
+                        ARMMMUIdxBit_EL10_0 |
                         ARMMMUIdxBit_S2NS);
 }
 
@@ -693,8 +693,8 @@ static void tlbiall_nsnh_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     CPUState *cs = env_cpu(env);
 
     tlb_flush_by_mmuidx_all_cpus_synced(cs,
-                                        ARMMMUIdxBit_S12NSE1 |
-                                        ARMMMUIdxBit_S12NSE0 |
+                                        ARMMMUIdxBit_EL10_1 |
+                                        ARMMMUIdxBit_EL10_0 |
                                         ARMMMUIdxBit_S2NS);
 }
 
@@ -3047,7 +3047,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
         format64 = arm_s1_regime_using_lpae_format(env, mmu_idx);
 
         if (arm_feature(env, ARM_FEATURE_EL2)) {
-            if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
+            if (mmu_idx == ARMMMUIdx_EL10_0 || mmu_idx == ARMMMUIdx_EL10_1) {
                 format64 |= env->cp15.hcr_el2 & (HCR_VM | HCR_DC);
             } else {
                 format64 |= arm_current_el(env) == 2;
@@ -3146,11 +3146,11 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         break;
     case 4:
         /* stage 1+2 NonSecure PL1: ATS12NSOPR, ATS12NSOPW */
-        mmu_idx = ARMMMUIdx_S12NSE1;
+        mmu_idx = ARMMMUIdx_EL10_1;
         break;
     case 6:
         /* stage 1+2 NonSecure PL0: ATS12NSOUR, ATS12NSOUW */
-        mmu_idx = ARMMMUIdx_S12NSE0;
+        mmu_idx = ARMMMUIdx_EL10_0;
         break;
     default:
         g_assert_not_reached();
@@ -3208,10 +3208,10 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         mmu_idx = secure ? ARMMMUIdx_S1SE0 : ARMMMUIdx_S1NSE0;
         break;
     case 4: /* AT S12E1R, AT S12E1W */
-        mmu_idx = secure ? ARMMMUIdx_S1SE1 : ARMMMUIdx_S12NSE1;
+        mmu_idx = secure ? ARMMMUIdx_S1SE1 : ARMMMUIdx_EL10_1;
         break;
     case 6: /* AT S12E0R, AT S12E0W */
-        mmu_idx = secure ? ARMMMUIdx_S1SE0 : ARMMMUIdx_S12NSE0;
+        mmu_idx = secure ? ARMMMUIdx_S1SE0 : ARMMMUIdx_EL10_0;
         break;
     default:
         g_assert_not_reached();
@@ -3430,7 +3430,7 @@ static void update_lpae_el1_asid(CPUARMState *env, int secure)
         ttbr0 = env->cp15.ttbr0_ns;
         ttbr1 = env->cp15.ttbr1_ns;
         ttcr = env->cp15.tcr_el[1].raw_tcr;
-        idxmask = ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0;
+        idxmask = ARMMMUIdxBit_EL10_1 | ARMMMUIdxBit_EL10_0;
         break;
     default:
         g_assert_not_reached();
@@ -3540,10 +3540,10 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     /*
      * A change in VMID to the stage2 page table (S2NS) invalidates
-     * the combined stage 1&2 tlbs (S12NSE1 and S12NSE0).
+     * the combined stage 1&2 tlbs (EL10_1 and EL10_0).
      */
     tlb_set_asid_for_mmuidx(cs, vmid, ARMMMUIdxBit_S2NS,
-                            ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0);
+                            ARMMMUIdxBit_EL10_1 | ARMMMUIdxBit_EL10_0);
 }
 
 static const ARMCPRegInfo vmsa_pmsa_cp_reginfo[] = {
@@ -3901,7 +3901,7 @@ static int vae1_tlbmask(CPUARMState *env)
     if (arm_is_secure_below_el3(env)) {
         return ARMMMUIdxBit_S1SE1 | ARMMMUIdxBit_S1SE0;
     } else {
-        return ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0;
+        return ARMMMUIdxBit_EL10_1 | ARMMMUIdxBit_EL10_0;
     }
 }
 
@@ -3937,9 +3937,9 @@ static int vmalle1_tlbmask(CPUARMState *env)
     if (arm_is_secure_below_el3(env)) {
         return ARMMMUIdxBit_S1SE1 | ARMMMUIdxBit_S1SE0;
     } else if (arm_feature(env, ARM_FEATURE_EL2)) {
-        return ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0 | ARMMMUIdxBit_S2NS;
+        return ARMMMUIdxBit_EL10_1 | ARMMMUIdxBit_EL10_0 | ARMMMUIdxBit_S2NS;
     } else {
-        return ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0;
+        return ARMMMUIdxBit_EL10_1 | ARMMMUIdxBit_EL10_0;
     }
 }
 
@@ -8801,8 +8801,8 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
  */
 static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 {
-    if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
-        mmu_idx += (ARMMMUIdx_S1NSE0 - ARMMMUIdx_S12NSE0);
+    if (mmu_idx == ARMMMUIdx_EL10_0 || mmu_idx == ARMMMUIdx_EL10_1) {
+        mmu_idx += (ARMMMUIdx_S1NSE0 - ARMMMUIdx_EL10_0);
     }
     return mmu_idx;
 }
@@ -8845,8 +8845,8 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
         return true;
     default:
         return false;
-    case ARMMMUIdx_S12NSE0:
-    case ARMMMUIdx_S12NSE1:
+    case ARMMMUIdx_EL10_0:
+    case ARMMMUIdx_EL10_1:
         g_assert_not_reached();
     }
 }
@@ -10750,7 +10750,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    target_ulong *page_size,
                    ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
-    if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
+    if (mmu_idx == ARMMMUIdx_EL10_0 || mmu_idx == ARMMMUIdx_EL10_1) {
         /* Call ourselves recursively to do the stage 1 and then stage 2
          * translations.
          */
@@ -11281,7 +11281,7 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     if (el < 2 && arm_is_secure_below_el3(env)) {
         return ARMMMUIdx_S1SE0 + el;
     } else {
-        return ARMMMUIdx_S12NSE0 + el;
+        return ARMMMUIdx_EL10_0 + el;
     }
 }
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d3231477a2..ece749fe03 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -113,8 +113,8 @@ static inline int get_a64_user_mem_index(DisasContext *s)
     ARMMMUIdx useridx;
 
     switch (s->mmu_idx) {
-    case ARMMMUIdx_S12NSE1:
-        useridx = ARMMMUIdx_S12NSE0;
+    case ARMMMUIdx_EL10_1:
+        useridx = ARMMMUIdx_EL10_0;
         break;
     case ARMMMUIdx_S1SE1:
         useridx = ARMMMUIdx_S1SE0;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7853462b21..afff595726 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -153,9 +153,9 @@ static inline int get_a32_user_mem_index(DisasContext *s)
      */
     switch (s->mmu_idx) {
     case ARMMMUIdx_S1E2:        /* this one is UNPREDICTABLE */
-    case ARMMMUIdx_S12NSE0:
-    case ARMMMUIdx_S12NSE1:
-        return arm_to_core_mmu_idx(ARMMMUIdx_S12NSE0);
+    case ARMMMUIdx_EL10_0:
+    case ARMMMUIdx_EL10_1:
+        return arm_to_core_mmu_idx(ARMMMUIdx_EL10_0);
     case ARMMMUIdx_S1E3:
     case ARMMMUIdx_S1SE0:
     case ARMMMUIdx_S1SE1:
-- 
2.17.1
