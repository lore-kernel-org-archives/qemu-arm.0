Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3297099ejc;
        Mon, 23 Jan 2023 16:06:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvrkP3kGhtevPKkHqVl/amNRkpRRTCl0oEutQHoLd3L1HIlB87bgL+fr1TOcp0KCvkm3E7g
X-Received: by 2002:a0c:f84e:0:b0:535:64bb:fea0 with SMTP id g14-20020a0cf84e000000b0053564bbfea0mr19075854qvo.44.1674518806541;
        Mon, 23 Jan 2023 16:06:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674518806; cv=none;
        d=google.com; s=arc-20160816;
        b=tvvnHHk0We2hzDb968pQMW9sKgoAuKBPmtSGlzrr+YXbBNk+u5rWmF+pYMj93mYozV
         1tWiTizWfxWvSezLjpfiaGHuTBIHiUOkFXJh0U++wU5ZLcqTvdeyqB4ygexWGRMQl92i
         rXMB+Sqqf4zLeq8OLHDv76Z3Q5EPvoopQyYeBLZpVw4ECo/Xm41hfmQzxtTnmWcJ137P
         YmGl1/ogC7kYw11U7TIG2+x0JReEP0BqzL+hlm7XtULXehwTHo9fOidgQbPHLp9p/tDO
         QFs7nyp91DLvazfZb6/ekcL7Axy6fI/IU12zCEgfIENrDxSd5Hh6fhkd4tOapyXLl2BN
         p6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OQK/NGma/IRTWGPFRFtlz4+fHNaKcqiMvwODZAjxqzA=;
        b=Jag/INOEJ0bBelvE8a37xEmK3rniDoB26f6vH5NOXNNszKIlG5rP02f4X/P+kF8dBi
         zJn7nDJmzh1KrE99uIaN5QhiGMmNywGmQ2VRqEyVtC2A5YfO6IfSu/1to6DWAUWoQ9TW
         MWARUv8f8OX46QwJKyC9rkuiJBWLPfYZtgshEX1wzQ/BG5dasdVKgJ+Bpzdj51LvMs6w
         RPJFqrCqd/hBHH6KZJuHarzbIwqkiccqG+dEnGngspIOPgbIyMVCErP0y7SrHKxaAfo+
         F/DMMrHcsfo/OyPjdmJvuvRUPjtTWcLNrP63FKpn9WX9S9YU0Nh0AbMet6ockAHlU7kK
         SKyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JOw4wgQV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12-20020ad452ec000000b004b1b507ce87si264718qvu.130.2023.01.23.16.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:06:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JOw4wgQV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pK6kQ-0000R6-3z; Mon, 23 Jan 2023 19:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kO-0000Q1-Sz
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:01:08 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kM-0001sX-Ja
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:01:08 -0500
Received: by mail-pg1-x536.google.com with SMTP id 78so10240524pgb.8
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 16:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OQK/NGma/IRTWGPFRFtlz4+fHNaKcqiMvwODZAjxqzA=;
 b=JOw4wgQVGlCE4gCZCxb89V8g49qAjyHFz2j5iYd93EIwaL7QjQSr2FfOLkty/u3Sov
 kxtzuCLidvAAFDlrVAgq/BfapZAq5lsO+pbwvXoKwpZLFpcvo30lctV6wYqRM7xFgxzV
 zX3ZcJKwfrwrJYFTPzPYGKTG45U4nn51o0+3IPJZYssM//yCVyTK6+wgvXg3T3jjuZ9W
 dQG4YmH07XYEDRHp1mufr/e2tNZF+Ba9QiQO0jcF2F4fS0XUqkVqEu3UhUWvHT3MBIC1
 k7x/mEv+Df7AmsfyIzt4MIdXIMvCDrV8hwzwHeKsoMfAEIHFZmscyUf9rnuKiYf+nyxw
 KA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OQK/NGma/IRTWGPFRFtlz4+fHNaKcqiMvwODZAjxqzA=;
 b=HjfjMo5z3pSH1uITrkiINAhyIUrisKMNDMtsBrGh3Gin1sxTMgK7QvcpJTfg8hjOPC
 K+xJLLF3J2buwKYWT00ijtB7H/jLD4Pu+GsReSnX3wTMhSnRgBoVaWgEhaRQPovE2LHY
 jjEBwK7nrKsw+PzLBj6oAT7NSAZrVzEQYQHKfv7DrNrOdGCprg4zemAmBvMvy6PHIrvJ
 29OgjT+m7kMYmMxcqco3n1xQviiFVbT8ZjIW6+DCfbcaxhm2iXiakqN9P3ZFs85+5/Lg
 34iJnl8RKtq0MEB+/t3PsusqGsrwKAmw5V8SYq0TCtObJN3Ztp1IEVtaZM7UEWuHm4vF
 cEhw==
X-Gm-Message-State: AFqh2koWo/x0ZhdkQLzHTwzSSbA3I+tGQnhf2fnCu6Ib+OVImRWt6vrY
 DuiMlGRmU/QhesmrPsnly9w4Nw==
X-Received: by 2002:a62:1448:0:b0:58d:9588:890b with SMTP id
 69-20020a621448000000b0058d9588890bmr31795568pfu.0.1674518465648; 
 Mon, 23 Jan 2023 16:01:05 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 11/22] target/arm: Pipe ARMSecuritySpace through ptw.c
Date: Mon, 23 Jan 2023 14:00:16 -1000
Message-Id: <20230124000027.3565716-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: AhBZZrM+cQLj

Add input and output space members to S1Translate.
Set and adjust them in S1_ptw_translate, and the
various points at which we drop secure state.
Initialize the space in get_phys_addr; for now
leave get_phys_addr_with_secure considering only
secure vs non-secure spaces.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 95 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 76 insertions(+), 19 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 49b8895a4e..c1b0b8e610 100644
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
@@ -218,6 +220,7 @@ static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
 static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
                              hwaddr addr, ARMMMUFaultInfo *fi)
 {
+    ARMSecuritySpace space = ptw->in_space;
     bool is_secure = ptw->in_secure;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     ARMMMUIdx s2_mmu_idx = ptw->in_ptw_idx;
@@ -234,7 +237,8 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         if (regime_is_stage2(s2_mmu_idx)) {
             S1Translate s2ptw = {
                 .in_mmu_idx = s2_mmu_idx,
-                .in_ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS,
+                .in_ptw_idx = arm_space_to_phys(space),
+                .in_space = space,
                 .in_secure = is_secure,
                 .in_debug = true,
             };
@@ -292,10 +296,17 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
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
 
@@ -326,7 +337,10 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw,
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
 
@@ -369,7 +383,10 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw,
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
 
@@ -875,6 +892,7 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
          * regime, because the attribute will already be non-secure.
          */
         result->f.attrs.secure = false;
+        result->f.attrs.space = ARMSS_NonSecure;
     }
     result->f.phys_addr = phys_addr;
     return false;
@@ -1579,6 +1597,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * regime, because the attribute will already be non-secure.
          */
         result->f.attrs.secure = false;
+        result->f.attrs.space = ARMSS_NonSecure;
     }
 
     /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
@@ -2363,6 +2382,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
              */
             if (sattrs.ns) {
                 result->f.attrs.secure = false;
+                result->f.attrs.space = ARMSS_NonSecure;
             } else if (!secure) {
                 /*
                  * NS access to S memory must fault.
@@ -2712,6 +2732,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     bool is_secure = ptw->in_secure;
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
+    ARMSecuritySpace ipa_space, s2walk_space;
     bool is_el0;
     uint64_t hcr;
 
@@ -2724,20 +2745,24 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
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
@@ -2825,11 +2850,12 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     ARMMMUIdx s1_mmu_idx;
 
     /*
-     * The page table entries may downgrade secure to non-secure, but
-     * cannot upgrade an non-secure translation regime's attributes
-     * to secure.
+     * The page table entries may downgrade secure to NonSecure, but
+     * cannot upgrade a NonSecure translation regime's attributes
+     * to Secure or Realm.
      */
     result->f.attrs.secure = is_secure;
+    result->f.attrs.space = ptw->in_space;
 
     switch (mmu_idx) {
     case ARMMMUIdx_Phys_S:
@@ -2871,7 +2897,7 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
 
     default:
         /* Single stage and second stage uses physical for ptw. */
-        ptw->in_ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+        ptw->in_ptw_idx = arm_space_to_phys(ptw->in_space);
         break;
     }
 
@@ -2946,6 +2972,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_secure = is_secure,
+        .in_space = arm_secure_to_space(is_secure),
     };
     return get_phys_addr_with_struct(env, &ptw, address, access_type,
                                      result, fi);
@@ -2955,7 +2982,10 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
@@ -2968,30 +2998,55 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
@@ -2999,9 +3054,11 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    ARMSecuritySpace ss = arm_security_space(env);
     S1Translate ptw = {
         .in_mmu_idx = arm_mmu_idx(env),
-        .in_secure = arm_is_secure(env),
+        .in_space = ss,
+        .in_secure = arm_space_is_secure(ss),
         .in_debug = true,
     };
     GetPhysAddrResult res = {};
-- 
2.34.1

