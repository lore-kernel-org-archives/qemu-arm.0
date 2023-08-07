Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1484041ejb;
        Mon, 7 Aug 2023 07:16:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnm3DNOVNLfvTjNTCQkNr0cGfuRUC0m7l4Zq9eRHlqr/bxt23YxhAMK5+mwvh9lfrsf+XR
X-Received: by 2002:ac8:588f:0:b0:400:98e9:fd78 with SMTP id t15-20020ac8588f000000b0040098e9fd78mr14606854qta.40.1691417773361;
        Mon, 07 Aug 2023 07:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691417773; cv=none;
        d=google.com; s=arc-20160816;
        b=Bs0b/v4hJjmi7HyMwKmVbfif3ZrKVThzamD+78j8EPYFPEOKEcbbMaJlUztrbLctAU
         sEs5GJXIDjSl1vD8rAwLJx+cZVzs2wh024tcrihjqI2KNlg3Afl1KA0hAHTF/rUgt5MJ
         /qqb46Qi3pCN+M7yDWIIhimtmchAH9HhR9MITbKTnd66vOZcwR+yzjKGfhVitzku65GJ
         ykuTLd4lvRfV0Ws0QGj1/uwtzPxAtPGmsjSyzEoCGG06SebwVC2oKW5DqTkkO5fFUMAh
         /i/hc260kQKsLKFUidHPUp2WHfYtaauX/9OS+c6FNorNz4hXoLfvsA2Br3XcE8sphTB0
         iobw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wGPGvej2mg6PydRuAT/KJYpLUQ8OQzMCYsuiZcL8/Tw=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=rHeJKDwOlGAvn8FOXOqkKpBCO8EElb6ET5DCC7FvqHHErl/hvmcNXJXQG+vxlENF4l
         g6d62NoHm1ksYJxs9oN8dE9RhXRuIzupMOp0Z+b2iIkTp9r84k71IRBhE1GDygrYgMbN
         F54wkziU/6JQdl776QeP7vfE6sbm/ltBpfww1aKCM+Y6cji8GKkv/KLTWpShjWXLG+/a
         cjztXpyJBzo/imgE3R0XAI++8SMK0/RRnnXKwc4EK8TRD2KOUGDeuL9Ggy2Y8Sz2/zV3
         be7gahGM4u7paDtUJoO/kkCRA2FYg4GWdigI/LEu5xRUpYALx1qkqKvCZNu5YeKXA8Te
         fA2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G4PRJ3a/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020ac85793000000b0040549498d4esi4904767qta.215.2023.08.07.07.16.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 07:16:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G4PRJ3a/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT11D-0000Ek-Hj; Mon, 07 Aug 2023 10:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT114-00008o-QS
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:28 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT110-0005SY-Gu
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:25 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31781e15a0cso3614708f8f.3
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 07:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691417720; x=1692022520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wGPGvej2mg6PydRuAT/KJYpLUQ8OQzMCYsuiZcL8/Tw=;
 b=G4PRJ3a/72Bdm98BY93etkvweyFsaMUICoC6i85sYEHSUOvnjQPIG4PuIgKRibfoms
 FORfKSDnFm7izdWihlV+k7iEVD7y0UgeSQSuBJ8uj9dxk8xzQ4jEbT1+ixtlEkRjL9lq
 evCnnIdAsd6rfvp8+izrmF3DfnmrllmtR/vzS8h1nb40O+DI88RohjI4EsRCROpmbuii
 01DjCLftGJH0lotQptqP5+HTL3RXfZulY0+y4UJ8oAuUrnAi0UJnV7DB2+RvJdduEJWH
 PE0KrPnKiLg3wqC8L6DI3HcxUwiGUzRbj+wB8l/WgqNSOh69TG2BEDD0LNhH01E5S/49
 cCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691417720; x=1692022520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wGPGvej2mg6PydRuAT/KJYpLUQ8OQzMCYsuiZcL8/Tw=;
 b=IKcT2NE6EpQZQAG8b2OwyWjM+N1XdjssUH/td1ks8HcMOjmchFgXnvED1S//cJKw43
 bLHXvNmjFCHvPgyfWoTn1/kzOiszq+mj1JOuWPv+YUQC5PV7y2J5zcVZ62bc0G0SbxwQ
 3Ow/4/K2MwrbYNeGs52nmmPdkXbkrFsGITLil60vziMlV7gUGE7q5hEZeyOPmVvkTpQh
 PU+zxyGp+iRoUvXd97tLpARnNp4sIK0kF+HtMmD6kvfSuYkpVQvtSrElAO4xJkOQevK+
 PdGirsN0UNaMFUMnMiykRcq8+PWxSvEgMGgaq/HMy1M4PAOzjODPY4J/0jQ9zUPVxGG4
 1zrQ==
X-Gm-Message-State: AOJu0YzcRn0bv2bE5CQKcRtrIKi5AA8yjB/qowM0omg+LyUkeW/C7uYt
 O4V7/fKdjOpQeGQRj8XkHOZHx5mHlWYnlJEgSVY=
X-Received: by 2002:adf:e7cb:0:b0:316:fb39:e045 with SMTP id
 e11-20020adfe7cb000000b00316fb39e045mr5526043wrn.48.1691417719857; 
 Mon, 07 Aug 2023 07:15:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c261400b003fe2ebf479fsm10835617wma.36.2023.08.07.07.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:15:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/15] target/arm/ptw: Pass an ARMSecuritySpace to
 arm_hcr_el2_eff_secstate()
Date: Mon,  7 Aug 2023 15:15:05 +0100
Message-Id: <20230807141514.19075-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230807141514.19075-1-peter.maydell@linaro.org>
References: <20230807141514.19075-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: o3q9wbCxqZ0F

arm_hcr_el2_eff_secstate() takes a bool secure, which it uses to
determine whether EL2 is enabled in the current security state.
With the advent of FEAT_RME this is no longer sufficient, because
EL2 can be enabled for Secure state but not for Root, and both
of those will pass 'secure == true' in the callsites in ptw.c.

As it happens in all of our callsites in ptw.c we either avoid making
the call or else avoid using the returned value if we're doing a
translation for Root, so this is not a behaviour change even if the
experimental FEAT_RME is enabled.  But it is less confusing in the
ptw.c code if we avoid the use of a bool secure that duplicates some
of the information in the ArmSecuritySpace argument.

Make arm_hcr_el2_eff_secstate() take an ARMSecuritySpace argument
instead. Because we always want to know the HCR_EL2 for the
security state defined by the current effective value of
SCR_EL3.{NSE,NS}, it makes no sense to pass ARMSS_Root here,
and we assert that callers don't do that.

To avoid the assert(), we thus push the call to
arm_hcr_el2_eff_secstate() down into the cases in
regime_translation_disabled() that need it, rather than calling the
function and ignoring the result for the Root space translations.
All other calls to this function in ptw.c are already in places
where we have confirmed that the mmu_idx is a stage 2 translation
or that the regime EL is not 3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes v1->v2: instead of having arm_hcr_el2_eff_secstate()
accept space == ARMSS_Root and return 0, have it assert that
Root is not passed, and adjust regime_translation_disabled()
accordingly.
---
 target/arm/cpu.h    |  2 +-
 target/arm/helper.c |  8 +++++---
 target/arm/ptw.c    | 15 +++++++--------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 88e5accda69..bcd65a63ca0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2555,7 +2555,7 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
  * "for all purposes other than a direct read or write access of HCR_EL2."
  * Not included here is HCR_RW.
  */
-uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure);
+uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, ARMSecuritySpace space);
 uint64_t arm_hcr_el2_eff(CPUARMState *env);
 uint64_t arm_hcrx_el2_eff(CPUARMState *env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 50f61e42ca8..9862bc73b52 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5772,11 +5772,13 @@ static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
  * Bits that are not included here:
  * RW       (read from SCR_EL3.RW as needed)
  */
-uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure)
+uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, ARMSecuritySpace space)
 {
     uint64_t ret = env->cp15.hcr_el2;
 
-    if (!arm_is_el2_enabled_secstate(env, secure)) {
+    assert(space != ARMSS_Root);
+
+    if (!arm_is_el2_enabled_secstate(env, arm_space_is_secure(space))) {
         /*
          * "This register has no effect if EL2 is not enabled in the
          * current Security state".  This is ARMv8.4-SecEL2 speak for
@@ -5840,7 +5842,7 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     if (arm_feature(env, ARM_FEATURE_M)) {
         return 0;
     }
-    return arm_hcr_el2_eff_secstate(env, arm_is_secure_below_el3(env));
+    return arm_hcr_el2_eff_secstate(env, arm_security_space_below_el3(env));
 }
 
 /*
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 63dd8e3cbe1..4c60de753dd 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -209,9 +209,9 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
                                         ARMSecuritySpace space)
 {
     uint64_t hcr_el2;
-    bool is_secure = arm_space_is_secure(space);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
+        bool is_secure = arm_space_is_secure(space);
         switch (env->v7m.mpu_ctrl[is_secure] &
                 (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
         case R_V7M_MPU_CTRL_ENABLE_MASK:
@@ -230,18 +230,19 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
         }
     }
 
-    hcr_el2 = arm_hcr_el2_eff_secstate(env, is_secure);
 
     switch (mmu_idx) {
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_Stage2_S:
         /* HCR.DC means HCR.VM behaves as 1 */
+        hcr_el2 = arm_hcr_el2_eff_secstate(env, space);
         return (hcr_el2 & (HCR_DC | HCR_VM)) == 0;
 
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
         /* TGE means that EL0/1 act as if SCTLR_EL1.M is zero */
+        hcr_el2 = arm_hcr_el2_eff_secstate(env, space);
         if (hcr_el2 & HCR_TGE) {
             return true;
         }
@@ -251,6 +252,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
         /* HCR.DC means SCTLR_EL1.M behaves as 0 */
+        hcr_el2 = arm_hcr_el2_eff_secstate(env, space);
         if (hcr_el2 & HCR_DC) {
             return true;
         }
@@ -530,7 +532,6 @@ static bool fault_s1ns(ARMSecuritySpace space, ARMMMUIdx s2_mmu_idx)
 static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
                              hwaddr addr, ARMMMUFaultInfo *fi)
 {
-    bool is_secure = ptw->in_secure;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     ARMMMUIdx s2_mmu_idx = ptw->in_ptw_idx;
     uint8_t pte_attrs;
@@ -587,7 +588,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
     }
 
     if (regime_is_stage2(s2_mmu_idx)) {
-        uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+        uint64_t hcr = arm_hcr_el2_eff_secstate(env, ptw->in_space);
 
         if ((hcr & HCR_PTW) && S2_attrs_are_device(hcr, pte_attrs)) {
             /*
@@ -3066,7 +3067,6 @@ static bool get_phys_addr_disabled(CPUARMState *env,
                                    ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_secure = arm_space_is_secure(ptw->in_space);
     uint8_t memattr = 0x00;    /* Device nGnRnE */
     uint8_t shareability = 0;  /* non-shareable */
     int r_el;
@@ -3112,7 +3112,7 @@ static bool get_phys_addr_disabled(CPUARMState *env,
 
         /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
         if (r_el == 1) {
-            uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+            uint64_t hcr = arm_hcr_el2_eff_secstate(env, ptw->in_space);
             if (hcr & HCR_DC) {
                 if (hcr & HCR_DCT) {
                     memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
@@ -3149,7 +3149,6 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 {
     hwaddr ipa;
     int s1_prot, s1_lgpgsz;
-    bool is_secure = ptw->in_secure;
     ARMSecuritySpace in_space = ptw->in_space;
     bool ret, ipa_secure;
     ARMCacheAttrs cacheattrs1;
@@ -3212,7 +3211,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     }
 
     /* Combine the S1 and S2 cache attributes. */
-    hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+    hcr = arm_hcr_el2_eff_secstate(env, in_space);
     if (hcr & HCR_DC) {
         /*
          * HCR.DC forces the first stage attributes to
-- 
2.34.1

