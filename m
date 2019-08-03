Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201029wrv;
        Sat, 3 Aug 2019 11:48:24 -0700 (PDT)
X-Received: by 2002:a65:4509:: with SMTP id n9mr76185673pgq.133.1564858104759;
        Sat, 03 Aug 2019 11:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858104; cv=none;
        d=google.com; s=arc-20160816;
        b=lutEiaNaTOlRwF1DkO543GgOjdN6CPZ19+Gi+ooS31PZtGCNbSYZaJPApBbtPsLLT1
         kA7UFfANnpaViIeFeIzm2aenjPEA5Qx8KVuUEYDry+Cs96MAclvgV4fAnj0ixys3uaHb
         H8fbJHnTbb8xwVmJEHnWImWKokzU/vnpZ9qluO1LC5dghVQdMfVJSVrTQoLn+J/JtA5b
         hL0FqPWHS8hA57ODa5kRIq1hZU2Jj9X481TfrRfgIfESHKf+MEFHLq2wZtzO24Q4QGEI
         xLwaQvM46iLz2VmiYnN868nRIQxkkGm1FTMWKoYpU8GXeOdIMnwbc6FrrT0AqZwoDGpW
         bSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=w216qTj/BYqjTL2Y/6Uaoyzbe1vK0P5jhQZ1rUoxx+c=;
        b=AWqOA4YICWb+vzhU0Cd49fSbknx8d8fyI0fj5h9vUGoGevuiRCdT1Icu8P/D/6UVWo
         7AJMBYEwiZieGFpak7y8kFqfiHS+Uo1td/Kund/ssee/1NHfEz4JxbEWhboR2gqk/fj3
         Q4ehAIoka1mAllTp/YaD1AYySLKo7updex2RwYZa0NGlByvHXR8ZbFsuBG6TJGOBUcOh
         bB+QAUH8zhNeMz9ECTL3oi0zstEfdBgcT/KIbGhXEyInAmjiekZPVK4pK0BR/PzJ715G
         WEZYhhXAI42gKNvXr/q+LdRNxZLJQALMExTlosV9UD681gSlLa08tg69zn81ewZRt4WK
         Gi1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VshZ5FZ/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a1sor14896597pjv.18.2019.08.03.11.48.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VshZ5FZ/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=w216qTj/BYqjTL2Y/6Uaoyzbe1vK0P5jhQZ1rUoxx+c=;
        b=VshZ5FZ/nArFkQFQb7nU4aHDQVOFJUdHPmPlru4x3yPa9mSn0gl9yvoND9TEAFdOZ/
         yZDA96+cgmGMBx7Kd/2wPOrIMj8+T9rscFkIG/DFJFaWLDKmpNXRmdAC7BY3QAh5/jvs
         5M23Pm9CHPl3z0WDwuzKlj/lXdcKQ+7oExXe3KgIEq/xuF7yfX9x2PEr4qul3sD5Qscz
         p9krloOMxMIqH4GP5Kt9q53d8YEnBOpWCFb5E8jySL0nmi3ZQC2hKFhl8dl/CHIb3MAb
         FCzUU/cMHasVZ10ACJvfF8ECDP8ix230+IDYMbU0tE1LH169onpvcRG5XTkEs+KYNHA0
         yQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=w216qTj/BYqjTL2Y/6Uaoyzbe1vK0P5jhQZ1rUoxx+c=;
        b=SWDWiHPh0pL3GxNqRglEq2FhdB4uqGlFFPVSp5At7esd4MVo+I1paiRihU6/dmjYsl
         LIzw+X2vOfEnGEaDo8qb2TrCUiPpM4GHLIkFSh23DH48BiMvI7e1coaOIBHNpuGsfH22
         9N0OcXgETaVaWbO8ZFUM+ydBXRcaQ4EkN60e3EfklN9xXof3oa1VOuhZVNjUWjVKt1xz
         moMp+8FOQeDSGLX5awabFo6lWwGWQJjgREppDOpIcZd1wsK5KNIksPTSL8fIen4fhVYc
         17UvozwP/w8wUQ5uUTHKbJHqMYRKprz6c9ZB70ceAhiPb/vhrnbg117C0JREI4d/HxmH
         1wlQ==
X-Gm-Message-State: APjAAAUKMpnXs2+w+82q4xEgaEWJGLpqa801OvAJL+9vdY0jv5rlulPm
	GW65zYUqGptq3iPQGukazsOJTYAz
X-Google-Smtp-Source: APXvYqyXdVksYwZ+s1iQoCEHiQRowOqGPAhXBYs2s+XtYqXfvYRskzJ9+hO7AM+2uh5En5I7/pfHwA==
X-Received: by 2002:a17:90a:5884:: with SMTP id j4mr10856534pji.142.1564858104262;
        Sat, 03 Aug 2019 11:48:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 18/34] target/arm: Rename ARMMMUIdx_S1SE* to ARMMMUIdx_SE*
Date: Sat,  3 Aug 2019 11:47:44 -0700
Message-Id: <20190803184800.8221-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-TUID: z8b5Hl9YaTN9

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
