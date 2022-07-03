Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2445030lft;
        Sun, 3 Jul 2022 01:59:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tmh6tk7bccVZKZ3zGnY67QCNB72mZKHnsx/nIGYD/6+02vdJi4B5FQwm0XXGZQjqHf7GfH
X-Received: by 2002:a25:2d1b:0:b0:66e:2dcf:11cf with SMTP id t27-20020a252d1b000000b0066e2dcf11cfmr4704998ybt.581.1656838743090;
        Sun, 03 Jul 2022 01:59:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656838743; cv=none;
        d=google.com; s=arc-20160816;
        b=v0/IY9WzZ6pNIwEz1vtfUJBARngN6kYEfIrVofLCVIR2PstMEu7Apcl+wzA45nrHGh
         5NtI0oADj7KXkYOs/7N3IAJ2Ad55UdMfwX4QBPTY4XDdIgovHIdWjvYu6RjmNEekZlyt
         nHE2A9L7kw9yOlbKsd4AdFVOWQm+XMeWtYqa9fY+cBwWiTpyNQnzkO2dcWYP0g4CSsNH
         wSsXW2Xku0Lgw+okUFm87X2jIwe4OpV2Ez1ZsCkIRIRmSJgUBTcEPeEObUGKNwIFs5Az
         lx2Wx204ezLMWhPcJqHXKmpLb8Q8NNwAf0dcm68yKJmEqerJ4E43e1+AHvc/Tae5sGeM
         STag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nffg//dkzBQoqRm5IXNwBlQ5m5g6qr/efQ0ZTxyujnA=;
        b=KV80chmF8h8Kixp2qEgcFEfe/AS2I6z41If6/i8k22cLik/HPu2cUnipn+AeMGwCvJ
         svBU/cXmZVyr0JUk31dmg6HpCJTn/q3JvQNMRnwwmQPD6BwR5RGqpiJBtEQSz87l+hmY
         TIjT5jl3LDtwLbhjxmJ3gT89zHWxlePYzKKGsrp3EUaqrqAlmC2p3wyKyqlT22Bk8vWR
         PmyvzzzldXg3BuNxGICdFcp1DeobF+67GE3a8tYSpYsdYRzQ7y9NH+WmEXaG7qFHIdzw
         RZK+eNH3mGlfY3X68pdCABt/e38x2koG0eUgsMHnSu/WVw1rIwgKD9XlL/zS33znwaOi
         VV9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tDHaKxhX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e63-20020a0dc242000000b00317933a6203si37045191ywd.218.2022.07.03.01.59.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:59:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tDHaKxhX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vRW-0001rl-EH
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzW-0001Vn-28
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:07 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzT-0006fZ-Pg
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:05 -0400
Received: by mail-pl1-x633.google.com with SMTP id j18so494549plj.8
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nffg//dkzBQoqRm5IXNwBlQ5m5g6qr/efQ0ZTxyujnA=;
 b=tDHaKxhX9KFtEIu5KOtZtndzqzuEDkEbwTsAxa7b9nHsnShlJEBTsabBbJBurwB86G
 yoijL/Fo5GYmRMB9G3heKBY8CxfKjuf6MFF73Tj1RQ890X+F9DIFrnDHZXaPD13INuPk
 tpEeA5dCnt9+v5PL4LBRXdT+Gyz0UMfuW6uEllX9ihC1OCXMvDCDiK3Qv3fzpgzBPP8g
 5g4xwZ6lyNLTdGq+dvZOQvJR52BBFtsmu3Es1sN7wAvfYDTWF4k5ipXMXfEVnFTtfjYy
 Db3V92cB+SS6excUuyLAR4+cmHNy4dIYsKxSuK6OLa2UjM9JBEY9w7zVyBcsKwXobUQd
 9CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nffg//dkzBQoqRm5IXNwBlQ5m5g6qr/efQ0ZTxyujnA=;
 b=jbbc55uG6Jc0Tut8JshJdSZosAv55M5XGDrF/CmzSbb/NVvw/gD3769H6NObIhbmGA
 biPi4XG/7pXsuxyNw+Gp6kqqmVbXHlPYtNFaVdsEBFtqBluFSbfoVtc+lycD/gJ7Jc4v
 8NrgmKRigBTKkmSPFirkF2oKYnINRC8yiwNkeLni7r2wfsuxGzq1ewSbuYx9wDNvvgV7
 BJaicfyjj5if2U1u1rX+0cu7v7q9sriKLw1r/PQFDphIWic6QcOPprTIWdy+q0auNP9s
 Cyr+IAu2T2Lod4VEz0HYiwnTGjlv0U+FGiAXuRq9bmod2n1r7rHxNxDNDdK1Qcu44zDk
 54vQ==
X-Gm-Message-State: AJIora/hgmcvejbxtqAMcWTMc5Spcsc+UIWoUlZhJm+B74plqdhsrE/C
 lJvlCYFPQkI7FP0yD6f2iYChu+Rw0DP4Wx/0
X-Received: by 2002:a17:90a:598f:b0:1ef:32d9:1fa2 with SMTP id
 l15-20020a17090a598f00b001ef32d91fa2mr22308483pji.182.1656837002748; 
 Sun, 03 Jul 2022 01:30:02 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 51/62] target/arm: Add ptw_idx argument to S1_ptw_translate
Date: Sun,  3 Jul 2022 13:54:08 +0530
Message-Id: <20220703082419.770989-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-TUID: /v6cvWnn2M/s

Hoist the computation of the mmu_idx for the ptw up to
get_phys_addr_with_secure and get_phys_addr_twostage.
This removes the duplicate check for stage2 disabled
from the middle of the walk, performing it only once.

Pass ptw_idx through get_phys_addr_{v5,v6,lpae} and
arm_{ldl,ldq}_ptw.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 100 +++++++++++++++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 33 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e42286b4c1..6eb61849d3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -17,7 +17,8 @@
 
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, bool s1_is_el0,
+                               ARMMMUIdx ptw_idx, bool is_secure,
+                               bool s1_is_el0,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
@@ -190,21 +191,16 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
 }
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
-static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx, hwaddr addr,
+static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
+                             ARMMMUIdx s2_mmu_idx, hwaddr addr,
                              bool *is_secure_ptr, void **hphys, hwaddr *gphys,
                              ARMMMUFaultInfo *fi)
 {
     bool is_secure = *is_secure_ptr;
-    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
     MemTxAttrs attrs = {};
     PageEntryExtra extra;
     int flags;
 
-    if (!arm_mmu_idx_is_stage1_of_2(mmu_idx)
-        || regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
-        s2_mmu_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
-    }
-
     env->tlb_fi = fi;
     flags = probe_access_extra(env, addr, MMU_DATA_LOAD,
                                arm_to_core_mmu_idx(s2_mmu_idx),
@@ -267,7 +263,8 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx, hwaddr addr,
 
 /* All loads done in the course of a page table walk go through here. */
 static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
+                            ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     void *hphys;
@@ -275,7 +272,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     uint32_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, addr, &is_secure,
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
                           &hphys, &gphys, fi)) {
         /* Failure. */
         assert(fi->s1ptw);
@@ -311,7 +308,8 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
 }
 
 static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
+                            ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     void *hphys;
@@ -319,7 +317,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     uint64_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, addr, &is_secure,
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
                           &hphys, &gphys, fi)) {
         /* Failure. */
         assert(fi->s1ptw);
@@ -460,8 +458,8 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure, GetPhysAddrResult *result,
-                             ARMMMUFaultInfo *fi)
+                             ARMMMUIdx ptw_idx, bool is_secure,
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     int level = 1;
     uint32_t table;
@@ -480,7 +478,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -518,7 +516,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -579,8 +577,8 @@ do_fault:
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure, GetPhysAddrResult *result,
-                             ARMMMUFaultInfo *fi)
+                             ARMMMUIdx ptw_idx, bool is_secure,
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
@@ -603,7 +601,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -656,7 +654,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -1011,7 +1009,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
  */
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, bool s1_is_el0,
+                               ARMMMUIdx ptw_idx, bool is_secure,
+                               bool s1_is_el0,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -1237,7 +1236,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, fi);
+        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, ptw_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2408,7 +2407,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
     bool ret;
     bool ipa_secure;
     ARMCacheAttrs cacheattrs1;
-    ARMMMUIdx s2_mmu_idx;
+    ARMMMUIdx s2_mmu_idx, s2_ptw_idx;
     bool is_el0;
     uint64_t hcr;
 
@@ -2430,7 +2429,13 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
         ipa_secure = false;
     }
 
-    s2_mmu_idx = (ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
+    if (ipa_secure) {
+        s2_mmu_idx = ARMMMUIdx_Stage2_S;
+        s2_ptw_idx = ARMMMUIdx_Phys_S;
+    } else {
+        s2_mmu_idx = ARMMMUIdx_Stage2;
+        s2_ptw_idx = ARMMMUIdx_Phys_NS;
+    }
     is_el0 = s1_mmu_idx == ARMMMUIdx_Stage1_E0;
 
     /*
@@ -2442,7 +2447,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
+    ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx, s2_ptw_idx,
                              ipa_secure, is_el0, result, fi);
     fi->s2addr = ipa;
 
@@ -2514,19 +2519,49 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                bool is_secure, GetPhysAddrResult *result,
                                ARMMMUFaultInfo *fi)
 {
-    ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
+    ARMMMUIdx s1_mmu_idx, s2_mmu_idx, ptw_idx;
 
-    if (mmu_idx != s1_mmu_idx) {
+    switch (mmu_idx) {
+    case ARMMMUIdx_Phys_S:
+    case ARMMMUIdx_Phys_NS:
+    do_disabled:
+        /* Checking Phys early avoids special casing later vs regime_el. */
+        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
+                                      is_secure, result, fi);
+
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
+        /* First stage lookup uses second stage for ptw. */
+        ptw_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+        break;
+
+    case ARMMMUIdx_E10_0:
+        s1_mmu_idx = ARMMMUIdx_Stage1_E0;
+        goto do_twostage;
+    case ARMMMUIdx_E10_1:
+        s1_mmu_idx = ARMMMUIdx_Stage1_E1;
+        goto do_twostage;
+    case ARMMMUIdx_E10_1_PAN:
+        s1_mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
+    do_twostage:
         /*
          * Call ourselves recursively to do the stage 1 and then stage 2
          * translations if mmu_idx is a two-stage regime, and stage2 enabled.
          */
+        s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
         if (arm_feature(env, ARM_FEATURE_EL2) &&
-            !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
+            !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
             return get_phys_addr_twostage(env, address, access_type,
                                           s1_mmu_idx, is_secure,
                                           result, fi);
         }
+        /* fall through */
+
+    default:
+        /* Single stage and second stage uses physical for ptw. */
+        ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+        break;
     }
 
     /*
@@ -2583,18 +2618,17 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     /* Definitely a real MMU, not an MPU */
 
     if (regime_translation_disabled(env, mmu_idx, is_secure)) {
-        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
-                                      is_secure, result, fi);
+        goto do_disabled;
     }
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx,
-                                  is_secure, false, result, fi);
+                                  ptw_idx, is_secure, false, result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                is_secure, result, fi);
+                                ptw_idx, is_secure, result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                is_secure, result, fi);
+                                ptw_idx, is_secure, result, fi);
     }
 }
 
-- 
2.34.1

