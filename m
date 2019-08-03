Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201061wrv;
        Sat, 3 Aug 2019 11:48:27 -0700 (PDT)
X-Received: by 2002:a17:90a:71ca:: with SMTP id m10mr10622131pjs.27.1564858107053;
        Sat, 03 Aug 2019 11:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858107; cv=none;
        d=google.com; s=arc-20160816;
        b=m3eNjqWB1RD12atVaIs4a2LxC9YkiETbSG56EAYus6kn70fEP2Dtw084KuoYs2erY9
         Z6jOBI1kxfqFD+5wFf9SAipItI2+rsJIJgfa7PSxsQhYnyZ0xivQf40VbsrQ8QNCYl+3
         1XvU2HQ8ab73MZPgyLiu0OtRhU7kvZErRyUXlHaElNriyhnMaTQnpN0tq9AY1eLM+BbZ
         DhyDUs8tHkSDCMrVrJnLz05t93bmokXlC52JABJJgFheD7U4ME2EBX1h5NRslmfIdORy
         +i2fACmRZPgISP/wJTIVFQPlFX9QikbQDOwZAXqFmRi6g/phoq4SixfTkVkzuAGzOex1
         LWow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=trlNGPogxXBK9OHHkWCBGsx/W/Lwzy6lbLUgzLGbb4A=;
        b=BeNJIEVqz31Zt9qwuk+HMGZjQQ7RGv3H2rbF1XA21lSzbKSpYCF67whrKtAdPcBopc
         /QOBlzL9i36xgWct+nwUUiLuMCu8IAvnnFmkfjchC+Z/c0NrzNS+ZTfMdfDgdh1wg2hP
         b3kEyB+hoTyindCZz2hNH+hx70GxfFHSrL+hRYzSA85vLc3ZRSPG0iVILCz7SzAwSEMX
         0mOfGHdorPCL72XLdHHa82DYO26HGlTgVH4AerMlJKN9jVFXVJRK9lU30Dk4GyrAvLHf
         j25Lw0eu80n5BLX/mhNuWglXXsilEcz5yTwqMG1JJwydbBQZzv+HnxU/uAPn0qEHcCXo
         W1Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=odxwR9Yi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 3sor14901456pjm.3.2019.08.03.11.48.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=odxwR9Yi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=trlNGPogxXBK9OHHkWCBGsx/W/Lwzy6lbLUgzLGbb4A=;
        b=odxwR9YiZlmrGzO7nK5x0AhHcuzhht7jcq0WhlNQQ435GlTLBD9THl+3O3xN+t3S8l
         Mjjl/Bpa3Y4ktoiHXlSVFsy3PY0tO931k7fbIopPIMSHjy37h3SnI/17cNUE7gy/eEWO
         BlLJR4LbROSaNtbY5CsUzRCofyePk6lM2zUIL9XeFQn/AiKmOOiO2O4UMnBgs09iUfJ2
         74P6x64vngm09vFVL+36Y9sY9LtwuQIcqpG1MEzzJ2XQb9J+Q7utHiXIT/1VVam0WTxE
         bzKp9eTr0Kw8211EBtHNGuaNfxPHQYJvyL6LVsDJYSTXsscLU+8sM6gKGkpL2flczyrT
         1LsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=trlNGPogxXBK9OHHkWCBGsx/W/Lwzy6lbLUgzLGbb4A=;
        b=A8EqProEAxbI0aR5mU9XtwtmC7/e4Fjb6g2gX5q7Jqxxxwmud8n71pK7IG8GltiVny
         gR94F3bEQWGrWwIG32hg/wLKUa1Igq4ITEc6y7mWyx7eyhDCwI8eH6S/a/WyJXKAeB7Q
         ZU7DS5fCee6v1Iitbl0J50WWFeTnyIfonzjM5jFcnic14TY1okQ6lyhr53dBceYK9cLe
         RUd98lyfD8TkS2tcvakORmpsZhHTzXm7ugHV2RSUWLCX1f7CpL36pvi032v9BcfUPdik
         nQCWruT+E2u7OiQFuohGOj1UrKpHXK0GLh/tUQNpwOi+oT590lOsusfBhhU82Qxg/pUc
         1EQg==
X-Gm-Message-State: APjAAAVm0zzTuiYzQVTpxU6Beol3Iyixap68EbuyzO81YrFET/mg5Coy
	A5hkAbY/uBerzuL662aWVKoN2WZr
X-Google-Smtp-Source: APXvYqwxM/3UARKqJskI/oXr22WO4XWVPXzu0+asKskhLocWoSn3I8aNeHIIKljsCveP5ntCq+C9qQ==
X-Received: by 2002:a17:90a:9a95:: with SMTP id e21mr10190086pjp.98.1564858106593;
        Sat, 03 Aug 2019 11:48:26 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 20/34] target/arm: Rename ARMMMUIdx_S1E2 to ARMMMUIdx_E2
Date: Sat,  3 Aug 2019 11:47:46 -0700
Message-Id: <20190803184800.8221-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-TUID: n2GeRAvjCS+H

This is part of a reorganization to the set of mmu_idx.
The non-secure EL2 regime only has a single stage translation;
there is no point in pointing out that the idx is for stage1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |  4 ++--
 target/arm/internals.h |  2 +-
 target/arm/helper.c    | 24 ++++++++++++------------
 target/arm/translate.c |  2 +-
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 94337b2fb0..552269daad 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2852,7 +2852,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
 typedef enum ARMMMUIdx {
     ARMMMUIdx_EL10_0 = 0 | ARM_MMU_IDX_A,
     ARMMMUIdx_EL10_1 = 1 | ARM_MMU_IDX_A,
-    ARMMMUIdx_S1E2 = 2 | ARM_MMU_IDX_A,
+    ARMMMUIdx_E2 = 2 | ARM_MMU_IDX_A,
     ARMMMUIdx_SE3 = 3 | ARM_MMU_IDX_A,
     ARMMMUIdx_SE0 = 4 | ARM_MMU_IDX_A,
     ARMMMUIdx_SE1 = 5 | ARM_MMU_IDX_A,
@@ -2878,7 +2878,7 @@ typedef enum ARMMMUIdx {
 typedef enum ARMMMUIdxBit {
     ARMMMUIdxBit_EL10_0 = 1 << 0,
     ARMMMUIdxBit_EL10_1 = 1 << 1,
-    ARMMMUIdxBit_S1E2 = 1 << 2,
+    ARMMMUIdxBit_E2 = 1 << 2,
     ARMMMUIdxBit_SE3 = 1 << 3,
     ARMMMUIdxBit_SE0 = 1 << 4,
     ARMMMUIdxBit_SE1 = 1 << 5,
diff --git a/target/arm/internals.h b/target/arm/internals.h
index dbb46da549..027878516f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -812,7 +812,7 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_EL10_1:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
-    case ARMMMUIdx_S1E2:
+    case ARMMMUIdx_E2:
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e5b07b4770..69c913d824 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -740,7 +740,7 @@ static void tlbiall_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
 
-    tlb_flush_by_mmuidx(cs, ARMMMUIdxBit_S1E2);
+    tlb_flush_by_mmuidx(cs, ARMMMUIdxBit_E2);
 }
 
 static void tlbiall_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -748,7 +748,7 @@ static void tlbiall_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
 
-    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_S1E2);
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_E2);
 }
 
 static void tlbimva_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -757,7 +757,7 @@ static void tlbimva_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
     CPUState *cs = env_cpu(env);
     uint64_t pageaddr = value & ~MAKE_64BIT_MASK(0, 12);
 
-    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_S1E2);
+    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_E2);
 }
 
 static void tlbimva_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -767,7 +767,7 @@ static void tlbimva_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     uint64_t pageaddr = value & ~MAKE_64BIT_MASK(0, 12);
 
     tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                             ARMMMUIdxBit_S1E2);
+                                             ARMMMUIdxBit_E2);
 }
 
 static const ARMCPRegInfo cp_reginfo[] = {
@@ -3167,7 +3167,7 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
     MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     uint64_t par64;
 
-    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_S1E2);
+    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_E2);
 
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
 }
@@ -3195,7 +3195,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
             mmu_idx = secure ? ARMMMUIdx_SE1 : ARMMMUIdx_Stage1_E1;
             break;
         case 4: /* AT S1E2R, AT S1E2W */
-            mmu_idx = ARMMMUIdx_S1E2;
+            mmu_idx = ARMMMUIdx_E2;
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_SE3;
@@ -3958,7 +3958,7 @@ static void tlbi_aa64_alle2_write(CPUARMState *env, const ARMCPRegInfo *ri,
     ARMCPU *cpu = env_archcpu(env);
     CPUState *cs = CPU(cpu);
 
-    tlb_flush_by_mmuidx(cs, ARMMMUIdxBit_S1E2);
+    tlb_flush_by_mmuidx(cs, ARMMMUIdxBit_E2);
 }
 
 static void tlbi_aa64_alle3_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3984,7 +3984,7 @@ static void tlbi_aa64_alle2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
 
-    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_S1E2);
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_E2);
 }
 
 static void tlbi_aa64_alle3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4006,7 +4006,7 @@ static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
     CPUState *cs = CPU(cpu);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
-    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_S1E2);
+    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_E2);
 }
 
 static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4059,7 +4059,7 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
     tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                             ARMMMUIdxBit_S1E2);
+                                             ARMMMUIdxBit_E2);
 }
 
 static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4375,7 +4375,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "AT_S12E0W", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 7, .crm = 8, .opc2 = 7,
       .access = PL2_W, .type = ARM_CP_NO_RAW, .writefn = ats_write64 },
-    /* AT S1E2* are elsewhere as they UNDEF from EL3 if EL2 is not present */
+    /* AT E2* are elsewhere as they UNDEF from EL3 if EL2 is not present */
     { .name = "AT_S1E3R", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 7, .crm = 8, .opc2 = 0,
       .access = PL3_W, .type = ARM_CP_NO_RAW, .writefn = ats_write64 },
@@ -8691,7 +8691,7 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_Stage2:
-    case ARMMMUIdx_S1E2:
+    case ARMMMUIdx_E2:
         return 2;
     case ARMMMUIdx_SE3:
         return 3;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5372947e47..4e79dbbdfc 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -152,7 +152,7 @@ static inline int get_a32_user_mem_index(DisasContext *s)
      *  otherwise, access as if at PL0.
      */
     switch (s->mmu_idx) {
-    case ARMMMUIdx_S1E2:        /* this one is UNPREDICTABLE */
+    case ARMMMUIdx_E2:        /* this one is UNPREDICTABLE */
     case ARMMMUIdx_EL10_0:
     case ARMMMUIdx_EL10_1:
         return arm_to_core_mmu_idx(ARMMMUIdx_EL10_0);
-- 
2.17.1
