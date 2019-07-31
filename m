Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071353wrv;
        Wed, 31 Jul 2019 13:38:37 -0700 (PDT)
X-Received: by 2002:a63:c013:: with SMTP id h19mr85483151pgg.108.1564605517205;
        Wed, 31 Jul 2019 13:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605517; cv=none;
        d=google.com; s=arc-20160816;
        b=gWs81xzxF5CNUb1su7UQNImpMWx+k+ItG/YlgkInwp+eL6VkkIdo49Ss67xTUEQv2T
         zRuVBL6aCG/M2T8bkTZ3bpbxpOJNdLhroMyvCIXSPQvSsqC/W4nBxkTdCpKdPHm5mVU1
         NrQc9czur7G4l+92mMTPsFQa6KDemCm03/kpUivEH3he8AdedVB/FEhPSAgq3hzqhElV
         wD1JD5EVBi02J48tVOYgf61zpDjoTXnyo4yVE47H85ABWcbISxRzwSe10SLB3c6QG+Wi
         RHsUuw48A3gPU1yNS0N/JQtkTaWydGT1++XkXclFwcy5QeL0Io9O1qXn9W2lceIYUIbv
         rY8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=VjzDc7lTBTDRBT8iLvPhCchzYrLI8WxMxxlUTCAkZXM=;
        b=NMZvq/7Sq+h6HXYLd2Kx8tp2fDCVH9uGs67YVktilO0+BwSRj7IySGtJSNED3BFwwb
         9VIxyguLX+as1TpZ136VsjpwZtRb5UBgfL7KscWewXfXZDcbRHTxz8vzecTD+S3Q2h3+
         /dOx5ET9w9dIlI39rkmdzGEu8dAtBzXsfMq88zBER+EQjEUEwjXxvEeVGTh8Cn2pq5Un
         85eURnNPXONnizmaJ0U+u5QjqFDkrbE+kU7yW2NJ9rbUMWGUQLwq6IIv90p/5wBQAERf
         5y8W+MExSCODBkaXc9AroDiHC1dNIG5HZJF66kLJSVM3OemppKfUkd7x8TO4BFvCtbv4
         Tkhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yPTd0O7f;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j5sor3516164pjf.20.2019.07.31.13.38.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yPTd0O7f;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VjzDc7lTBTDRBT8iLvPhCchzYrLI8WxMxxlUTCAkZXM=;
        b=yPTd0O7fRJX3oN/NIk1KJXpMXKNUSUieojMA6sirH87WzI0hLAImW/7xL6AAADqdGj
         rpCbee1zgVQHL0x4O6SWurc2E7M8vyiXRrD/XH+fKl7EY19JDbMCPP+HjsMa3UqjpevD
         ceDIHyrTIvQ728fqiyNHc4NAlNtS1Mr4z43dIU9wHC5xgCithjZ9DCXeeidAAuqfFlwg
         Ztm4xIfvWWnH9wMN09ws2TrENC3djDwlhFmPcULTIm2APPYy4w7Nnsg34oPLnA5uvpE9
         xhOPFM1j2+6xZ7/zKa2lkTXcawHqmptADbus7fN3ItMJgnSqt+v3WXkVYXYK82d3YAc2
         oH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VjzDc7lTBTDRBT8iLvPhCchzYrLI8WxMxxlUTCAkZXM=;
        b=gVJXfnhLbJmf2j9i1gkv6SBpxm3AOhUdzIULtK6Ky9cvTkmuJ7IRZu5uaQHKRXNmu8
         oqTwXACZxWSpYMIQhGSXRO19+gftkuJUn9SccWJAgndlcMkimLYuQ1Fjr7zb7WTL15zp
         EMBfkbcoLj6eGAB3jmXVz+XJyE31rLL0ArPFyccxco5WruAzM7HjxCC2zhY3uFNrIGAm
         +gZsUqtGUNmQzVoACJAGNfDXOEGwvWEPowbmguRsYl45m+D7RJ8W9QS5/2iKpq0I4r6c
         ztE+k1/SYtMSbCAQE9cb+H3gMTPZTt8/EcdXJZaQEmFivze1nofIW8SBIyXS7o5E8WGd
         9fIw==
X-Gm-Message-State: APjAAAUEPyoaraGhGdcbMuATEGi8ToCxckuKv+9FaVIAj2r1vUS+1eDf
	f2rC9x8weSKdxc2h8dngCfnNJWURZdZIFw==
X-Google-Smtp-Source: APXvYqwtt/1l8XbKy48xMPFLe7idgZ+sYP8DqXL3C0cpLNiyTW2ESxSsNJwMtK8WcXNgBtcaMpacUQ==
X-Received: by 2002:a17:90a:2343:: with SMTP id f61mr4805864pje.130.1564605516716;
        Wed, 31 Jul 2019 13:38:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 17/32] target/arm: Rename ARMMMUIdx_S1NSE* to ARMMMUIdx_Stage1_E*
Date: Wed, 31 Jul 2019 13:37:58 -0700
Message-Id: <20190731203813.30765-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
X-TUID: 3zz/WMnCrjY9

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
