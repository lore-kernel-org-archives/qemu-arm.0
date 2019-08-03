Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201019wrv;
        Sat, 3 Aug 2019 11:48:24 -0700 (PDT)
X-Received: by 2002:a63:fb14:: with SMTP id o20mr116934280pgh.136.1564858103776;
        Sat, 03 Aug 2019 11:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858103; cv=none;
        d=google.com; s=arc-20160816;
        b=kFWR99NTS95qR3o/mBhJjA5SKzu+CsCM0kRp9neQY9tVeDhv/o9ZuFkHXCG3sdkFU1
         qfAL0w1tW+Nr47kXI3XLgEifIUrHYKzCEJV+Cnh06XEwT9bg93DLgTQFjirvnl22DAYf
         UyvmdQyBISLX7xG1p1xPiE8xYtglCDScaLZQD+4TFeqW9fAMdmxhYtuZFepXeIO9tuVY
         XQxyZAOlyZeheV7g+b4Y2YA9e2pQINUl+P8wBpzJeybc6U2W+uQFfga18HEjLEJzsQOf
         oPh4R/q99LZTfuwawE6Hdr1sVPpKYT02MzHgAfYB9j1C1Dm/SA+CUlGl7dFFFr4TZhpl
         Ug1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=VjzDc7lTBTDRBT8iLvPhCchzYrLI8WxMxxlUTCAkZXM=;
        b=RedKYnFEjZzRBYyKJwy/FCuQDHJIZzcKIa2qK/X7TPuM2+aNpcHa9cQFz46jAlhOgh
         A5uAotYzpi8HTKamSfp6EslWaX3LgaW9WzxN2mxYnRcj/WUTI8Ma3kHjMp5dZYgLUZ2x
         b5T7uBqkzwfurtRVkNH3+eDB/j0Kl+QPrNT06Ree6W2cdr2h4KPKS2Sq47xS3hxDrmZK
         ID2b2ZJ8lKKNpS7u4en0g4THoY2UaqqFrisObtwiYfNpF+eyMgBrUkJuMn4nETFH8GeO
         dOU9pytVtulP0DbWbqfpd389dJR2ZL6a1BI9h3OUVXPJsGsGAwBE60fAG++Ej9IHy+BN
         btkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=foiUfcT4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 13sor60341043pfi.28.2019.08.03.11.48.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=foiUfcT4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VjzDc7lTBTDRBT8iLvPhCchzYrLI8WxMxxlUTCAkZXM=;
        b=foiUfcT4TZ5uqUsirjpWFshpuOkx97FJ2aHGsrr2Exo2r1R41xS2WETc3BUtHfu3DO
         KMmV+Hj+0kZJkHsz5iJ/21oELQtf9X3pjUJ3tDn5bc8qWUWPJgvhbdNcPMaKTYgDc6Uo
         7zDHJnElftLUjsgZEwqx1tFDhhsm2nqiX75IDNEkesSlwxLhvWXDCkI3+4+WDZHMExEX
         ORTyQjTbU0S7KJvx8OFa5ADWSNIA723y6NSkjb+D6hRyDWxfYdPptpB9gC8O4DgYs+MG
         N7YGVGJcZIgMkUijoYAQr+3DzAyl+bOHBZeZalhb4HliwSwAenmUo1SuHRwEbpxW/+vp
         CfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VjzDc7lTBTDRBT8iLvPhCchzYrLI8WxMxxlUTCAkZXM=;
        b=dpTcLLpSm9clExm9i+gF3ddW2L36E4a52udHw/TXQZDLT+yHf5yigBqopZssr1I8n8
         6ZmDUvCusY1WUIi/vZFcj93mhIUlCSP2duHaDom6TueTZwswRgNaPiFDIoNeWiEChdwX
         XTRKz8j44u0n4x2vTdSqGVqMe9SDEzfnMG5Tg+E+MdERnM9z84Rx9CMYf9yc01Al12YR
         xhEebMF1m+U/r/OpmiAXfvcZfrQEsY7ZC/zKOrok1Rli0Sz2sMcOVLsH6Oy4k6lVxvMM
         MpvUH83Atn/Ur/ZOqSrf/4a0+eGjQFNazrT4+G5XrZfeJuhNNqu0yOhd+vrPs1y0Evgq
         WFxw==
X-Gm-Message-State: APjAAAUNRTYp5rYbu7xckMbr7jGpCzvNAN/JbmK/SE5bbBbSuwY/DyoZ
	H9/etRRuBwTZdNr3SDjXo4rRbJKM
X-Google-Smtp-Source: APXvYqwZJw5wzrwj5JvENZPajDYPfjvpWFmNLA6M/tsMs6aK2CMwaqGfABhlU8bR1r5DjvvjNdyvrQ==
X-Received: by 2002:aa7:9217:: with SMTP id 23mr66753521pfo.239.1564858103240;
        Sat, 03 Aug 2019 11:48:23 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 17/34] target/arm: Rename ARMMMUIdx_S1NSE* to ARMMMUIdx_Stage1_E*
Date: Sat,  3 Aug 2019 11:47:43 -0700
Message-Id: <20190803184800.8221-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-TUID: GGr7uswOGnKl

This is part of a reorganization to the set of mmu_idx.
The EL1&0 regime is the only one that uses 2-stage translation.
Spelling out Stage avoids confusion with Secure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |  4 ++--
 target/arm/internals.h |  6 +++---
 target/arm/helper.c    | 24 ++++++++++++------------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 14730d29c6..ade558f63c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2868,8 +2868,8 @@ typedef enum ARMMMUIdx {
     /* Indexes below here don't have TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
      */
-    ARMMMUIdx_S1NSE0 = 0 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_S1NSE1 = 1 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
 } ARMMMUIdx;
 
 /* Bit macros for the core-mmu-index values for each index,
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1caa15e7e0..cd9b1acb20 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -810,8 +810,8 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     switch (mmu_idx) {
     case ARMMMUIdx_EL10_0:
     case ARMMMUIdx_EL10_1:
-    case ARMMMUIdx_S1NSE0:
-    case ARMMMUIdx_S1NSE1:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_S1E2:
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_MPrivNegPri:
@@ -966,7 +966,7 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env);
 #ifdef CONFIG_USER_ONLY
 static inline ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 {
-    return ARMMMUIdx_S1NSE0;
+    return ARMMMUIdx_Stage1_E0;
 }
 #else
 ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6c8eddfdf4..4c0c314c1a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3119,10 +3119,10 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             mmu_idx = ARMMMUIdx_S1E3;
             break;
         case 2:
-            mmu_idx = ARMMMUIdx_S1NSE1;
+            mmu_idx = ARMMMUIdx_Stage1_E1;
             break;
         case 1:
-            mmu_idx = secure ? ARMMMUIdx_S1SE1 : ARMMMUIdx_S1NSE1;
+            mmu_idx = secure ? ARMMMUIdx_S1SE1 : ARMMMUIdx_Stage1_E1;
             break;
         default:
             g_assert_not_reached();
@@ -3135,10 +3135,10 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             mmu_idx = ARMMMUIdx_S1SE0;
             break;
         case 2:
-            mmu_idx = ARMMMUIdx_S1NSE0;
+            mmu_idx = ARMMMUIdx_Stage1_E0;
             break;
         case 1:
-            mmu_idx = secure ? ARMMMUIdx_S1SE0 : ARMMMUIdx_S1NSE0;
+            mmu_idx = secure ? ARMMMUIdx_S1SE0 : ARMMMUIdx_Stage1_E0;
             break;
         default:
             g_assert_not_reached();
@@ -3192,7 +3192,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
     case 0:
         switch (ri->opc1) {
         case 0: /* AT S1E1R, AT S1E1W */
-            mmu_idx = secure ? ARMMMUIdx_S1SE1 : ARMMMUIdx_S1NSE1;
+            mmu_idx = secure ? ARMMMUIdx_S1SE1 : ARMMMUIdx_Stage1_E1;
             break;
         case 4: /* AT S1E2R, AT S1E2W */
             mmu_idx = ARMMMUIdx_S1E2;
@@ -3205,7 +3205,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         break;
     case 2: /* AT S1E0R, AT S1E0W */
-        mmu_idx = secure ? ARMMMUIdx_S1SE0 : ARMMMUIdx_S1NSE0;
+        mmu_idx = secure ? ARMMMUIdx_S1SE0 : ARMMMUIdx_Stage1_E0;
         break;
     case 4: /* AT S12E1R, AT S12E1W */
         mmu_idx = secure ? ARMMMUIdx_S1SE1 : ARMMMUIdx_EL10_1;
@@ -8698,8 +8698,8 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_S1SE0:
         return arm_el_is_aa64(env, 3) ? 1 : 3;
     case ARMMMUIdx_S1SE1:
-    case ARMMMUIdx_S1NSE0:
-    case ARMMMUIdx_S1NSE1:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
@@ -8757,7 +8757,7 @@ static inline bool regime_translation_disabled(CPUARMState *env,
     }
 
     if ((env->cp15.hcr_el2 & HCR_DC) &&
-        (mmu_idx == ARMMMUIdx_S1NSE0 || mmu_idx == ARMMMUIdx_S1NSE1)) {
+        (mmu_idx == ARMMMUIdx_Stage1_E0 || mmu_idx == ARMMMUIdx_Stage1_E1)) {
         /* HCR.DC means SCTLR_EL1.M behaves as 0 */
         return true;
     }
@@ -8802,7 +8802,7 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
 static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 {
     if (mmu_idx == ARMMMUIdx_EL10_0 || mmu_idx == ARMMMUIdx_EL10_1) {
-        mmu_idx += (ARMMMUIdx_S1NSE0 - ARMMMUIdx_EL10_0);
+        mmu_idx += (ARMMMUIdx_Stage1_E0 - ARMMMUIdx_EL10_0);
     }
     return mmu_idx;
 }
@@ -8837,7 +8837,7 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_S1SE0:
-    case ARMMMUIdx_S1NSE0:
+    case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MSUser:
     case ARMMMUIdx_MUserNegPri:
@@ -9068,7 +9068,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                                hwaddr addr, MemTxAttrs txattrs,
                                ARMMMUFaultInfo *fi)
 {
-    if ((mmu_idx == ARMMMUIdx_S1NSE0 || mmu_idx == ARMMMUIdx_S1NSE1) &&
+    if ((mmu_idx == ARMMMUIdx_Stage1_E0 || mmu_idx == ARMMMUIdx_Stage1_E1) &&
         !regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
         target_ulong s2size;
         hwaddr s2pa;
-- 
2.17.1
