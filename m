Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071369wrv;
        Wed, 31 Jul 2019 13:38:38 -0700 (PDT)
X-Received: by 2002:a17:902:4643:: with SMTP id o61mr93782697pld.101.1564605518337;
        Wed, 31 Jul 2019 13:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605518; cv=none;
        d=google.com; s=arc-20160816;
        b=jJQcKpbANfRbbv9Ll/ycRtYNbYx5WDnV5N07vBlsW+1HR4bUxQlk1KwvIChmxOwuk4
         aIzJwTm8PiGSihNEo5/CgEUTdkTTpZ2XxDwq2laWea14nF9PR0UF1JbkGwyVplivgMVL
         +QvD6oDgLBXrdKhxABlTDyj7DDPrYCPKW5SWNNGOeM78qUgne0WLyO9gIBdw7nkCCyWf
         cPtx/b3eh2i7Nm7Mr4iodQ6J+pPU8rRj8AAzgocAnkhCcXDt+w6g9cyq4jk4VuDRN618
         J7qeT7DpF+g6hJ1Z++fMnx07JjpByU+AOpY0D1Dpvx4Mu8mxQ9y80d8lG72vaGOe+uzT
         vjKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=w216qTj/BYqjTL2Y/6Uaoyzbe1vK0P5jhQZ1rUoxx+c=;
        b=oRw7davosVz4E5ojRMgNdg7hjK3f+zbBjdxlEtsO9+ArIVbw9EhFKN5I4CX76P3nly
         AXt2YM1uXBdbVWwIMiYODJv/8odD5LAU8Npk7cWJrOXEOWe5hQqFB2sOC2l3qsIubdmB
         TYXfl1L9V4/zPRCkb/s+GmIgCPkhrTZnLiPc4l6C5W/iQBvEPsGddbSoUCL7T/4Q1hX7
         oIsVd5ZKiod8PLTkJyP4/d2+w+XeBhvFzWFRR1dvEu1YX1uQMcJL0m+bl1sNkX8jMYVH
         TqkznCGzsEcdGZD6Cfcns1rCa2UKb3dwA2KSjpm2BmkUq+tw1ftmwRGr2tbBs9P2eZcr
         I/FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bFowufDL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 3sor3508213pjm.3.2019.07.31.13.38.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bFowufDL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=w216qTj/BYqjTL2Y/6Uaoyzbe1vK0P5jhQZ1rUoxx+c=;
        b=bFowufDLex3H542SkfQ/bQfosy6tn/Ojv7bEXbY1EhtXRJAI0Yag/bDa1cTuPTKsUq
         LD7aOQuSu/jBfGclXdekQzO7eqIfz1wPJ91ienNMn66WTSe4irTJct2M5WXU797+Qo6Y
         i1Y8hhktqRE56EVYsqVrkmLd+BnsSWbHGqilQRWkOL9+egErfjUpPo+kOPtZM9eTGj5J
         heqdcvAU48DMFyWeHjeFHCXRd+OOBfICYus7b2ZpSoIvq8UZ20CTqxXYHZpwxY9uNEVG
         QwDzM3ZbPJxF7iL4oA6wXOtyzf7j4Fjb4qUNd+nf0dXD8onxc0rP9hLXzbQnEUSLp+/m
         +ZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=w216qTj/BYqjTL2Y/6Uaoyzbe1vK0P5jhQZ1rUoxx+c=;
        b=bx63igRCK2kvXb/VuLN4VZwlxMIwhrd2REt3kpwZNoAESoSbqrlYoqL2/xJT5QNKnv
         mGjhu2H7keGQBekoO1ARY4X9Cevv3UsVyweomhmqdpZftJ69WN9nTZYXxP7Eakb+ZhHV
         k5b6EY4axm/WzBlM7z2SfdUoTaBgdapxuyq7nNpdm+e1DVR7R6RYpN2VPErw35WqeMsX
         HwMJl4uarFNspQ63u3NttkSFqB8a2+4usfOTaETgwhFxb/Ns+yCgOgn6jWcEV3XIHqU/
         FD/T6DOpevH8ZitzBpq2E7zpCz9CCCfhzm12fMNQ4Y9KrZDdzTIBcnKS2PMCAyITITEA
         ZW+Q==
X-Gm-Message-State: APjAAAXB++wxVM4mkOu5zjt7zOit+2xMgvl/JwjFkQvk5GeDem13bzZZ
	28AI/V5NtBP/JlM0p6z9Mp0GwUMV
X-Google-Smtp-Source: APXvYqxOKj1em8qaxP4nENdgwpqNQLtSy2kyj09wLKnKozdmiiBMFB86q6HXPLNEXDoLR1HWjB0siw==
X-Received: by 2002:a17:90a:d343:: with SMTP id i3mr4902091pjx.15.1564605517824;
        Wed, 31 Jul 2019 13:38:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 18/32] target/arm: Rename ARMMMUIdx_S1SE* to ARMMMUIdx_SE*
Date: Wed, 31 Jul 2019 13:37:59 -0700
Message-Id: <20190731203813.30765-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
X-TUID: 5fZEnc6zx3Mo

This is part of a reorganization to the set of mmu_idx.
The Secure regimes all have a single stage translation;
there is no point in pointing out that the idx is for stage1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  8 ++++----
 target/arm/internals.h     |  4 ++--
 target/arm/translate.h     |  2 +-
 target/arm/helper.c        | 30 +++++++++++++++---------------
 target/arm/translate-a64.c |  4 ++--
 target/arm/translate.c     |  6 +++---
 6 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ade558f63c..c7ce8a4da5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2854,8 +2854,8 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_EL10_1 = 1 | ARM_MMU_IDX_A,
     ARMMMUIdx_S1E2 = 2 | ARM_MMU_IDX_A,
     ARMMMUIdx_S1E3 = 3 | ARM_MMU_IDX_A,
-    ARMMMUIdx_S1SE0 = 4 | ARM_MMU_IDX_A,
-    ARMMMUIdx_S1SE1 = 5 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE0 = 4 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE1 = 5 | ARM_MMU_IDX_A,
     ARMMMUIdx_Stage2 = 6 | ARM_MMU_IDX_A,
     ARMMMUIdx_MUser = 0 | ARM_MMU_IDX_M,
     ARMMMUIdx_MPriv = 1 | ARM_MMU_IDX_M,
@@ -2880,8 +2880,8 @@ typedef enum ARMMMUIdxBit {
     ARMMMUIdxBit_EL10_1 = 1 << 1,
     ARMMMUIdxBit_S1E2 = 1 << 2,
     ARMMMUIdxBit_S1E3 = 1 << 3,
-    ARMMMUIdxBit_S1SE0 = 1 << 4,
-    ARMMMUIdxBit_S1SE1 = 1 << 5,
+    ARMMMUIdxBit_SE0 = 1 << 4,
+    ARMMMUIdxBit_SE1 = 1 << 5,
     ARMMMUIdxBit_Stage2 = 1 << 6,
     ARMMMUIdxBit_MUser = 1 << 0,
     ARMMMUIdxBit_MPriv = 1 << 1,
diff --git a/target/arm/internals.h b/target/arm/internals.h
index cd9b1acb20..c505cae30c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -820,8 +820,8 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_MUser:
         return false;
     case ARMMMUIdx_S1E3:
-    case ARMMMUIdx_S1SE0:
-    case ARMMMUIdx_S1SE1:
+    case ARMMMUIdx_SE0:
+    case ARMMMUIdx_SE1:
     case ARMMMUIdx_MSPrivNegPri:
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
diff --git a/target/arm/translate.h b/target/arm/translate.h
index a20f6e2056..715fa08e3b 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -122,7 +122,7 @@ static inline int default_exception_el(DisasContext *s)
      * exceptions can only be routed to ELs above 1, so we target the higher of
      * 1 or the current EL.
      */
-    return (s->mmu_idx == ARMMMUIdx_S1SE0 && s->secure_routed_to_el3)
+    return (s->mmu_idx == ARMMMUIdx_SE0 && s->secure_routed_to_el3)
             ? 3 : MAX(1, s->current_el);
 }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4c0c314c1a..e0d4f33026 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -566,7 +566,7 @@ static void contextidr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
         switch (ri->secure) {
         case ARM_CP_SECSTATE_S:
-            idxmask = ARMMMUIdxBit_S1SE1 | ARMMMUIdxBit_S1SE0;
+            idxmask = ARMMMUIdxBit_SE1 | ARMMMUIdxBit_SE0;
             break;
         case ARM_CP_SECSTATE_NS:
             idxmask = ARMMMUIdxBit_EL10_1 | ARMMMUIdxBit_EL10_0;
@@ -3122,7 +3122,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             mmu_idx = ARMMMUIdx_Stage1_E1;
             break;
         case 1:
-            mmu_idx = secure ? ARMMMUIdx_S1SE1 : ARMMMUIdx_Stage1_E1;
+            mmu_idx = secure ? ARMMMUIdx_SE1 : ARMMMUIdx_Stage1_E1;
             break;
         default:
             g_assert_not_reached();
@@ -3132,13 +3132,13 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         /* stage 1 current state PL0: ATS1CUR, ATS1CUW */
         switch (el) {
         case 3:
-            mmu_idx = ARMMMUIdx_S1SE0;
+            mmu_idx = ARMMMUIdx_SE0;
             break;
         case 2:
             mmu_idx = ARMMMUIdx_Stage1_E0;
             break;
         case 1:
-            mmu_idx = secure ? ARMMMUIdx_S1SE0 : ARMMMUIdx_Stage1_E0;
+            mmu_idx = secure ? ARMMMUIdx_SE0 : ARMMMUIdx_Stage1_E0;
             break;
         default:
             g_assert_not_reached();
@@ -3192,7 +3192,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
     case 0:
         switch (ri->opc1) {
         case 0: /* AT S1E1R, AT S1E1W */
-            mmu_idx = secure ? ARMMMUIdx_S1SE1 : ARMMMUIdx_Stage1_E1;
+            mmu_idx = secure ? ARMMMUIdx_SE1 : ARMMMUIdx_Stage1_E1;
             break;
         case 4: /* AT S1E2R, AT S1E2W */
             mmu_idx = ARMMMUIdx_S1E2;
@@ -3205,13 +3205,13 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         break;
     case 2: /* AT S1E0R, AT S1E0W */
-        mmu_idx = secure ? ARMMMUIdx_S1SE0 : ARMMMUIdx_Stage1_E0;
+        mmu_idx = secure ? ARMMMUIdx_SE0 : ARMMMUIdx_Stage1_E0;
         break;
     case 4: /* AT S12E1R, AT S12E1W */
-        mmu_idx = secure ? ARMMMUIdx_S1SE1 : ARMMMUIdx_EL10_1;
+        mmu_idx = secure ? ARMMMUIdx_SE1 : ARMMMUIdx_EL10_1;
         break;
     case 6: /* AT S12E0R, AT S12E0W */
-        mmu_idx = secure ? ARMMMUIdx_S1SE0 : ARMMMUIdx_EL10_0;
+        mmu_idx = secure ? ARMMMUIdx_SE0 : ARMMMUIdx_EL10_0;
         break;
     default:
         g_assert_not_reached();
@@ -3424,7 +3424,7 @@ static void update_lpae_el1_asid(CPUARMState *env, int secure)
         ttcr = env->cp15.tcr_el[3].raw_tcr;
         /* Note that cp15.ttbr0_s == cp15.ttbr0_el[3], so S1E3 is affected.  */
         /* ??? Secure EL3 really using the ASID field?  Doesn't make sense.  */
-        idxmask = ARMMMUIdxBit_S1SE1 | ARMMMUIdxBit_S1SE0 | ARMMMUIdxBit_S1E3;
+        idxmask = ARMMMUIdxBit_SE1 | ARMMMUIdxBit_SE0 | ARMMMUIdxBit_S1E3;
         break;
     case ARM_CP_SECSTATE_NS:
         ttbr0 = env->cp15.ttbr0_ns;
@@ -3899,7 +3899,7 @@ static CPAccessResult aa64_cacheop_access(CPUARMState *env,
 static int vae1_tlbmask(CPUARMState *env)
 {
     if (arm_is_secure_below_el3(env)) {
-        return ARMMMUIdxBit_S1SE1 | ARMMMUIdxBit_S1SE0;
+        return ARMMMUIdxBit_SE1 | ARMMMUIdxBit_SE0;
     } else {
         return ARMMMUIdxBit_EL10_1 | ARMMMUIdxBit_EL10_0;
     }
@@ -3935,7 +3935,7 @@ static int vmalle1_tlbmask(CPUARMState *env)
      * stage 1 translations.
      */
     if (arm_is_secure_below_el3(env)) {
-        return ARMMMUIdxBit_S1SE1 | ARMMMUIdxBit_S1SE0;
+        return ARMMMUIdxBit_SE1 | ARMMMUIdxBit_SE0;
     } else if (arm_feature(env, ARM_FEATURE_EL2)) {
         return ARMMMUIdxBit_EL10_1 | ARMMMUIdxBit_EL10_0 | ARMMMUIdxBit_Stage2;
     } else {
@@ -8695,9 +8695,9 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
         return 2;
     case ARMMMUIdx_S1E3:
         return 3;
-    case ARMMMUIdx_S1SE0:
+    case ARMMMUIdx_SE0:
         return arm_el_is_aa64(env, 3) ? 1 : 3;
-    case ARMMMUIdx_S1SE1:
+    case ARMMMUIdx_SE1:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_MPrivNegPri:
@@ -8836,7 +8836,7 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
 static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
-    case ARMMMUIdx_S1SE0:
+    case ARMMMUIdx_SE0:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MSUser:
@@ -11279,7 +11279,7 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
 
     el = arm_current_el(env);
     if (el < 2 && arm_is_secure_below_el3(env)) {
-        return ARMMMUIdx_S1SE0 + el;
+        return ARMMMUIdx_SE0 + el;
     } else {
         return ARMMMUIdx_EL10_0 + el;
     }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 73801c5df7..dbe2189e51 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -116,8 +116,8 @@ static inline int get_a64_user_mem_index(DisasContext *s)
     case ARMMMUIdx_EL10_1:
         useridx = ARMMMUIdx_EL10_0;
         break;
-    case ARMMMUIdx_S1SE1:
-        useridx = ARMMMUIdx_S1SE0;
+    case ARMMMUIdx_SE1:
+        useridx = ARMMMUIdx_SE0;
         break;
     case ARMMMUIdx_Stage2:
         g_assert_not_reached();
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 995010834f..1fc2bf8a52 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -157,9 +157,9 @@ static inline int get_a32_user_mem_index(DisasContext *s)
     case ARMMMUIdx_EL10_1:
         return arm_to_core_mmu_idx(ARMMMUIdx_EL10_0);
     case ARMMMUIdx_S1E3:
-    case ARMMMUIdx_S1SE0:
-    case ARMMMUIdx_S1SE1:
-        return arm_to_core_mmu_idx(ARMMMUIdx_S1SE0);
+    case ARMMMUIdx_SE0:
+    case ARMMMUIdx_SE1:
+        return arm_to_core_mmu_idx(ARMMMUIdx_SE0);
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MPriv:
         return arm_to_core_mmu_idx(ARMMMUIdx_MUser);
-- 
2.17.1
