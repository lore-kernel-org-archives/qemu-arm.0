Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071403wrv;
        Wed, 31 Jul 2019 13:38:40 -0700 (PDT)
X-Received: by 2002:a17:90a:ae12:: with SMTP id t18mr4842302pjq.32.1564605520670;
        Wed, 31 Jul 2019 13:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605520; cv=none;
        d=google.com; s=arc-20160816;
        b=OMkW8LIgO1/1aTU5bxOTQhEHA8vFyvZO8AyZ/U65vF79aySnp+JJ8mvCd9VVf/UzTE
         9y/73w5uwwVNI+7V5M1FRgc07oEa40Qh4aPuunLTxGuPGPykOfxR+2pdXCiW1ezh+FwS
         D7pu0pSc3k0uAZ0QAYSuxUmiNXYWoT6UEhkNf6fCdUj1CDzmN1QRN9XXtCCTKW9/PWbn
         bmIVkrrSfiXucoSZT93/GD8TtGq8/LH0zORT5CgEJ7A94T2KKYSpClybJCZHWpSmY2Mm
         VHmIB1N7eP79pLQ8dwxX6AejkWbgIWXEpH92cmlj2mYLmWfAQMXcTXgIRn9oW2vSaGT7
         ZqnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=trlNGPogxXBK9OHHkWCBGsx/W/Lwzy6lbLUgzLGbb4A=;
        b=E1iZOdlq9syFardKZsW6JeLGfaEZXTPHoeWTg3+nOpvm5j/XHjjciQ9h3NsPrNXklY
         1z+haeOFms2JovirLmE+YpC8Y4nGXHAl8OYMke+HaxooH3jmqcwTHCHbla3uezllMk0c
         fwy0bo7qtDPMCqRh/hhwQ5mFUrkMSRik6TTomk11IrUaeJG8PkPDPJhuvGKP4r1UdJBS
         M3K9I7CUDPO5XEAClcgG0oQVG+bkr0udb4RSZHxQz8WNJl5KzRdbPryX4n63wPQ9uKnk
         xvXlVaqNckzDM74i16Uagmg4giE7LGoZv9JkrgWLLr7Tt40W2lvTkYa/FNYli944d7xD
         IdZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FnckERwD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i5sor8198012pgi.0.2019.07.31.13.38.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FnckERwD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=trlNGPogxXBK9OHHkWCBGsx/W/Lwzy6lbLUgzLGbb4A=;
        b=FnckERwDmDIWWSq+DLNZGvLiUHOrNRx2cZ9VfPjMtiB92cIz1roDmLiFD7HvVwmpkW
         6qGkDMkHKnGBjfzEa206YBOv4NGezzn1SePqNbJkbPIU9d8rG/iiVO5GFHVbmA2/bLFG
         0MHopL3QvcgO73DQaOTvXlIBrareISyUWIBuzMOnoqJzKgLC8YYCWgHvH+QnSuMNZmv1
         pzH/ujw2eO/6r/ECClBwZdPCSXk36wpchu3lKwwHPuKtSMfA2tp+UNYinFK+xdoAH6re
         JWS17iGGpWNTUr9JrE4bam+5vDoqSp6I6gMqRe2/5HbYitTCuRlgwW+bgR1Q03M84F0O
         7Yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=trlNGPogxXBK9OHHkWCBGsx/W/Lwzy6lbLUgzLGbb4A=;
        b=lBOXvwcq53xOrl20JaUVuWmz2wJBBV9swwoBLhbUYf/4/6U/y8Y6eqIlID+aIwDs32
         XCSIvOHg66Xc/Ij3Yiy4ua5y2odivxp9TvEkb9f7Ik1Qy9NWVN2puii0ijHTgeNBFzrZ
         y/OHDW4eHFb7MxbWCaQ9XvhfNIw/Za3ZvdVadJL/qmJe8uUvb4VKMXdjMY0v9GC0iRjp
         UGm9jlaUkmC8a5M4Dg8jZhG6vQnDPC5v1IYhy3yPmCybh/x3mu9qe+KjtyHYw0RBNq2x
         +Gf9GBaFEaHuLCUJMgAwK5XUlfGhUcfYTRwJNlwexu82rH7brvYDGx6LEdbV8ZfX4ZzO
         Sq5w==
X-Gm-Message-State: APjAAAV2G6LJsxQS2umsNY53S+cYEVmp63CXeyFlch/CkgaT13AFL/jc
	CUKhHTfCGN0Ewm3Bxln5j5K7KI0SsE2yew==
X-Google-Smtp-Source: APXvYqxWjZ7IxLToKxY6I3CKj5IZHVw8vuKJNV16ChWEFEdhM+8u4ipR5eI3r7dsp0t7YQiaQyYb+A==
X-Received: by 2002:a65:5202:: with SMTP id o2mr90826501pgp.29.1564605520120;
        Wed, 31 Jul 2019 13:38:40 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 20/32] target/arm: Rename ARMMMUIdx_S1E2 to ARMMMUIdx_E2
Date: Wed, 31 Jul 2019 13:38:01 -0700
Message-Id: <20190731203813.30765-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
X-TUID: xE92VOxzN5xz

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
