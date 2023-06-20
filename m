Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp245035ejt;
        Tue, 20 Jun 2023 05:47:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6BSIDo7f9dkbuYmljHYnZZkcyq57IAn5IxwAIQzw1/IJRAQ2K2o/nkltttsAsonbhEJEja
X-Received: by 2002:a05:6214:2409:b0:62f:effe:3dca with SMTP id fv9-20020a056214240900b0062feffe3dcamr15705365qvb.2.1687265253098;
        Tue, 20 Jun 2023 05:47:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687265253; cv=none;
        d=google.com; s=arc-20160816;
        b=oYgBkXROFa00M/bXIQCNo64j+scZajQ3gxvEbWotEY7+R+GfKESUu+sVKj408hJsqo
         /jYZXFIP7n6fImsMUGuHfU20EORhUWtn1HX2AhvrSWwrMj1EQxakjSuVTLYLoAzPzHVI
         8Sz8ihiH+gbnX2v4s3BNH8hFa1YeeG+iZzqJaRzQLXh4KQBrmrElI2oyrKLdGhRvH2pn
         KiyxpY9mcXez2U6DtwpH8f3idDF6B7eLPyCkmv7emV90zEjpyCBi4B80sffjexOeSPZs
         xgvoqNuHFLSTglW1f3sZMjPsHMzkdCLgdj4oFnj1eccpF54B66bRFlCTcvRzlZyDCv0G
         DvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=64kg+SV3talnh4LFHnsMC7T72wL0UZ7F9UrDoB7T0v4=;
        b=THtjL8HR36wEWn50N/Q1xxw6cbh0AS34bkwADC3eICPHCwPIoXeNoDtXh0P/0i2iO6
         dFi5rUioOQe1zb46mnsJO+rcsBwauOrLUiZ/cyfg8hupMAEz7XIIVmiXjBnW5/pLVtQP
         WbCe0hc0HV52yH0MkaGChz659275ngFgoAGcKbt8PWVuMkfIxv6Zy60mVI/NxkqNq1za
         jnfE3O/mgt7jfxtmPj9Ct4eajvsjld6otNK828x90/NRt0X+YlE327Z4s4tuXzlxHdeM
         aFdK8hNTx/dukh3jeqvS+x0rb2POQeaA3WUCyf0INlofaEZF3kfxkxLp08DXVNhRVe3y
         Bt+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qiCd6TuG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a05621420a400b00631f44eb2fasi772630qvd.489.2023.06.20.05.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 05:47:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qiCd6TuG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBair-0001Zd-Qs; Tue, 20 Jun 2023 08:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBaip-0001WK-6t
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 08:44:35 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBail-0001yb-Ut
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 08:44:34 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-519608ddbf7so4861594a12.2
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 05:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687265070; x=1689857070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64kg+SV3talnh4LFHnsMC7T72wL0UZ7F9UrDoB7T0v4=;
 b=qiCd6TuGpYY1BGBN4nRJvOwXgFSeamKhIAC0Pix7YHeuFNesefdO9xcVTzyZtmL8nJ
 4PAj7Mlf7bg+7E9JzX7edVDcmKCvnnwltVZkYVeisnaou9lWozWMQPZGIONLnZPuehij
 P2BZV45WhNizX6dBaKAKXuAnIOYAwlZUd8DTCOiNFnmRoKVx4djn0isjUjhjm8IZbNxt
 4B9tGmfE8n9xnhcD4kwpPBcaWzudorQRReAvBtz3bR7xK3CtXu/5TCOd6z2JNdUDH8IX
 UPWdaj6VwGqakH2KkgSuhqQ4FVBd1ERy7Gv1op9crVmI+8lovuWNmBenbDMQwsscdxcZ
 sPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687265070; x=1689857070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=64kg+SV3talnh4LFHnsMC7T72wL0UZ7F9UrDoB7T0v4=;
 b=hlxv7ccDR8x4bjTeApOZFuTKdqT5T4eQhoTJ9bVwK8hUOOPwMzIMrHjKD1mRdfzzPH
 hiqwXC/4qRpauHj+Ff7XHJRhAF7ex1DJH2uxAok613wUTxK5hQE79Y/w+BwSHYDBodoh
 f+R/OrUhxSltOZehrWhwtDptqcFuyOdXZvxBfZcP5e0f5pjzzLx3kOxtzH7I9NFKu+Uc
 p6So/FhNAN4GZ8jmeSHOfcSFkbOzzX8F73GpiEZOzGPrYMzQfAAtzVnYTy3e76qB9ekh
 E1enEzpEw/8mHVtNGF9UB1uIfiYIwvVS7+JSBUO3HhnI1iE47JOHsA0rFUXL/F4cHGgP
 crAg==
X-Gm-Message-State: AC+VfDzz/gtapSE5D2m619Vr7vERH8TbB6J6/5qEBEWUzL3ywXU2eD20
 U0sh82v+wPj6vfwu/PgHt2+zPw==
X-Received: by 2002:a05:6402:4d8:b0:50b:d421:a0f1 with SMTP id
 n24-20020a05640204d800b0050bd421a0f1mr6572757edw.41.1687265070511; 
 Tue, 20 Jun 2023 05:44:30 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 w9-20020aa7dcc9000000b0051a313a66e8sm1142541edu.45.2023.06.20.05.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 05:44:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 10/20] target/arm: Pipe ARMSecuritySpace through ptw.c
Date: Tue, 20 Jun 2023 14:44:08 +0200
Message-Id: <20230620124418.805717-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620124418.805717-1-richard.henderson@linaro.org>
References: <20230620124418.805717-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52d.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rtba5Mp+ABWl

Add input and output space members to S1Translate.  Set and adjust
them in S1_ptw_translate, and the various points at which we drop
secure state.  Initialize the space in get_phys_addr; for now leave
get_phys_addr_with_secure considering only secure vs non-secure spaces.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 86 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 71 insertions(+), 15 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f7cbb984f9..e1e7c9a3d2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -21,11 +21,13 @@
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
@@ -249,6 +251,7 @@ static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
 static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
                              hwaddr addr, ARMMMUFaultInfo *fi)
 {
+    ARMSecuritySpace space = ptw->in_space;
     bool is_secure = ptw->in_secure;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     ARMMMUIdx s2_mmu_idx = ptw->in_ptw_idx;
@@ -266,6 +269,9 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
                 .in_mmu_idx = s2_mmu_idx,
                 .in_ptw_idx = ptw_idx_for_stage_2(env, s2_mmu_idx),
                 .in_secure = s2_mmu_idx == ARMMMUIdx_Stage2_S,
+                .in_space = (s2_mmu_idx == ARMMMUIdx_Stage2_S ? ARMSS_Secure
+                             : space == ARMSS_Realm ? ARMSS_Realm
+                             : ARMSS_NonSecure),
                 .in_debug = true,
             };
             GetPhysAddrResult s2 = { };
@@ -277,11 +283,15 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             ptw->out_phys = s2.f.phys_addr;
             pte_attrs = s2.cacheattrs.attrs;
             ptw->out_secure = s2.f.attrs.secure;
+            ptw->out_space = s2.f.attrs.space;
         } else {
             /* Regime is physical. */
             ptw->out_phys = addr;
             pte_attrs = 0;
             ptw->out_secure = s2_mmu_idx == ARMMMUIdx_Phys_S;
+            ptw->out_space = (s2_mmu_idx == ARMMMUIdx_Phys_S ? ARMSS_Secure
+                              : space == ARMSS_Realm ? ARMSS_Realm
+                              : ARMSS_NonSecure);
         }
         ptw->out_host = NULL;
         ptw->out_rw = false;
@@ -303,6 +313,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         ptw->out_rw = full->prot & PAGE_WRITE;
         pte_attrs = full->pte_attrs;
         ptw->out_secure = full->attrs.secure;
+        ptw->out_space = full->attrs.space;
 #else
         g_assert_not_reached();
 #endif
@@ -355,7 +366,10 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw,
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
 
@@ -398,7 +412,10 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw,
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
 
@@ -909,6 +926,7 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
          * regime, because the attribute will already be non-secure.
          */
         result->f.attrs.secure = false;
+        result->f.attrs.space = ARMSS_NonSecure;
     }
     result->f.phys_addr = phys_addr;
     return false;
@@ -1616,6 +1634,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * regime, because the attribute will already be non-secure.
          */
         result->f.attrs.secure = false;
+        result->f.attrs.space = ARMSS_NonSecure;
     }
 
     if (regime_is_stage2(mmu_idx)) {
@@ -2400,6 +2419,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
              */
             if (sattrs.ns) {
                 result->f.attrs.secure = false;
+                result->f.attrs.space = ARMSS_NonSecure;
             } else if (!secure) {
                 /*
                  * NS access to S memory must fault.
@@ -2750,6 +2770,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     bool is_secure = ptw->in_secure;
     bool ret, ipa_secure;
     ARMCacheAttrs cacheattrs1;
+    ARMSecuritySpace ipa_space;
     bool is_el0;
     uint64_t hcr;
 
@@ -2762,10 +2783,12 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
     ipa = result->f.phys_addr;
     ipa_secure = result->f.attrs.secure;
+    ipa_space = result->f.attrs.space;
 
     is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
     ptw->in_mmu_idx = ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
     ptw->in_secure = ipa_secure;
+    ptw->in_space = ipa_space;
     ptw->in_ptw_idx = ptw_idx_for_stage_2(env, ptw->in_mmu_idx);
 
     /*
@@ -2854,11 +2877,12 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
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
@@ -2910,7 +2934,7 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
 
     default:
         /* Single stage uses physical for ptw. */
-        ptw->in_ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+        ptw->in_ptw_idx = arm_space_to_phys(ptw->in_space);
         break;
     }
 
@@ -2985,6 +3009,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_secure = is_secure,
+        .in_space = arm_secure_to_space(is_secure),
     };
     return get_phys_addr_with_struct(env, &ptw, address, access_type,
                                      result, fi);
@@ -2994,7 +3019,10 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
@@ -3007,30 +3035,55 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
@@ -3038,9 +3091,12 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
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

