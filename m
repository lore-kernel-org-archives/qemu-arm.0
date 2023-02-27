Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5118904ejc;
        Mon, 27 Feb 2023 15:03:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+wp94vTrDY12kmNsMr5ILwu9O/HKAGi3qL6VJIdZb6WiBgiRVKnCircv8wHr1y0pv/qkpa
X-Received: by 2002:a05:622a:28b:b0:3bf:ba7c:29ca with SMTP id z11-20020a05622a028b00b003bfba7c29camr1825988qtw.32.1677539007421;
        Mon, 27 Feb 2023 15:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677539007; cv=none;
        d=google.com; s=arc-20160816;
        b=dxRrS8GP19qwQk+pfqGNoNOUP2/9i6oZsGK5PABFAcXyZQ4+oPKTiVStya3DpbNaY/
         p0LqhYlteyIloe7y1F1/vk/FHMxBsNK+UcCODkBzFfPMqyUlqScQANMe7eN2bD+78a6o
         oEaZ5f8uRyeXANXjizH2lhdc+MgIajutmgfr2JTFNq5puhzgQshDBP5/LOCifijf5a1a
         cKR8wYxreVfv8h+MEHaP9IO7VFmibcqJzg1hJ8u3z7GwaXd321o8qnmgTQik9Jv4S5my
         gwNm9YIMwHw+dvhj+tb5eduTli6Ac1frFsgkFkNycnVdqne1nDndqZ5dLbbSPf9ibENT
         tQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+kdRMygz3PBTRXyQmo1Q/ab0KJfHnaDCouII/ZdNfRA=;
        b=0TzaeunHhOtoT5LUfy0O6MK2y4IAm6/MzQg/PNzjpZTXmeJFMq6JkzcsVfsrlcGtFG
         /GrvWUKclgkmYhGnwEfGMw3aowYJwWEWQBbTwGYwWEMbAwA/aAo3IgxwWwD7xQNFubRY
         Brwkp42GMq1HwYvym5//9duOVE3Jg2cEzc0f/pTyZmBKkT3UO8xjDQ1NmPVfe0CZjnC5
         qi+Vzhm3g6gmIRDoDWMLXxWIewqmF8zNUwJN7c4h6gtTQTftgqRdIkvzXXGTMLtUBXJx
         16pf+3O6qctKSkdYKD6fsMhognlErxMKUCDTFxa6RNbeGhSt8ccYWlHcudYO83FpGRYR
         RAeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MnOj0FHp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u39-20020a05622a19a700b003b86bbedceasi7913791qtc.400.2023.02.27.15.03.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 15:03:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MnOj0FHp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWmVR-0008Tu-QV; Mon, 27 Feb 2023 18:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmV9-0007to-Kk
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:01:55 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmV5-00012k-Ly
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:01:46 -0500
Received: by mail-pl1-x643.google.com with SMTP id c1so8515302plg.4
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 15:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+kdRMygz3PBTRXyQmo1Q/ab0KJfHnaDCouII/ZdNfRA=;
 b=MnOj0FHp05MXvkBbv6QnV2qjoenuK9BlmTj/RqxiNPUpEgBpVLYYp4UxOmH1FzzscW
 NRnGajrzAepF0wEByzwF6fluvzbuHAPJImPYttFXr3uZXoP2Gwru934Yq69yOz7slkO+
 CwI/meeugI9dvuJVJUK3se0Qx3sqkVWjFy5Kny8h4NPzlDYSLXBCxeUkwn6Zgc3lf2HY
 toA17gX6Q6M4WJrGfywjGft1pzka3wm05h3NKLQgBY8gGfKQ0bYU6FybNDNqFeqxvO9Q
 ywpUEdMsatNR5dIU6lG8I9FTaSMubkTWcOViMsBbq0v2c8fLwuSMHtCjb9Z0sSoFvv9Y
 /k2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+kdRMygz3PBTRXyQmo1Q/ab0KJfHnaDCouII/ZdNfRA=;
 b=vDnLTnMEJe74p4ces/nRk7AERNm/azHe26eslJkpTMvq50I7V2a14wjENx7uIXOeF+
 lhejKwaJCQOZG68h68XlgbVXZQGcCssuZQIzUsWy1wctNKUV2RJmDYjRkedySrm0nDrz
 0lI0P1z7LaSjCpp9xy/SF07mM6n5Jqq6M2CE3dQALsN+1CoE+TOJdY5jl9LKK6nq0W61
 KLD+jAltCzUNFwL2W/tPCrERExk+WmDzMk0skKIW8xcX1Fyat2KbqYcABK3sNmsLUY0k
 EBpHJ4Qg+yGG33enizDNu8Y7SKjQu8SHf9jwWhPdj1F2SjMaZzWFsJGXyBwLx9bipo9i
 e1SQ==
X-Gm-Message-State: AO0yUKXgIiqH4BCvRvbTgZ+v9ILb1++4OJQPw4MZHK8OMqIf3Sy3Ibio
 asw1acl+aJiYzQqcepCUMRPE8w==
X-Received: by 2002:a05:6a20:1603:b0:c7:60ad:9af7 with SMTP id
 l3-20020a056a20160300b000c760ad9af7mr10503149pzj.1.1677538901444; 
 Mon, 27 Feb 2023 15:01:41 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 10/21] target/arm: Pipe ARMSecuritySpace through
 ptw.c
Date: Mon, 27 Feb 2023 13:01:11 -1000
Message-Id: <20230227230122.816702-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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
X-TUID: NBI+cbi31srt

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
index 1a51add39c..75f276b520 100644
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
@@ -294,10 +298,17 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
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
 
@@ -328,7 +339,10 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw,
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
 
@@ -371,7 +385,10 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw,
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
 
@@ -877,6 +894,7 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
          * regime, because the attribute will already be non-secure.
          */
         result->f.attrs.secure = false;
+        result->f.attrs.space = ARMSS_NonSecure;
     }
     result->f.phys_addr = phys_addr;
     return false;
@@ -1581,6 +1599,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * regime, because the attribute will already be non-secure.
          */
         result->f.attrs.secure = false;
+        result->f.attrs.space = ARMSS_NonSecure;
     }
 
     /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
@@ -2365,6 +2384,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
              */
             if (sattrs.ns) {
                 result->f.attrs.secure = false;
+                result->f.attrs.space = ARMSS_NonSecure;
             } else if (!secure) {
                 /*
                  * NS access to S memory must fault.
@@ -2714,6 +2734,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     bool is_secure = ptw->in_secure;
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
+    ARMSecuritySpace ipa_space, s2walk_space;
     bool is_el0;
     uint64_t hcr;
 
@@ -2726,20 +2747,24 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
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
@@ -2827,11 +2852,12 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
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
@@ -2873,7 +2899,7 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
 
     default:
         /* Single stage and second stage uses physical for ptw. */
-        ptw->in_ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+        ptw->in_ptw_idx = arm_space_to_phys(ptw->in_space);
         break;
     }
 
@@ -2948,6 +2974,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_secure = is_secure,
+        .in_space = arm_secure_to_space(is_secure),
     };
     return get_phys_addr_with_struct(env, &ptw, address, access_type,
                                      result, fi);
@@ -2957,7 +2984,10 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
@@ -2970,30 +3000,55 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
@@ -3001,9 +3056,12 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
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

