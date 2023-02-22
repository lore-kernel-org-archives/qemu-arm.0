Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3829049ejb;
        Tue, 21 Feb 2023 18:38:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/xnpvscBL+CXyHO4eks7VWzvjRabjJ+pLM+1QaCWNUOxxYxQX44nOJR9PGMkv3tenknwWN
X-Received: by 2002:ad4:5748:0:b0:571:314:d725 with SMTP id q8-20020ad45748000000b005710314d725mr14816114qvx.49.1677033502129;
        Tue, 21 Feb 2023 18:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677033502; cv=none;
        d=google.com; s=arc-20160816;
        b=MAx7fgCR2y+JmtnQM094hQ6Mw+1iSuBmjYIrvBiqpt1MqpasfyGzWXUTOyIRNezZx0
         PZUxQriUM62yrM6oBLnqd4XJCxs5NbAqhTiiQ9QwFJiEA/z8U92lUlqltyiFPuxx6ojk
         wyNAmp73flSluAfr+8Xta0kYA11/zV45BLTNQT4MtHjN/Fe+LIhdKpH7PQPYOkBXq/FP
         XwtAvNpJagW3Cy4L8C8RMAH21G1VefT27z1JCDwEQ9ov+47TqmYAa0O4YrjWyc3unccZ
         cyZhUbWcRhb3JFu8xDG2R+2qASSFmVZ9jqjM5L757p0rU1rbjjo+NsImd+xljwu+TOMx
         UICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NEdCUdHrW00WmG0Jrfmbg8ARsi/ZJepNVs1RVZlJouA=;
        b=PqLNAJiryyJhqt4s9I5G2xsggMzGnwDkViRpCELg3LMcVI/VBVGkNWtmOwAyNcYk9+
         rT4UQKuzNAm/0znpgMqHJEK02N6E2CjXFky4z0m+FQFcNeYu7VVQLTT7HSXDyxyGjPXI
         LNdtPOwf4Ee4poZ0UlVSSYwrvWQC7v+iBZ+Azog2WtnRZreuSr/5I4wOVCUJj9Q2gGSR
         Dv8MSuisScAcnG+NBLP0HIXUAUc6b2SUUi/4DDX9H2+dd7dLYOT7ofsMBFtQXoJgiX7j
         V0XVuCV/mWqGtqjeehi7xRmeSJEIfKTkSWY0ipM3kaDFdg3+mNzM2qmIJ4gDpxi3Bxuy
         OyFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IdhEnL4H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 132-20020a370c8a000000b00706b154af95si12790902qkm.112.2023.02.21.18.38.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 18:38:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IdhEnL4H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUexR-0007cJ-5W; Tue, 21 Feb 2023 21:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexH-0007OK-6U
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 21:34:03 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexE-0001aS-4j
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 21:34:02 -0500
Received: by mail-pj1-x1041.google.com with SMTP id pt11so7907120pjb.1
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 18:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEdCUdHrW00WmG0Jrfmbg8ARsi/ZJepNVs1RVZlJouA=;
 b=IdhEnL4HpdFdXUKFf4DDSZTYw18TZ4qvAcMidmbkSjOVDrNmHjVE0JYDBZE2+GgEqF
 1s/8voxeJTppPX2H5IqzEnt+qni00t41iNCJ/8UlM+2tJitPcwf+ctybFheNbUeUqrin
 cg5H7pzuAmUiXaQs7QB5l0R8JblV+89faA+fVkh12PELOHHgbDF0Aajj1I0ePl9wG2Gz
 DDOYt5R4B2ZhOU7vHt2DbeZqZdyCHd/2xj1LxZhSJkfBKL2G4c8W8aTi9wO3WLO6VfmJ
 PXS6PTu7EbUMCNaslDw2mEnAAms6Xi3zvqPhED3V7jhTZU2EtL2dUljbOIIGdsrNNYVF
 TxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NEdCUdHrW00WmG0Jrfmbg8ARsi/ZJepNVs1RVZlJouA=;
 b=gIO18r5/EJ7S343MFQlpNQpk1epzfWXu7Ihf/GK4x+Fooe+bdrEFsIAF4JWiE091Yn
 jqgEhrlEA+AS8CHjdfsbUHPmFL2Hc3kfCZtgV3rDB/Dx7EDCeA5lSmIP1ccG7N9E/3u/
 Cb2b2Z2mKz8PDIOh8wiCPa1W2y/KNV73rQRXG4PAih7csV1t9fSoIO2/mrbIELIRoCYS
 Zbdm52GplzCJNgKE+GbuQaadoQb8kKJs5rg1PJTcomFtAUJm8pZ/Z6mTJ3GHJqL8ngb1
 asE5DYVk8j2k1s7skd6TzmoeWePQEDDgdz0HPnqDZA+wU+APUxZbTU8A/VCIQny9mnLt
 5Bww==
X-Gm-Message-State: AO0yUKWzS3eWaEbp5n1E5dF61OYvkGdeAcLBCdyZ1IoXCVclNcp6klti
 Xts9J4Y4xmsSYjg7rXEdIBH6vw==
X-Received: by 2002:a17:903:786:b0:19a:8338:703b with SMTP id
 kn6-20020a170903078600b0019a8338703bmr5491282plb.57.1677033239280; 
 Tue, 21 Feb 2023 18:33:59 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 14/25] target/arm: Pipe ARMSecuritySpace through ptw.c
Date: Tue, 21 Feb 2023 16:33:25 -1000
Message-Id: <20230222023336.915045-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4i5V5RCP85qj

Add input and output space members to S1Translate.
Set and adjust them in S1_ptw_translate, and the
various points at which we drop secure state.
Initialize the space in get_phys_addr; for now
leave get_phys_addr_with_secure considering only
secure vs non-secure spaces.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 98 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 78 insertions(+), 20 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9f608b12b2..a77db3dd43 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -19,11 +19,13 @@
 typedef struct S1Translate {
     ARMMMUIdx in_mmu_idx;
     ARMMMUIdx in_ptw_idx;
+    ARMSecuritySpace in_space;
     bool in_secure;
     bool in_debug;
     bool out_secure;
     bool out_rw;
     bool out_be;
+    ARMSecuritySpace out_space;
     hwaddr out_virt;
     hwaddr out_phys;
     void *out_host;
@@ -216,6 +218,7 @@ static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
 static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
                              hwaddr addr, ARMMMUFaultInfo *fi)
 {
+    ARMSecuritySpace space = ptw->in_space;
     bool is_secure = ptw->in_secure;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     ARMMMUIdx s2_mmu_idx = ptw->in_ptw_idx;
@@ -232,7 +235,8 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         if (regime_is_stage2(s2_mmu_idx)) {
             S1Translate s2ptw = {
                 .in_mmu_idx = s2_mmu_idx,
-                .in_ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS,
+                .in_ptw_idx = arm_space_to_phys(space),
+                .in_space = space,
                 .in_secure = is_secure,
                 .in_debug = true,
             };
@@ -290,10 +294,17 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
     }
 
     /* Check if page table walk is to secure or non-secure PA space. */
-    ptw->out_secure = (is_secure
-                       && !(pte_secure
+    if (is_secure) {
+        bool out_secure = !(pte_secure
                             ? env->cp15.vstcr_el2 & VSTCR_SW
-                            : env->cp15.vtcr_el2 & VTCR_NSW));
+                            : env->cp15.vtcr_el2 & VTCR_NSW);
+        if (!out_secure) {
+            is_secure = false;
+            space = ARMSS_NonSecure;
+        }
+    }
+    ptw->out_secure = is_secure;
+    ptw->out_space = space;
     ptw->out_be = regime_translation_big_endian(env, mmu_idx);
     return true;
 
@@ -324,7 +335,10 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw,
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = ptw->out_secure };
+        MemTxAttrs attrs = {
+            .secure = ptw->out_secure,
+            .space = ptw->out_space,
+        };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
@@ -367,7 +381,10 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw,
 #endif
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = ptw->out_secure };
+        MemTxAttrs attrs = {
+            .secure = ptw->out_secure,
+            .space = ptw->out_space,
+        };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
@@ -873,6 +890,7 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
          * regime, because the attribute will already be non-secure.
          */
         result->f.attrs.secure = false;
+        result->f.attrs.space = ARMSS_NonSecure;
     }
     result->f.phys_addr = phys_addr;
     return false;
@@ -1577,6 +1595,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * regime, because the attribute will already be non-secure.
          */
         result->f.attrs.secure = false;
+        result->f.attrs.space = ARMSS_NonSecure;
     }
 
     /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
@@ -2361,6 +2380,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
              */
             if (sattrs.ns) {
                 result->f.attrs.secure = false;
+                result->f.attrs.space = ARMSS_NonSecure;
             } else if (!secure) {
                 /*
                  * NS access to S memory must fault.
@@ -2710,6 +2730,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     bool is_secure = ptw->in_secure;
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
+    ARMSecuritySpace ipa_space, s2walk_space;
     bool is_el0;
     uint64_t hcr;
 
@@ -2722,20 +2743,24 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
     ipa = result->f.phys_addr;
     ipa_secure = result->f.attrs.secure;
+    ipa_space = result->f.attrs.space;
     if (is_secure) {
         /* Select TCR based on the NS bit from the S1 walk. */
         s2walk_secure = !(ipa_secure
                           ? env->cp15.vstcr_el2 & VSTCR_SW
                           : env->cp15.vtcr_el2 & VTCR_NSW);
+        s2walk_space = arm_secure_to_space(s2walk_secure);
     } else {
         assert(!ipa_secure);
         s2walk_secure = false;
+        s2walk_space = ipa_space;
     }
 
     is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
     ptw->in_mmu_idx = s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
-    ptw->in_ptw_idx = s2walk_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+    ptw->in_ptw_idx = arm_space_to_phys(s2walk_space);
     ptw->in_secure = s2walk_secure;
+    ptw->in_space = s2walk_space;
 
     /*
      * S1 is done, now do S2 translation.
@@ -2823,11 +2848,12 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     ARMMMUIdx s1_mmu_idx;
 
     /*
-     * The page table entries may downgrade secure to non-secure, but
-     * cannot upgrade an non-secure translation regime's attributes
-     * to secure.
+     * The page table entries may downgrade Secure to NonSecure, but
+     * cannot upgrade a NonSecure translation regime's attributes
+     * to Secure or Realm.
      */
     result->f.attrs.secure = is_secure;
+    result->f.attrs.space = ptw->in_space;
 
     switch (mmu_idx) {
     case ARMMMUIdx_Phys_S:
@@ -2869,7 +2895,7 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
 
     default:
         /* Single stage and second stage uses physical for ptw. */
-        ptw->in_ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+        ptw->in_ptw_idx = arm_space_to_phys(ptw->in_space);
         break;
     }
 
@@ -2944,6 +2970,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_secure = is_secure,
+        .in_space = arm_secure_to_space(is_secure),
     };
     return get_phys_addr_with_struct(env, &ptw, address, access_type,
                                      result, fi);
@@ -2953,7 +2980,10 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
-    bool is_secure;
+    S1Translate ptw = {
+        .in_mmu_idx = mmu_idx,
+    };
+    ARMSecuritySpace ss;
 
     switch (mmu_idx) {
     case ARMMMUIdx_E10_0:
@@ -2966,30 +2996,55 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
     case ARMMMUIdx_E2:
-        is_secure = arm_is_secure_below_el3(env);
+        ss = arm_security_space_below_el3(env);
         break;
     case ARMMMUIdx_Stage2:
+        /*
+         * For Secure EL2, we need this index to be NonSecure;
+         * otherwise this will already be NonSecure or Realm.
+         */
+        ss = arm_security_space_below_el3(env);
+        if (ss == ARMSS_Secure) {
+            ss = ARMSS_NonSecure;
+        }
+        break;
     case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
     case ARMMMUIdx_MUser:
-        is_secure = false;
+        ss = ARMSS_NonSecure;
         break;
-    case ARMMMUIdx_E3:
     case ARMMMUIdx_Stage2_S:
     case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_MSPrivNegPri:
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
     case ARMMMUIdx_MSUser:
-        is_secure = true;
+        ss = ARMSS_Secure;
+        break;
+    case ARMMMUIdx_E3:
+        if (arm_feature(env, ARM_FEATURE_AARCH64) &&
+            cpu_isar_feature(aa64_rme, env_archcpu(env))) {
+            ss = ARMSS_Root;
+        } else {
+            ss = ARMSS_Secure;
+        }
+        break;
+    case ARMMMUIdx_Phys_Root:
+        ss = ARMSS_Root;
+        break;
+    case ARMMMUIdx_Phys_Realm:
+        ss = ARMSS_Realm;
         break;
     default:
         g_assert_not_reached();
     }
-    return get_phys_addr_with_secure(env, address, access_type, mmu_idx,
-                                     is_secure, result, fi);
+
+    ptw.in_space = ss;
+    ptw.in_secure = arm_space_is_secure(ss);
+    return get_phys_addr_with_struct(env, &ptw, address, access_type,
+                                     result, fi);
 }
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
@@ -2997,9 +3052,12 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+    ARMSecuritySpace ss = arm_security_space(env);
     S1Translate ptw = {
-        .in_mmu_idx = arm_mmu_idx(env),
-        .in_secure = arm_is_secure(env),
+        .in_mmu_idx = mmu_idx,
+        .in_space = ss,
+        .in_secure = arm_space_is_secure(ss),
         .in_debug = true,
     };
     GetPhysAddrResult res = {};
-- 
2.34.1

